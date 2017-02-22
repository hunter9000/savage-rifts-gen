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
import savagerifts.model.perk.Perk;
import savagerifts.model.perk.PerkSelection;
import savagerifts.model.sheet.Sheet;
import savagerifts.model.sheet.SheetCreationStep;
import savagerifts.repository.BenefitTableRepository;
import savagerifts.repository.PerkRepository;
import savagerifts.repository.SheetRepository;
import savagerifts.request.PerkSwapRequest;
import savagerifts.response.PerkSelectionResponse;
import savagerifts.security.BadRequestException;
import savagerifts.util.AuthUtils;
import savagerifts.util.RandomUtils;
import savagerifts.util.SheetUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
public class SheetBenefitTableController {

	@Autowired
	private SheetRepository sheetRepository;

	@Autowired
	private BenefitTableRepository benefitTableRepository;

	@Autowired
	private PerkRepository perkRepository;

	@Autowired
	private HttpServletRequest request;

	/**
	 * Get the sheet's available table rolls, as array of tablerolls with arrays of tables
	 */
	@SheetOwner(requiredSteps = SheetCreationStep.TABLE_ROLLS)
	@RequestMapping(value = "/api/sheet/{sheetId}/tableroll/", method = RequestMethod.GET)
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

	/**
	 * Make the roll on this table for the given tableroll, returning the selected perk
	 */
	@SheetOwner(requiredSteps = SheetCreationStep.TABLE_ROLLS)
	@RequestMapping(value = "/api/sheet/{sheetId}/tableroll/{tableId}/{rollNumber}/", method = RequestMethod.POST)
	public PerkSelectionResponse makeRollOnTable(@PathVariable Long sheetId, @PathVariable Long tableId, @PathVariable Integer rollNumber) {
		Sheet sheet = AuthUtils.getSheet(request);

		BenefitTable table = benefitTableRepository.findOne(tableId);
		if (table == null) {
			throw new BadRequestException();
		}

		BenefitTableRoll tableRoll = null;
		for (BenefitTableRoll roll : sheet.getFramework().getTableRolls()) {
			if (roll.getRollNumber().equals(rollNumber)) {
				tableRoll = roll;
				break;
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
				if (range.getPerk().equals(perk)) {
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
		} while (chosenPerkRange == null);

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

	/**
	 * Swap two randomly chosen perks for a new chosen one
	 */
	@SheetOwner(requiredSteps = SheetCreationStep.TABLE_ROLL_SWAP)
	@RequestMapping(value = "/api/sheet/{sheetId}/tablerollswap/", method = RequestMethod.PUT)
	// change this to PUT, make the post finish swaps
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

	@SheetOwner(requiredSteps = SheetCreationStep.TABLE_ROLL_SWAP)
	@RequestMapping(value = "/api/sheet/{sheetId}/tablerollswap/", method = RequestMethod.POST)
	public ResponseEntity<?> finishTableRollSwaps() {
		Sheet sheet = AuthUtils.getSheet(request);

		if (sheet.getCreationStep() == SheetCreationStep.TABLE_ROLL_SWAP) {
			SheetUtils.moveToNextCreationStep(sheet);
		}
		sheetRepository.save(sheet);

		return new ResponseEntity<>(HttpStatus.OK);
	}
}