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
import savagerifts.response.BonusesResponse;
import savagerifts.util.AuthUtils;

import javax.servlet.http.HttpServletRequest;

@RestController
public class SheetBonusesController {
	
	@Autowired
	private EdgeRepository edgeRepository;

	@Autowired
	private SheetRepository sheetRepository;

	@Autowired
	private HttpServletRequest request;
	
	// gets all the options for the sheet's choices
	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/", method = RequestMethod.GET)
	public BonusesResponse getBonuses() {
		Sheet sheet = AuthUtils.getSheet(request);
		
		Iterable<Edge> edges = edgeRepository.findAll();
		
		for (EdgeSelection edge : sheet.getChosenEdges()) {
//			edges.remove(edge);
		}
		// edges that aren't already bought, and are qualified for
		// if you can take another money?
		
		BonusesResponse response = new BonusesResponse();
		response.setEdges(edges);
		response.setPointsRemaining(sheet.getRemainingHindrancePoints());
		
		return response;
	}
	
	// finalizes edge buy step
	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/", method = RequestMethod.POST)
	public ResponseEntity<?> finalizeBonusesPurchases() {
		return null;
	}
	
	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/edges/{edgeId}/", method = RequestMethod.PUT)
	public ResponseEntity<?> purchaseEdge(@PathVariable Long edgeId) {
		Sheet sheet = AuthUtils.getSheet(request);
		
		// validate sheet is in edge buy step
		// validate the given edge
		edgeRepository.findOne(edgeId);
		// validate sheet doesn't already own this edge, and can afford
		
		EdgeSelection edgeSelection = new EdgeSelection();
		sheet.getChosenEdges().add(edgeSelection);
		
		sheetRepository.save(sheet);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/edges/{edgeRaiseId}/", method = RequestMethod.DELETE)
	public ResponseEntity<?> removeEdgeRaise(@PathVariable Long edgeRaiseId) {
		return null;
	}
	
	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/attributes/", method = RequestMethod.PUT)
	public ResponseEntity<?> purchaseAttributeRaise(@RequestBody AttributeBuyRequest attributeBuyRequest) {
		Sheet sheet = AuthUtils.getSheet(request);
		
		// validate sheet is in edge buy step
		// validate the given request
		// validate sheet can afford
		
		AttributeRaiseSelection attributeRaiseSelection = new AttributeRaiseSelection();
		sheet.getChosenAttributeRaises().add(attributeRaiseSelection);
		
		sheetRepository.save(sheet);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/attributes/{attributeRaiseId}/", method = RequestMethod.DELETE)
	public ResponseEntity<?> removeAttributeRaise(@PathVariable Long attributeRaiseId) {
		return null;
	}
	
	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/skills/", method = RequestMethod.PUT)
	public ResponseEntity<?> purchaseSkillRaise(@RequestBody SkillBuyRequest skillBuyRequest) {
		Sheet sheet = AuthUtils.getSheet(request);
		
		// validate sheet is in edge buy step
		// validate the given request
		// validate sheet can afford
		
		SkillRaiseSelection skillRaiseSelection = new SkillRaiseSelection();
		sheet.getChosenSkillRaises().add(skillRaiseSelection);
		
		sheetRepository.save(sheet);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/skills/{skillRaiseId}/", method = RequestMethod.DELETE)
	public ResponseEntity<?> removeSkillRaise(@PathVariable Long skillRaiseId) {
		return null;
	}
	
	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/money/", method = RequestMethod.PUT)
	public ResponseEntity<?> purchaseMoneyRaise() {
		Sheet sheet = AuthUtils.getSheet(request);
		
		// validate sheet is in edge buy step
		// validate sheet can afford
		
		MoneyRaiseSelection moneyRaiseSelection = new MoneyRaiseSelection();
		sheet.getChosenMoneyRaises().add(moneyRaiseSelection);
		
		sheetRepository.save(sheet);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	// removes one money raise from the sheet. which one doesn't matter, they're the same
	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/money/", method = RequestMethod.DELETE)
	public ResponseEntity<?> removeMoneyRaise() {
		return null;
	}
	
}