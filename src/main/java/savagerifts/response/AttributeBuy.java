package savagerifts.response;

import savagerifts.model.sheet.Roll;
import savagerifts.model.sheet.Sheet;

public class AttributeBuy {
	
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

	public boolean isCanIncreaseStrength() {
		return canIncreaseStrength;
	}
	public void setCanIncreaseStrength(boolean canIncreaseStrength) {
		this.canIncreaseStrength = canIncreaseStrength;
	}

	public boolean isCanIncreaseAgility() {
		return canIncreaseAgility;
	}
	public void setCanIncreaseAgility(boolean canIncreaseAgility) {
		this.canIncreaseAgility = canIncreaseAgility;
	}

	public boolean isCanIncreaseSmarts() {
		return canIncreaseSmarts;
	}
	public void setCanIncreaseSmarts(boolean canIncreaseSmarts) {
		this.canIncreaseSmarts = canIncreaseSmarts;
	}

	public boolean isCanIncreaseSpirit() {
		return canIncreaseSpirit;
	}
	public void setCanIncreaseSpirit(boolean canIncreaseSpirit) {
		this.canIncreaseSpirit = canIncreaseSpirit;
	}

	public boolean isCanIncreaseVigor() {
		return canIncreaseVigor;
	}
	public void setCanIncreaseVigor(boolean canIncreaseVigor) {
		this.canIncreaseVigor = canIncreaseVigor;
	}

	public boolean isCanDecreaseStrength() {
		return canDecreaseStrength;
	}
	public void setCanDecreaseStrength(boolean canDecreaseStrength) {
		this.canDecreaseStrength = canDecreaseStrength;
	}

	public boolean isCanDecreaseAgility() {
		return canDecreaseAgility;
	}
	public void setCanDecreaseAgility(boolean canDecreaseAgility) {
		this.canDecreaseAgility = canDecreaseAgility;
	}

	public boolean isCanDecreaseSmarts() {
		return canDecreaseSmarts;
	}
	public void setCanDecreaseSmarts(boolean canDecreaseSmarts) {
		this.canDecreaseSmarts = canDecreaseSmarts;
	}

	public boolean isCanDecreaseSpirit() {
		return canDecreaseSpirit;
	}
	public void setCanDecreaseSpirit(boolean canDecreaseSpirit) {
		this.canDecreaseSpirit = canDecreaseSpirit;
	}

	public boolean isCanDecreaseVigor() {
		return canDecreaseVigor;
	}
	public void setCanDecreaseVigor(boolean canDecreaseVigor) {
		this.canDecreaseVigor = canDecreaseVigor;
	}
}