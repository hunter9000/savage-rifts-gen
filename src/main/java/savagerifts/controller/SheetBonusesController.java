package savagerifts.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import savagerifts.interceptor.SheetOwner;
import savagerifts.model.edge.Edge;
import savagerifts.model.sheet.*;
import savagerifts.repository.EdgeRepository;
import savagerifts.repository.SheetRepository;
import savagerifts.request.AttributeBuyRequest;
import savagerifts.request.SkillBuyRequest;
import savagerifts.security.BadRequestException;
import savagerifts.util.AuthUtils;
import savagerifts.util.SheetEdgePurchaseManager;
import savagerifts.util.SheetUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@RestController
public class SheetBonusesController {
	
	@Autowired
	private EdgeRepository edgeRepository;

	@Autowired
	private SheetRepository sheetRepository;

	@Autowired
	private HttpServletRequest request;
	
	// finalizes edge buy step
	@SheetOwner(requiredSteps = {SheetCreationStep.EDGES})
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/", method = RequestMethod.POST)
	public ResponseEntity<?> finalizeBonusesPurchases() {
		return null;
	}
	
	// gets all the edge options that aren't already bought, and are qualified for by the sheet
	@SheetOwner(requiredSteps = {SheetCreationStep.EDGES})
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/edges/", method = RequestMethod.GET)
	public Iterable<Edge> getEdgeBonusChoices() {
		Sheet sheet = AuthUtils.getSheet(request);

		// validate sheet is in edge buy step
//		if (sheet.getCreationStep() != SheetCreationStep.EDGES) {
//			throw new BadRequestException();
//		}

        List<Edge> edges = new ArrayList<>();
        for (Edge edge : edgeRepository.findAll()) {
            if (!sheet.getChosenEdges().contains(edge)) {
                edges.add(edge);
            }
        }

		// loop through each edge, determine if sheet qualifies for it
		List<Edge> qualifiedEdges = new ArrayList<>();
        SheetEdgePurchaseManager edgeManager = new SheetEdgePurchaseManager(sheet);
		for (Edge edge : edges) {
			if (edgeManager.sheetQualifiesForEdge(edge, true)) {
				qualifiedEdges.add(edge);
			}
		}

		return qualifiedEdges;
	}
	
