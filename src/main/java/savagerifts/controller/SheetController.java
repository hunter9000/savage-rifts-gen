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

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private SheetRepository sheetRepository;

    @Autowired
    private FrameworkRepository frameworkRepository;
	
    @Autowired
    private PerkRepository perkRepository;

    @Autowired
    private PerkSelectionRepository perkSelectionRepository;

	@Autowired
	private RaceRepository raceRepository;

	@Autowired
	private HindranceRepository hindranceRepository;

    @Autowired
    private HttpServletRequest request;


    /** Create new sheet with given name and framework */
    @RequestMapping(value="/api/sheet/", method= RequestMethod.POST)
    public ResponseEntity<?> createSheet(@RequestBody NewSheetRequest sheetRequest) {
        User owner = AuthUtils.getLoggedInUser(request);

        if (!sheetRequest.validate()) {
            throw new BadRequestException();
        }

        Framework framework = frameworkRepository.findOne(sheetRequest.frameworkId);
        if (framework == null) {
            throw new BadRequestException();
        }

		Sheet sheet = SheetUtils.createSheet(owner, sheetRequest, framework);
		
        sheetRepository.save(sheet);

        return new ResponseEntity<>(HttpStatus.OK);
    }

	/** Delete a sheet */
	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/", method = RequestMethod.DELETE)
	public ResponseEntity<?> deleteSheet(@PathVariable long sheetId) {
		Sheet sheet = AuthUtils.getSheet(request);

		sheetRepository.delete(sheet);

		return new ResponseEntity<>(HttpStatus.OK);
	}
	
    /** Get all sheets belonging to user */
    @RequestMapping(value="/api/sheet/", method= RequestMethod.GET)
    public List<Sheet> getSheets() {
        User owner = AuthUtils.getLoggedInUser(request);
        return sheetRepository.findByOwner(owner);
    }

    /** Get a specific sheet */
    @SheetOwner
    @RequestMapping(value="/api/sheet/{sheetId}/", method=RequestMethod.GET)
    public Sheet getSheet(@PathVariable long sheetId) {
        return AuthUtils.getSheet(request);     // the sheet is retrieved by the SheetOwnerInterceptor
    }

	/** Select the race for this sheet */
	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/race/{raceId}/", method = RequestMethod.POST)
	public Sheet selectRace(@PathVariable long raceId) {
		Sheet sheet = AuthUtils.getSheet(request);
		
		if (sheet.getRace() != null) {
			throw new BadRequestException();
		}
		
		Race race = raceRepository.findOne(raceId);
		if (race == null) {
			throw new BadRequestException();
		}
		
		sheet.setRace(race);
		SheetUtils.recalculateAttributes(sheet);
		SheetUtils.moveToNextCreationStep(sheet);

		sheetRepository.save(sheet);
		
		return sheet;
	}

	/** Get the current attributes with info about inc/dec and cost. */
	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/attributes/", method = RequestMethod.GET)
	public AttributeBuyResponse getAttributeBuy() {
		Sheet sheet = AuthUtils.getSheet(request);

		AttributeBuyResponse attributes = SheetUtils.calculateAttributePurchases(sheet);

		return attributes;
	}

	/** Increase or decrease the given attributes */
	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/attributes/", method = RequestMethod.PUT)
	public AttributeBuyResponse increaseDecreaseAttributeBuy(@RequestBody AttributeBuyRequest pointBuyRequest) {
		Sheet sheet = AuthUtils.getSheet(request);

		// make the change, returns false if the change isn't valid
		if (!SheetUtils.validateAndMakeAttributeChange(sheet, pointBuyRequest)) {
			throw new BadRequestException();
		}

		sheetRepository.save(sheet);

		// recreate the attributes after the change
		AttributeBuyResponse attributes = SheetUtils.calculateAttributePurchases(sheet);

		return attributes;
	}

	/** Finish attribute point buy. remaining points must be 0 */
	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/attributes/", method = RequestMethod.POST)
	public ResponseEntity<?> finishAttributeBuy() {
		Sheet sheet = AuthUtils.getSheet(request);

		SheetUtils.moveToNextCreationStep(sheet);

		sheetRepository.save(sheet);

		return new ResponseEntity<>(HttpStatus.OK);
	}

	/** Get the current skills with info about inc/dec and cost. */
	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/skills/", method = RequestMethod.GET)
	public SkillBuyResponse getSkillBuy() {
		Sheet sheet = AuthUtils.getSheet(request);

		SkillBuyResponse skills = SheetUtils.calculateSkillPurchases(sheet);

		return skills;
	}

	/** Increase or decrease the given skill die roll */
	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/skills/", method = RequestMethod.PUT)
	public SkillBuyResponse increaseDecreseSkillBuy(@RequestBody SkillBuyRequest skillBuyRequest) {
		Sheet sheet = AuthUtils.getSheet(request);

		// make the change, returns false if the change isn't valid
		if (!SheetUtils.validateAndMakeSkillChange(sheet, skillBuyRequest)) {
			throw new BadRequestException();
		}

		sheetRepository.save(sheet);

		// recreate the attributes after the change
		SkillBuyResponse skills = SheetUtils.calculateSkillPurchases(sheet);

		return skills;
	}

	/** Finish purchasing skills. */
	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/skills/", method = RequestMethod.POST)
	public ResponseEntity<?> finishSkillPurchases() {
		Sheet sheet = AuthUtils.getSheet(request);

		if (sheet.getCreationStep() == SheetCreationStep.SKILLS) {
			SheetUtils.moveToNextCreationStep(sheet);
		}
		sheetRepository.save(sheet);

		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	/** Get the current hindrances with info about inc/dec and cost. */
	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/hindrances/", method = RequestMethod.GET)
	public HindranceBuyResponse getHindranceBuy() {
		Sheet sheet = AuthUtils.getSheet(request);

		HindranceBuyResponse skills = SheetUtils.calculateHindrancePurchases(sheet);

		return skills;
	}

	/** Get the current hindrances with info about inc/dec and cost. */
	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/hindrances/", method = RequestMethod.PUT)
	public HindranceBuyResponse increaseDecreaseHindranceBuy(@RequestBody HindranceBuyRequest hindranceBuyRequest) {
		Sheet sheet = AuthUtils.getSheet(request);

		Hindrance hindrance = hindranceRepository.findByType(hindranceBuyRequest.getHindranceType());
		
		// make the change, returns false if the change isn't valid
		if (!SheetUtils.validateAndMakeHindranceChange(sheet, hindrance, hindranceBuyRequest)) {
			throw new BadRequestException();
		}

		sheetRepository.save(sheet);

		// recreate the hindrances after the change
		HindranceBuyResponse hindrances = SheetUtils.calculateHindrancePurchases(sheet);

		return hindrances;
	}

	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/hindrances/", method = RequestMethod.POST)
	public ResponseEntity<?> finishHindracePurchases() {
		Sheet sheet = AuthUtils.getSheet(request);

		if (sheet.getCreationStep() != SheetCreationStep.HINDRANCES) {
			throw new BadRequestException();		// can't call this on this sheet
		}
		
		if (sheet.getCreationStep() == SheetCreationStep.HINDRANCES) {
			SheetUtils.moveToNextCreationStep(sheet);
		}
		if (sheet.getCreationStep() == SheetCreationStep.EDGES && sheet.getRemainingHindrancePoints() == 0) {
			SheetUtils.moveToNextCreationStep(sheet);
		}
		sheetRepository.save(sheet);

		return new ResponseEntity<>(HttpStatus.OK);
	}
}
