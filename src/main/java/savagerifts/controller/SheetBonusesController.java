package savagerifts.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import savagerifts.interceptor.SheetOwner;
import savagerifts.model.DieType;
import savagerifts.model.benefittable.BenefitTable;
import savagerifts.model.benefittable.BenefitTableRoll;
import savagerifts.model.benefittable.PerkRange;
import savagerifts.model.framework.Framework;
import savagerifts.model.hindrance.Hindrance;
import savagerifts.model.perk.Perk;
import savagerifts.model.perk.PerkSelection;
import savagerifts.model.race.Race;
import savagerifts.model.sheet.Sheet;
import savagerifts.model.sheet.SheetCreationStep;
import savagerifts.model.user.User;
import savagerifts.repository.*;
import savagerifts.request.*;
import savagerifts.response.AttributeBuyResponse;
import savagerifts.response.HindranceBuyResponse;
import savagerifts.response.PerkSelectionResponse;
import savagerifts.response.SkillBuyResponse;
import savagerifts.security.BadRequestException;
import savagerifts.util.AuthUtils;
import savagerifts.util.RandomUtils;
import savagerifts.util.SheetUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
public class SheetController {
	
	// gets all the options for the sheet's choices
	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/", method = RequestMethod.GET)
	public BonusesResponse getBonuses() {
		// edges that aren't already bought, and are qualified for
		// if you can take another money?
	}
	
	// finalizes edge buy step
	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/", method = RequestMethod.POST)
	public ResponseEntity<?> finalizeBonusesPurchases() {
		
	}
	
	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/edges/{edgeId}/", method = RequestMethod.PUT)
	public ResponseEntity<?> purchaseEdge(@PathVariable Long edgeId) {
		Sheet sheet = AuthUtils.getSheet(request);
		
		// validate sheet is in edge buy step
		// validate the given edge
		edgeRepository.findById(edgeId);
		// validate sheet doesn't already own this edge, and can afford
		
		EdgeSelection edgeSelection = new EdgeSelection();
		sheet.getChosenEdges().add(edgeSelection);
		
		sheetRepository.save(sheet);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/edges/{edgeRaiseId}/", method = RequestMethod.DELETE)
	public ResponseEntity<?> removeAttributeRaise(@PathVariable Long edgeRaiseId) {
		
	}
	
	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/attributes/", method = RequestMethod.PUT)
	public ResponseEntity<?> purchaseAttributeRaise(@RequestBody AttributeBuyRequest) {
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
		
	}
	
	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/bonuses/skills/", method = RequestMethod.PUT)
	public ResponseEntity<?> purchaseSkillRaise(@RequestBody SkillBuyRequest) {
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
		
	}
	
}