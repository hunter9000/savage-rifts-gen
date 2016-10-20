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
import savagerifts.model.perk.Perk;
import savagerifts.model.perk.PerkSelection;
import savagerifts.model.race.Race;
import savagerifts.model.sheet.Sheet;
import savagerifts.model.sheet.SheetCreationStep;
import savagerifts.model.user.User;
import savagerifts.repository.*;
import savagerifts.request.NewSheetRequest;
import savagerifts.request.PerkSwapRequest;
import savagerifts.request.AttributeBuyRequest;
import savagerifts.request.SkillBuyRequest;
import savagerifts.response.AttributeBuyResponse;
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
	private BenefitTableRepository benefitTableRepository;

    @Autowired
    private PerkRepository perkRepository;

    @Autowired
    private PerkSelectionRepository perkSelectionRepository;

	@Autowired
	private RaceRepository raceRepository;

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

    /** Get the sheet's available table rolls, as array of tablerolls with arrays of tables */
    @SheetOwner
    @RequestMapping(value = "/api/sheet/{sheetId}/tableroll/", method=RequestMethod.GET)
    public List<BenefitTableRoll> getAvailableTableRolls(@PathVariable long sheetId) {
        Sheet sheet = AuthUtils.getSheet(request);

        List<BenefitTableRoll> frameworkRolls = sheet.getFramework().getTableRolls();

        // remove all the rolls that have been made already from the list of framework rolls
        List<PerkSelection> chosenPerks = sheet.getChosenPerks();
        for (PerkSelection perk : chosenPerks) {
            BenefitTableRoll chosenRoll = perk.getRoll();
            frameworkRolls.remove(chosenRoll);
        }
        return frameworkRolls;
    }

	/** Make the roll on this table for the given tableroll, returning the selected perk */
	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/tableroll/{tableId}/{rollNumber}/", method=RequestMethod.POST)
	public PerkSelectionResponse makeRollOnTable(@PathVariable Long sheetId, @PathVariable Long tableId, @PathVariable Integer rollNumber) {
		Sheet sheet = AuthUtils.getSheet(request);
		
		BenefitTable table = benefitTableRepository.findOne(tableId);
		if (table == null) {
			throw new BadRequestException();
		}
		
		BenefitTableRoll tableRoll = null;
		for (BenefitTableRoll roll : sheet.getFramework().getTableRolls()) {
			if (roll.getRollNumber().equals(rollNumber)) {
				tableRoll = roll; break;
			}
		}
		if (tableRoll == null) {
			throw new BadRequestException();
		}

        // make sure this isn't a tableroll that the player has already made
        for (PerkSelection selection : sheet.getChosenPerks()) {
            if (selection.getRoll().equals(tableRoll)) {
                throw new BadRequestException();
            }
        }
		
		// get the list of perk ranges that the user doesn't already have
		List<PerkRange> perkRanges = table.getPerkRanges();
		List<PerkSelection> selectedPerks = sheet.getChosenPerks();
		for (PerkSelection perk : selectedPerks) {
			for (PerkRange range : perkRanges) {
				if (range.getPerk().equals(perk) ) {
					perkRanges.remove(range);
					continue;
				}
			}
		}
		
		// make sure there is at least one
		if (perkRanges.isEmpty()) {
			throw new BadRequestException();
		}

        // perkRanges has only the ranges the player can roll, keep rolling until you hit one
		PerkRange chosenPerkRange = null;
        do {
            int roll = RandomUtils.getResultOfDieType(DieType.D20);

            System.out.println("rolled " + roll + " on table ");

            for (PerkRange range : perkRanges) {
                if (range.matches(roll)) {
                    chosenPerkRange = range;
                    System.out.println("found perk range " + chosenPerkRange.getId());
                    break;
                }
            }
        } while(chosenPerkRange == null);
		
		if (chosenPerkRange == null) {
			// something went wrong :(
			throw new BadRequestException();
		}
		
		// add the chosen perk to the sheet
		PerkSelection perkSelection = new PerkSelection();
		perkSelection.setSheet(sheet);
		perkSelection.setPerk(chosenPerkRange.getPerk());
		perkSelection.setRoll(tableRoll);
		sheet.getChosenPerks().add(perkSelection);
		
		// if all rolls have been made, flag the sheet as completed table rolls
        if (sheet.getChosenPerks().size() == sheet.getFramework().getTableRolls().size()) {
			SheetUtils.moveToNextCreationStep(sheet);
		}
		
		sheetRepository.save(sheet);
		
		return new PerkSelectionResponse(perkSelection, sheet);
	}
	
	/** Swap two randomly chosen perks for a new chosen one */
	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/tablerollswap/", method = RequestMethod.PUT)			// change this to PUT, make the post finish swaps
	public ResponseEntity<?> swapPerks(@RequestBody PerkSwapRequest perkSwapRequest) {
		Sheet sheet = AuthUtils.getSheet(request);
		
		if (!perkSwapRequest.validate()) {
			throw new BadRequestException();
		}
		
		PerkSelection chosenPerk1 = SheetUtils.getChosenPerkFromSheet(sheet, perkSwapRequest.getPerkSelection1().getId());
		PerkSelection chosenPerk2 = SheetUtils.getChosenPerkFromSheet(sheet, perkSwapRequest.getPerkSelection2().getId());
		
		Perk swapPerk = perkRepository.findOne(perkSwapRequest.getSwapPerk().getId());
		
		PerkSelection newPerkSelection = new PerkSelection();
		newPerkSelection.setSheet(sheet);
		newPerkSelection.setPerk(swapPerk);
		newPerkSelection.setWasSwappedFor(true);


        // remove the old perks from the sheet object, and add the new one, then save the new one
		sheet.getChosenPerks().remove(chosenPerk1);
		sheet.getChosenPerks().remove(chosenPerk2);
		sheet.getChosenPerks().add(newPerkSelection);

        // check if the number of perks that have not been swapped is 1 or less, meaning no more swaps can be made
        // move to the next step (race selection) if no more swaps can be made
        int numUnswapped = 0;
        for (PerkSelection selection : sheet.getChosenPerks()) {
            if (!selection.isWasSwappedFor()) {
                numUnswapped++;
            }
        }
        if (numUnswapped <= 1) {
			SheetUtils.moveToNextCreationStep(sheet);
        }

        sheetRepository.save(sheet);

		return new ResponseEntity<>(HttpStatus.OK);
	}

	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/tablerollswap/", method = RequestMethod.POST)
	public ResponseEntity<?> finishTableRollSwaps() {
		Sheet sheet = AuthUtils.getSheet(request);

		if (sheet.getCreationStep() == SheetCreationStep.TABLE_ROLL_SWAP) {
			SheetUtils.moveToNextCreationStep(sheet);
		}
		sheetRepository.save(sheet);

		return new ResponseEntity<>(HttpStatus.OK);
	}

	/** Select the race for this sheet */
	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/race/{raceId}/", method = RequestMethod.POST)
	public ResponseEntity<?> selectRace(@PathVariable long raceId) {
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
		
		return new ResponseEntity<>(HttpStatus.OK);
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

		Hindrance hindrance = hindranceRepository.findByType(hindranceBuyRequest.getType());
		
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

		if (sheet.getCreationStep() == SheetCreationStep.HINDRANCES) {
			SheetUtils.moveToNextCreationStep(sheet);
		}
		sheetRepository.save(sheet);

		return new ResponseEntity<>(HttpStatus.OK);
	}
}
