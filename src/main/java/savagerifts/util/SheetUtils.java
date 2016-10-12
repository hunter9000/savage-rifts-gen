package savagerifts.util;

import savagerifts.model.DieType;
import savagerifts.model.framework.Framework;
import savagerifts.model.perk.PerkSelection;
import savagerifts.model.race.Race;
import savagerifts.model.sheet.Sheet;
import savagerifts.model.sheet.SheetCreationStep;
import savagerifts.response.AttributeThing;

public class SheetUtils {
	
	private static DieType DEFAULT_STARTING_ATTRIBUTE = DieType.D4;
	
	public static PerkSelection getChosenPerkFromSheet(Sheet sheet, Long perkId) {
		for (PerkSelection selection : sheet.getChosenPerks()) {
			if (selection.getPerk().getId().equals(perkId)) {
				return selection;
			}
		}
		return null;
	}
	
	/** look at the framework, perks, and race to set the minimum attributes. 
	  * this works by taking the default starting stat (D4) and setting any framework startings/maxs if framework is set, then doing the same for race, etc. 
	  * this can be called at any point and will recalculate from scratch based on the chosen framework/race/etc */
	public static void recalculateAttributes(Sheet sheet) {
		// check that the creation stage is before attribute buy. if we have gotten to attribute buy then all the defaults should have already been set. 
		// resetting them at this point will wipe out the player's point buy choices
		
		// if a framework has just been chosen, set the attrs to the max of current and the framework's starting
		Framework framework = sheet.getFramework();
		if (framework != null) {
			// set starting attribute points
			
			// find max of default and framework's starting stat (if specified), set the stat to that
//			sheet.setStrength(DEFAULT_STARTING_ATTRIBUTE, startingStrengthDieType);
		}
		
		Race race = sheet.getRace();
		if (race != null) {
			
		}
	}

	/** Moves the character to the next step, which will be null if done with all steps. */
	public static void moveToNextCreationStep(Sheet sheet) {
		SheetCreationStep step = sheet.getCreationStep();

		sheet.setCreationStep(step.getNextStep());
	}

	/** Create the attribute point buy info based on this sheet. Sheet must have all steps prior to attr point buy
	  * step finished (framework, race, etc). The current values are set, and the min and max are calculated based
	  * on looking at the framework and race, etc. */
	public AttributeThing calculateAttributePurchases(Sheet sheet) {
		
		AttributeThing attrs = new AttributeThing();
		
		attrs.remainingAttrPoints = sheet.getRemainingAttrPoints();
		
		attrs.strength = sheet.getStrength();
		attrs.agility = sheet.getAgility();
		attrs.smarts = sheet.getSmarts();
		attrs.spirit = sheet.getSpirit();
		attrs.vigor = sheet.getVigor();
		
		// get the max and min from the framework/race
		Framework framework = sheet.getFramework();
		
		// can increase if the current is less than the max
		attrs.canIncreaseStrength = attrs.strength.compareTo(framework.getMaxStrength()) < 0;
		attrs.canIncreaseAgility = attrs.agility.compareTo(framework.getMaxAgility()) < 0;
		attrs.canIncreaseSmarts = attrs.smarts.compareTo(framework.getMaxSmarts()) < 0;
		attrs.canIncreaseSpirit = attrs.spirit.compareTo(framework.getMaxSpirit()) < 0;
		attrs.canIncreaseVigor = attrs.vigor.compareTo(framework.getMaxVigor()) < 0;
		
		// get race, set can increase to compareto(race.max)			???
		
		return attrs;
	}
	

}