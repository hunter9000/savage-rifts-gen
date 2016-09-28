package savagerifts.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import savagerifts.interceptor.SheetOwner;
import savagerifts.model.benefittable.BenefitTableRoll;
import savagerifts.model.framework.Framework;
import savagerifts.model.perk.PerkSelection;
import savagerifts.model.sheet.Sheet;
import savagerifts.model.user.User;
import savagerifts.repository.FrameworkRepository;
import savagerifts.repository.SheetRepository;
import savagerifts.repository.UserRepository;
import savagerifts.request.AuthRequest;
import savagerifts.request.NewSheetRequest;
import savagerifts.security.ForbiddenAccessException;
import savagerifts.util.AuthUtils;

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
            throw new ForbiddenAccessException();
        }

        Framework framework = frameworkRepository.findOne(sheetRequest.frameworkId);
        if (framework == null) {
            throw new ForbiddenAccessException();
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
	@RequestMapping(value = "/api/sheet/{charId}/tableroll/{tableId}/{rollId}/", method=RequestMethod.POST)
	public SelectedPerk makeRollOnTable(@PathVariable Long charId, @PathVariable Long tableId, @PathVariable Long rollId) {
		Sheet sheet = AuthUtils.getSheet(request);
		
		BenefitTable table = benefitTableRepository.findOne(tableId);
		if (table == null) {
			throw new ForbiddenAccessException();
		}
		
		BenefitTableRoll tableRoll = null;
		for (BenefitTableRoll roll : sheet.getAvailableTableRolls()) {
			if (roll.getId().equals(rollId)) {
				tableRoll = roll;
			}
		}
		if (tableRoll == null) {
			throw new 
		}
		
		
		// get the list of perk ranges that the user doesn't already have
		List<PerkRange> perkRanges = table.getPerkRangesList();
		List<SelectedPerk> selectedPerks = sheet.getSelectedPerks();
		for (SelectedPerk perk : selectedPerks) {
			for (PerkRange range : perkRanges) {
				if (range.getPerk().equals(perk) ) {
					perkRanges.remove(range);
					continue;
				}
			}
		}
		
		// make sure there is at least one
		if (perkRanges.isEmpty()) {
			thrown new ForbiddenAccessException();
		}
		
		PerkRange chosenPerkRange = null;
		int roll = RandomUtils.getResultOfDieType(DieType.D20);
		
		for (PerkRange range : perkRanges) {
			if (range.matches(roll) ) {
				chosenPerkRange = range;
				break;
			}
		}
		
		if (chosenPerkRange == null) {
			// something went wrong :(
			throw new ServerErrorException();
		}
		
		// add the chosen perk to the sheet
		PerkSelection perkSelection = new PerkSelection();
		perkSelection.setSheet(sheet);
		perkSelection.setPerk(chosenPerkRange.getPerk());
		perkSelection.setBenefitTableRoll(tableRoll);
		sheet.getChosenPerks().add(perkSelection);
		
		// if all rolls have been made, flag the sheet as completed table rolls
		sheet.getAvailableTableRolls.remove(tableRoll);		// remove the roll that was just made from the available list
		if (sheet.getAvailableTableRolls.isEmpty()) {
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
	
	
}
