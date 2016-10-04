package savagerifts.response;

import savagerifts.model.sheet.Roll;
import savagerifts.model.sheet.Sheet;

public class AttributeThing {
	
	private Roll strength = new Roll();
	private Roll agility = new Roll();
	private Roll smarts = new Roll();
	private Roll spirit = new Roll();
	private Roll vigor = new Roll();
	
	private int remainingAttrPoints;
	
	private boolean canIncreaseStrength;
	// ...
	
	private boolean canDecreaseStrength;
	// ...
	
	public AttributeThing(Sheet sheet) {
		strength.setDieType(sheet.getStrengthDieType());
		strength.setModifier(sheet.getStrengthBonus());
		
		// etc
		remainingAttrPoints = sheet.getRemainingAttrPoints();
		
		
		
//		canIncreaseStrength = strength < maxStrength;
	}
}