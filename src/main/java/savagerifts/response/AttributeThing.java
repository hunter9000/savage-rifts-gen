package savagerifts.response;

import savagerifts.model.sheet.Roll;
import savagerifts.model.sheet.Sheet;

public class AttributeThing {
	
	public Roll strength = new Roll();
	public Roll agility = new Roll();
	public Roll smarts = new Roll();
	public Roll spirit = new Roll();
	public Roll vigor = new Roll();
	
	public int remainingAttrPoints;
	
	public boolean canIncreaseStrength;
	public boolean canIncreaseAgility;
	public boolean canIncreaseSmarts;
	public boolean canIncreaseSpirit;
	public boolean canIncreaseVigor;
	
	public boolean canDecreaseStrength;
	public boolean canDecreaseAgility;
	public boolean canDecreaseSmarts;
	public boolean canDecreaseSpirit;
	public boolean canDecreaseVigor;
	
	
	
}