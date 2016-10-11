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
	
	/** look at the framework, perks, and race to set the minimum attributes. */
	public static void recalculateAttributes(Sheet sheet) {
		// check that the creation stage is before attribute buy
		
		// if a framework is chosen, set the attrs to the max of current and the framework's starting
		Framework framework = sheet.getFramework();
		if (sheet.getFramework() != null) {
			
			sheet.setStrength( , startingStrengthDieType);
		}
	}
	
	public AttributeThing calculateAttributePurchases() {
		
	}
	
}