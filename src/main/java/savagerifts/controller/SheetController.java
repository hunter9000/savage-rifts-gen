package savagerifts.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import savagerifts.interceptor.SheetOwner;
import savagerifts.model.DieType;
import savagerifts.model.benefittable.BenefitTable;
import savagerifts.model.benefittable.BenefitTableRoll;
import savagerifts.model.benefittable.PerkRange;
import savagerifts.model.framework.Framework;
import savagerifts.model.perk.PerkSelection;
import savagerifts.model.sheet.Sheet;
import savagerifts.model.user.User;
import savagerifts.repository.BenefitTableRepository;
import savagerifts.repository.FrameworkRepository;
import savagerifts.repository.SheetRepository;
import savagerifts.repository.UserRepository;
import savagerifts.request.NewSheetRequest;
import savagerifts.security.BadRequestException;
import savagerifts.util.AuthUtils;
import savagerifts.util.RandomUtils;

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
    private HttpServletRequest request;


    // create sheet
    @RequestMapping(value="/api/sheet/", method= RequestMethod.POST)
    public ResponseEntity<?> createSheet(@RequestBody NewSheetRequest sheetRequest) {
        User owner = AuthUtils.getLoggedInUser(request);

        if (sheetRequest.characterName == null || sheetRequest.characterName.equals("")) {
            throw new BadRequestException();
        }

        Framework framework = frameworkRepository.findOne(sheetRequest.frameworkId);
        if (framework == null) {
            throw new BadRequestException();
        }

        Sheet sheet = new Sheet();
        sheet.setOwner(owner);
        sheet.setName(sheetRequest.characterName);
        sheet.setFramework(framework);

        sheetRepository.save(sheet);

        return new ResponseEntity<>(HttpStatus.OK);
    }

    // get all sheets belonging to user
    @RequestMapping(value="/api/sheet/", method= RequestMethod.GET)
    public List<Sheet> getSheets() {
        User owner = AuthUtils.getLoggedInUser(request);
        return sheetRepository.findByOwner(owner);
    }

    // get sheet
    @SheetOwner
    @RequestMapping(value="/api/sheet/{sheetId}/", method=RequestMethod.GET)
    public Sheet getSheet(@PathVariable long sheetId) {
        return AuthUtils.getSheet(request);     // the sheet is retrieved by the SheetOwnerInterceptor
    }

    // choose framework
    @SheetOwner
    @RequestMapping(value = "/api/sheet/{sheetId}/framework/{frameworkId}/", method = RequestMethod.POST)
    public void setFramework(@PathVariable long sheetId, @PathVariable long frameworkId) {
        Sheet sheet = AuthUtils.getSheet(request);
    }

    // get the sheet's available rolls, as array of tablerolls with arrays of tables
    @SheetOwner
    @RequestMapping(value = "/api/sheet/{sheetId}/tableroll/", method=RequestMethod.GET)
    public List<BenefitTableRoll> getAvailableTableRolls() {
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

	// make the roll on this table for the given tableroll, returning the selected perk
	@SheetOwner
	@RequestMapping(value = "/api/sheet/{sheetId}/tableroll/{tableId}/{rollNumber}/", method=RequestMethod.POST)
	public PerkSelection makeRollOnTable(@PathVariable Long sheetId, @PathVariable Long tableId, @PathVariable Integer rollNumber) {
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
        perkRanges.remove(tableRoll);		// remove the roll that was just made from the available list
		if (perkRanges.isEmpty()) {
			sheet.setHasCompletedTableRolls(true);
		}
		
		sheetRepository.save(sheet);
		
		return perkSelection;
	
/*		load the table
		make sure there is at least one 
		roll d20, choose perk from range
		if (perk is already selected)
			reroll
		add perk to the sheet's selected perks, for table roll rollId
		if (all rolls are made) 
			flag sheet as completedTableRolls
		return selected perk
		*/
	}
	
	@SheetOwner
	@RequestMapping(value = "", method = RequestMethod.GET)
	public AttributeThing getAttributeThing() {
		
		
	}
	
}
