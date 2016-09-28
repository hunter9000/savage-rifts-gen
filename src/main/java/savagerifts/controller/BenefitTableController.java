package savagerifts.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import savagerifts.model.benefittable.BenefitTable;
import savagerifts.repository.BenefitTableRepository;

@RestController
public class BenefitTableController {

    @Autowired
    private BenefitTableRepository benefitTableRepository;

    @RequestMapping(value = "/api/benefittable/", method = RequestMethod.GET)
    public Iterable<BenefitTable> getAllBenefitTables() {
        return benefitTableRepository.findAll();
    }
	
	// get the sheet's options for the given table (the table perks, with the already selected ones marked)
	@SheetOwner
	@RequestMapping(value = "/api/benefittable/{tableId}/{charId}/", method = RequestMethod.GET)
	public BenefitTable getSheetTableOptions(@PathVariable Long tableId, @PathVariable Long charId) {
		Sheet sheet = AuthUtils.getSheet(request);
		
		BenefitTable table = benefitTableRepository.findOne(tableId);
		if (table == null) {
			throw
		}
		
		List<SelectedPerk> selectedPerks = sheet.getSelectedPerks();
		
		for (PerkRange range : table.getPerkRanges() ) {
			for (SelectedPerk selectedPerk : selectedPerks) {
				if (range.getPerk().equals(selectedPerk.getPerk())) {
					range.setHasBeenChosen(true);
				}
			}
		}
		
		return table;
		
/*		look up the benefit table by tableId
		look up the sheet's chosen perks
		for each chosen perk 
			flag the perk in the table as chosen
		return table
		*/
	}
	
}
