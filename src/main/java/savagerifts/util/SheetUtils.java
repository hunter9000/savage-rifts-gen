package savagerifts.util;

import savagerifts.model.perk.PerkSelection;
import savagerifts.model.sheet.Sheet;

public class SheetUtils {
	
	public static PerkSelection getChosenPerkFromSheet(Sheet sheet, Long perkId) {
		for (PerkSelection selection : sheet.getChosenPerks()) {
			if (selection.getPerk().getId().equals(perkId)) {
				return selection;
			}
		}
		return null;
	}
	
}