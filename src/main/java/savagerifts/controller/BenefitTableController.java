package savagerifts.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import savagerifts.interceptor.SheetOwner;
import savagerifts.model.benefittable.BenefitTable;
import savagerifts.model.benefittable.PerkRange;
import savagerifts.model.perk.PerkSelection;
import savagerifts.model.sheet.Sheet;
import savagerifts.repository.BenefitTableRepository;
import savagerifts.security.BadRequestException;
import savagerifts.util.AuthUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController
public class BenefitTableController {

    @Autowired
    private BenefitTableRepository benefitTableRepository;

	@Autowired
	private HttpServletRequest request;


    @RequestMapping(value = "/api/benefittable/", method = RequestMethod.GET)
    public Iterable<BenefitTable> getAllBenefitTables() {
        return benefitTableRepository.findAll();
    }
	
	// get the sheet's options for the given table (the table perks, with the already selected ones marked)
	@SheetOwner
	@RequestMapping(value = "/api/benefittable/{tableId}/{sheetId}/", method = RequestMethod.GET)
	public BenefitTable getSheetTableOptions(@PathVariable Long tableId, @PathVariable Long sheetId) {
		Sheet sheet = AuthUtils.getSheet(request);
		
		BenefitTable table = benefitTableRepository.findOne(tableId);
		if (table == null) {
			throw new BadRequestException();
		}
		
		List<PerkSelection> selectedPerks = sheet.getChosenPerks();
		
		for (PerkRange range : table.getPerkRanges() ) {
			for (PerkSelection selectedPerk : selectedPerks) {
				if (range.getPerk().equals(selectedPerk.getPerk())) {
					range.setPerkHasBeenChosen(true);
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
