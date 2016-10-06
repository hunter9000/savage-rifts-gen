package savagerifts.util;

public class SheetUtils() {
	
	public static PerkSelection getChosenPerkFromSheet(Sheet sheet, Long perkId) {
		for (PerkSelection selection : sheet.getChosenPerks()) {
			if (selection.getPerk().getId().equals(perkSwapRequest.getPerkSelection1().getId()) {
				return selection;
			}
		}
	}
	
}