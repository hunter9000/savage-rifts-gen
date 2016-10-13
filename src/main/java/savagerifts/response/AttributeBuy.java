package savagerifts.response;

import savagerifts.model.AttributeType;
import savagerifts.model.sheet.Roll;
import savagerifts.model.sheet.Sheet;

import java.util.HashMap;
import java.util.Map;

public class AttributeBuy {
	
	public Roll strength = new Roll();
	public Roll agility = new Roll();
	public Roll smarts = new Roll();
	public Roll spirit = new Roll();
	public Roll vigor = new Roll();
	
	public int remainingAttrPoints;

	public Map<AttributeType, Boolean> canIncrease = new HashMap<>();

	public Map<AttributeType, Boolean> canDecrease = new HashMap<>();

	public Roll getStrength() {
		return strength;
	}
	public void setStrength(Roll strength) {
		this.strength = strength;
	}

	public Roll getAgility() {
		return agility;
	}
	public void setAgility(Roll agility) {
		this.agility = agility;
	}

	public Roll getSmarts() {
		return smarts;
	}
	public void setSmarts(Roll smarts) {
		this.smarts = smarts;
	}

	public Roll getSpirit() {
		return spirit;
	}
	public void setSpirit(Roll spirit) {
		this.spirit = spirit;
	}

	public Roll getVigor() {
		return vigor;
	}
	public void setVigor(Roll vigor) {
		this.vigor = vigor;
	}

	public int getRemainingAttrPoints() {
		return remainingAttrPoints;
	}
	public void setRemainingAttrPoints(int remainingAttrPoints) {
		this.remainingAttrPoints = remainingAttrPoints;
	}

	public Map<AttributeType, Boolean> getCanIncrease() {
		return canIncrease;
	}
	public void setCanIncrease(Map<AttributeType, Boolean> canIncrease) {
		this.canIncrease = canIncrease;
	}

	public Map<AttributeType, Boolean> getCanDecrease() {
		return canDecrease;
	}
	public void setCanDecrease(Map<AttributeType, Boolean> canDecrease) {
		this.canDecrease = canDecrease;
	}

}