package savagerifts.controller;

import org.apache.commons.collections4.IteratorUtils;
import org.apache.commons.collections4.ListValuedMap;
import org.apache.commons.collections4.multimap.ArrayListValuedHashMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import savagerifts.interceptor.SheetOwner;
import savagerifts.model.edge.Edge;
import savagerifts.model.edge.EdgeCategoryType;
import savagerifts.model.sheet.*;
import savagerifts.repository.EdgeRepository;
import savagerifts.repository.SheetRepository;
import savagerifts.request.AttributeBuyRequest;
import savagerifts.request.SkillBuyRequest;
import savagerifts.security.BadRequestException;
import savagerifts.util.AuthUtils;
import savagerifts.util.SheetCreationManager;
import savagerifts.util.SheetEdgePurchaseManager;
import savagerifts.util.SheetUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.Collection;
import java.util.List;
import java.util.Map;

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
		Sheet sheet = AuthUtils.getSheet(request);
		
		if (sheet.getRemainingHindrancePoints() != 0) {
			throw new BadRequestException("The remaining " + sheet.getRemainingHindrancePoints() + " points from hindrances must be spent first");
		}
		
		new SheetCreationManager(sheet).moveToNextCreationStep();
		
		return new ResponseEntity(HttpStatus.OK);
	}
	
	// gets all the edge options that aren't already bought, and are qualified for by the sheet
	@SheetOwner(requiredSteps = {SheetCreationStep.EDGES})
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/edges/", method = RequestMethod.GET)
	public Map<EdgeCategoryType, Collection<Edge>> getEdgeBonusChoices() {
		Sheet sheet = AuthUtils.getSheet(request);

        List<Edge> edges = IteratorUtils.toList(edgeRepository.findAll().iterator());
        for (EdgeSelection edgeSelection : sheet.getChosenEdgeSelections()) {
			edges.remove(edgeSelection.getEdge());
        }

		// loop through each edge, determine if sheet qualifies for it
		ListValuedMap<EdgeCategoryType, Edge> qualifiedEdgesMultiMap = new ArrayListValuedHashMap<>();
        SheetEdgePurchaseManager edgeManager = new SheetEdgePurchaseManager(sheet);
		for (Edge edge : edges) {
			if (edgeManager.sheetQualifiesForEdge(edge, true)) {
				qualifiedEdgesMultiMap.put(edge.getEdgeCategoryType(), edge);
			}
		}

		return qualifiedEdgesMultiMap.asMap();
	}
	
	@SheetOwner(requiredSteps = {SheetCreationStep.EDGES})
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/edges/{edgeId}/", method = RequestMethod.PUT)
	public ResponseEntity<?> purchaseEdge(@PathVariable Long edgeId) {
		Sheet sheet = AuthUtils.getSheet(request);
		Edge edge = edgeRepository.findOne(edgeId);
		
		// validate that the sheet can afford to purchase an edge
		if (sheet.getRemainingHindrancePoints() < SheetUtils.EDGE_RAISE_COST) {
			throw new BadRequestException("Sheet only has " + sheet.getRemainingHindrancePoints() + " hindrance points, needs " + SheetUtils.EDGE_RAISE_COST + " to purchase edge");
		}

		// validate the given edge exists
		if (edge == null) {
			throw new BadRequestException("The given edge doesn't exist.");
		}
		
		// validate sheet doesn't already own this edge, and can afford
		for (EdgeSelection edgeSelection : sheet.getChosenEdgeSelections()) {
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
		sheet.getChosenEdgeSelections().add(edgeSelection);

		sheet.setRemainingHindrancePoints(sheet.getRemainingHindrancePoints() - SheetUtils.EDGE_RAISE_COST);

		sheetRepository.save(sheet);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@SheetOwner(requiredSteps = {SheetCreationStep.EDGES})
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/edges/{edgeRaiseId}/", method = RequestMethod.DELETE)
	public ResponseEntity<?> removeEdgeRaise(@PathVariable Long edgeRaiseId) {
		Sheet sheet = AuthUtils.getSheet(request);
		
		EdgeSelection edgeSelection = null;
		for (EdgeSelection edge : sheet.getChosenEdgeSelections()) {
			if (edge.getId().equals(edgeRaiseId)) {
				edgeSelection = edge;
				break;
			}
		}
		if (edgeSelection == null) {
			throw new BadRequestException();
		}
		
		sheet.getChosenEdgeSelections().remove(edgeSelection);

		sheet.setRemainingHindrancePoints(sheet.getRemainingHindrancePoints() + SheetUtils.EDGE_RAISE_COST);

		sheetRepository.save(sheet);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@SheetOwner(requiredSteps = {SheetCreationStep.EDGES})
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/attributes/", method = RequestMethod.PUT)
	public ResponseEntity<?> purchaseAttributeRaise(@RequestBody AttributeBuyRequest attributeBuyRequest) {
		Sheet sheet = AuthUtils.getSheet(request);

		// validate the given request, throws exception if invalid
		attributeBuyRequest.validate();

		// validate sheet can afford
		if (sheet.getRemainingHindrancePoints() < SheetUtils.ATTR_RAISE_COST) {
			throw new BadRequestException("Sheet only has " + sheet.getRemainingHindrancePoints() + " hindrance points, needs " + SheetUtils.ATTR_RAISE_COST + " to purchase attribute");
		}
		
		AttributeRaiseSelection attributeRaiseSelection = new AttributeRaiseSelection();
		attributeRaiseSelection.setSheet(sheet);
		attributeRaiseSelection.setAttributeType(attributeBuyRequest.getAttribute());
		sheet.getChosenAttributeRaises().add(attributeRaiseSelection);

		sheet.setRemainingHindrancePoints(sheet.getRemainingHindrancePoints() - SheetUtils.ATTR_RAISE_COST);

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

		sheet.setRemainingHindrancePoints(sheet.getRemainingHindrancePoints() + SheetUtils.ATTR_RAISE_COST);

		sheetRepository.save(sheet);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@SheetOwner(requiredSteps = {SheetCreationStep.EDGES})
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/skills/", method = RequestMethod.PUT)
	public ResponseEntity<?> purchaseSkillRaise(@RequestBody SkillBuyRequest skillBuyRequest) {
		Sheet sheet = AuthUtils.getSheet(request);

		// validate the given request
		skillBuyRequest.validate();

		// validate sheet can afford
		if (sheet.getRemainingHindrancePoints() < SheetUtils.SKILL_RAISE_COST) {
			throw new BadRequestException("Sheet only has " + sheet.getRemainingHindrancePoints() + " hindrance points, needs " + SheetUtils.SKILL_RAISE_COST + " to purchase skill");
		}

		SkillRaiseSelection skillRaiseSelection = new SkillRaiseSelection();
		skillRaiseSelection.setSheet(sheet);
		skillRaiseSelection.setSkillType(skillBuyRequest.getSkill());
		skillRaiseSelection.setSkillKnowledge(skillBuyRequest.getSkillKnowledge());
		sheet.getChosenSkillRaises().add(skillRaiseSelection);

		sheet.setRemainingHindrancePoints(sheet.getRemainingHindrancePoints() - SheetUtils.ATTR_RAISE_COST);

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