	@SheetOwner(requiredSteps = {SheetCreationStep.EDGES})
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/edges/{edgeId}/", method = RequestMethod.PUT)
	public ResponseEntity<?> purchaseEdge(@PathVariable Long edgeId) {
		Sheet sheet = AuthUtils.getSheet(request);

		// validate sheet is in edge buy step
//		if (sheet.getCreationStep() != SheetCreationStep.EDGES) {
//			throw new BadRequestException();
//		}

		// validate the given edge exists
		Edge edge = edgeRepository.findOne(edgeId);
		if (edge == null) {
			throw new BadRequestException("The given edge doesn't exist.");
		}
		// validate sheet doesn't already own this edge, and can afford
		for (EdgeSelection edgeSelection : sheet.getChosenEdges()) {
			if (edgeSelection.getEdge().equals(edge)) {
				throw new BadRequestException("This sheet already has the given edge.");
			}
		}

		if (!new SheetEdgePurchaseManager(sheet).sheetQualifiesForEdge(edge, true)) {
			throw new BadRequestException("This sheet does not qualify for the given edge");
		}

		EdgeSelection edgeSelection = new EdgeSelection();
		edgeSelection.setEdge(edge);
		edgeSelection.setSheet(sheet);
		sheet.getChosenEdges().add(edgeSelection);
		
		sheetRepository.save(sheet);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@SheetOwner(requiredSteps = {SheetCreationStep.EDGES})
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/edges/{edgeRaiseId}/", method = RequestMethod.DELETE)
	public ResponseEntity<?> removeEdgeRaise(@PathVariable Long edgeRaiseId) {
		Sheet sheet = AuthUtils.getSheet(request);
		
		EdgeSelection edgeSelection = null;
		for (EdgeSelection edge : sheet.getChosenEdges()) {
			if (edge.getId().equals(edgeRaiseId)) {
				edgeSelection = edge;
				break;
			}
		}
		if (edgeSelection == null) {
			throw new BadRequestException();
		}
		
		sheet.getChosenEdges().remove(edgeSelection);
		sheetRepository.save(sheet);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@SheetOwner(requiredSteps = {SheetCreationStep.EDGES})
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/attributes/", method = RequestMethod.PUT)
	public ResponseEntity<?> purchaseAttributeRaise(@RequestBody AttributeBuyRequest attributeBuyRequest) {
		Sheet sheet = AuthUtils.getSheet(request);

		// validate the given request
		// validate sheet can afford
		
		AttributeRaiseSelection attributeRaiseSelection = new AttributeRaiseSelection();
		sheet.getChosenAttributeRaises().add(attributeRaiseSelection);
		
		sheetRepository.save(sheet);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@SheetOwner(requiredSteps = {SheetCreationStep.EDGES})
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/attributes/{attributeRaiseId}/", method = RequestMethod.DELETE)
	public ResponseEntity<?> removeAttributeRaise(@PathVariable Long attributeRaiseId) {
		Sheet sheet = AuthUtils.getSheet(request);
		
		AttributeRaiseSelection attrSelection = null;
		for (AttributeRaiseSelection attr : sheet.getChosenAttributeRaises()) {
			if (attr.getId().equals(attributeRaiseId)) {
				attrSelection = attr;
				break;
			}
		}
		if (attrSelection == null) {
			throw new BadRequestException();
		}
		
		sheet.getChosenAttributeRaises().remove(attrSelection);
		sheetRepository.save(sheet);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@SheetOwner(requiredSteps = {SheetCreationStep.EDGES})
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/skills/", method = RequestMethod.PUT)
	public ResponseEntity<?> purchaseSkillRaise(@RequestBody SkillBuyRequest skillBuyRequest) {
		Sheet sheet = AuthUtils.getSheet(request);

		// validate the given request
		// validate sheet can afford
		
		SkillRaiseSelection skillRaiseSelection = new SkillRaiseSelection();
		sheet.getChosenSkillRaises().add(skillRaiseSelection);
		
		sheetRepository.save(sheet);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@SheetOwner(requiredSteps = {SheetCreationStep.EDGES})
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/skills/{skillRaiseId}/", method = RequestMethod.DELETE)
	public ResponseEntity<?> removeSkillRaise(@PathVariable Long skillRaiseId) {
		Sheet sheet = AuthUtils.getSheet(request);

		SkillRaiseSelection skillSelection = null;
		for (SkillRaiseSelection skill : sheet.getChosenSkillRaises()) {
			if (skill.getId().equals(skillRaiseId)) {
				skillSelection = skill;
				break;
			}
		}
		if (skillSelection == null) {
			throw new BadRequestException();
		}
		
		sheet.getChosenSkillRaises().remove(skillSelection);
		sheetRepository.save(sheet);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@SheetOwner(requiredSteps = {SheetCreationStep.EDGES})
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/money/", method = RequestMethod.PUT)
	public ResponseEntity<?> purchaseMoneyRaise() {
		Sheet sheet = AuthUtils.getSheet(request);
		
		// validate sheet can afford
		if (sheet.getRemainingHindrancePoints() < SheetUtils.MONEY_RAISE_COST) {
			throw new BadRequestException();
		}

		MoneyRaiseSelection moneyRaiseSelection = new MoneyRaiseSelection();
		sheet.getChosenMoneyRaises().add(moneyRaiseSelection);

		sheet.setRemainingHindrancePoints(sheet.getRemainingHindrancePoints() - SheetUtils.MONEY_RAISE_COST);

		sheetRepository.save(sheet);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	// removes one money raise from the sheet. which one doesn't matter, they're the same
	@SheetOwner(requiredSteps = {SheetCreationStep.EDGES})
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/money/", method = RequestMethod.DELETE)
	public ResponseEntity<?> removeMoneyRaise() {
		Sheet sheet = AuthUtils.getSheet(request);

		if (sheet.getChosenSkillRaises().isEmpty()) {
			throw new BadRequestException();
		}

		sheet.getChosenSkillRaises().remove(0);
		sheet.setRemainingHindrancePoints(sheet.getRemainingHindrancePoints() + SheetUtils.MONEY_RAISE_COST);

		sheetRepository.save(sheet);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
}