

public class AttributeThing() {
	
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
		strength.setModifier(sheet.getStrengthModifier());
		
		// etc
		remainingAttrPoints = sheet.getRemainingAttrPoints();
		
		
		
		canIncreaseStrength = strength < maxStrength;
	}
}