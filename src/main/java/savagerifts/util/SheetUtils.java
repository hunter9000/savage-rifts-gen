package savagerifts.util;

import savagerifts.model.AttributeType;
import savagerifts.model.DieType;
import savagerifts.model.framework.Framework;
import savagerifts.model.perk.PerkSelection;
import savagerifts.model.race.Race;
import savagerifts.model.sheet.Roll;
import savagerifts.model.sheet.Sheet;
import savagerifts.model.sheet.SheetCreationStep;
import savagerifts.request.PointBuyRequest;
import savagerifts.response.AttributeBuy;

public class SheetUtils {
	
	private static DieType DEFAULT_STARTING_ATTRIBUTE = DieType.D4;
	
	public static Sheet createSheet() {
		Sheet sheet = new Sheet();
        sheet.setOwner(owner);
        sheet.setName(sheetRequest.characterName);
        sheet.setFramework(framework);

		List<SkillRoll> skillList = new ArrayList<>();
		for (SkillType skillType : SkillType.values()) {}
			SkillRoll skill = new SkillRoll();
			skill.setSheet(sheet);
			skill.setSkillType(skillType);
			skill.setRoll(new Roll());
			skillList.add(skill);
		}
		sheet.setSkills(skillList);
		
		SheetUtils.recalculateAttributes(sheet);
		
		return sheet;
	}
	
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
		if (!sheet.getCreationStep().isBefore(SheetCreationStep.ATTRIBUTES)) {
			return;
		}
		
		sheet.setRemainingAttrPoints(getMaxAttributePoints(sheet));

		// set the minimum starting attribute from the framework/race/etc to the current stat.
		// if not specified, it will be ignored and the default will be used
		sheet.getStrength().copy(getMinStrength(sheet));
		sheet.getAgility().copy(getMinAgility(sheet));
		sheet.getSmarts().copy(getMinSmarts(sheet));
		sheet.getSpirit().copy(getMinSpirit(sheet));
		sheet.getVigor().copy(getMinVigor(sheet));
	}

	public static Integer getMaxAttributePoints(Sheet sheet) {
		Framework framework = sheet.getFramework();
		if (framework != null && framework.getStartingAttributePoints() != null) {
			return framework.getStartingAttributePoints();
		}
		return Sheet.DEFAULT_ATTRIBUTE_POINTS;
	}

	public static Roll getMinStrength(Sheet sheet) {
		Framework framework = sheet.getFramework();
		if (framework != null && framework.getStartingStrength() != null) {
			return framework.getStartingStrength();
		}
		return new Roll();		// d4+0
	}

	public static Roll getMinAgility(Sheet sheet) {
		Framework framework = sheet.getFramework();
		if (framework != null && framework.getStartingAgility() != null) {
			return framework.getStartingAgility();
		}
		return new Roll();		// d4+0
	}

	public static Roll getMinSmarts(Sheet sheet) {
		Framework framework = sheet.getFramework();
		if (framework != null && framework.getStartingSmarts() != null) {
			return framework.getStartingSmarts();
		}
		return new Roll();		// d4+0
	}

	public static Roll getMinSpirit(Sheet sheet) {
		Framework framework = sheet.getFramework();
		if (framework != null && framework.getStartingSpirit() != null) {
			return framework.getStartingSpirit();
		}
		return new Roll();		// d4+0
	}

	public static Roll getMinVigor(Sheet sheet) {
		Framework framework = sheet.getFramework();
		if (framework != null && framework.getStartingVigor() != null) {
			return framework.getStartingVigor();
		}
		return new Roll();		// d4+0
	}

	public static Roll getMaxStrength(Sheet sheet) {
		Framework framework = sheet.getFramework();
		if (framework != null && framework.getMaxStrength() != null) {
			return framework.getMaxStrength();
		}
		return new Roll(DieType.D12, 0);		// d4+0
	}

	public static Roll getMaxAgility(Sheet sheet) {
		Framework framework = sheet.getFramework();
		if (framework != null && framework.getMaxAgility() != null) {
			return framework.getMaxAgility();
		}
		return new Roll(DieType.D12, 0);		// d4+0
	}

	public static Roll getMaxSmarts(Sheet sheet) {
		Framework framework = sheet.getFramework();
		if (framework != null && framework.getMaxSmarts() != null) {
			return framework.getMaxSmarts();
		}
		return new Roll(DieType.D12, 0);		// d4+0
	}

	public static Roll getMaxSpirit(Sheet sheet) {
		Framework framework = sheet.getFramework();
		if (framework != null && framework.getMaxSpirit() != null) {
			return framework.getMaxSpirit();
		}
		return new Roll(DieType.D12, 0);		// d4+0
	}

	public static Roll getMaxVigor(Sheet sheet) {
		Framework framework = sheet.getFramework();
		if (framework != null && framework.getMaxVigor() != null) {
			return framework.getMaxVigor();
		}
		return new Roll(DieType.D12, 0);		// d4+0
	}


	/** Moves the character to the next step, which will be null if done with all steps. */
	public static void moveToNextCreationStep(Sheet sheet) {
		SheetCreationStep step = sheet.getCreationStep();

		sheet.setCreationStep(step.getNextStep());
	}

	/** Create the attribute point buy info based on this sheet. Sheet must have all steps prior to attr point buy
	  * step finished (framework, race, etc). The current values are set, and the min and max are calculated based
	  * on looking at the framework and race, etc. */
	public static AttributeBuy calculateAttributePurchases(Sheet sheet) {
		
		AttributeBuy attrs = new AttributeBuy();
		
		attrs.remainingAttrPoints = sheet.getRemainingAttrPoints();
		
		attrs.strength = sheet.getStrength();
		attrs.agility = sheet.getAgility();
		attrs.smarts = sheet.getSmarts();
		attrs.spirit = sheet.getSpirit();
		attrs.vigor = sheet.getVigor();
		
		// get the max and min from the framework/race
		// can increase if the current is less than the max and there are points left
		attrs.canIncrease.put(AttributeType.STRENGTH, attrs.strength.compareTo(getMaxStrength(sheet)) < 0 && attrs.remainingAttrPoints > 0);
		attrs.canIncrease.put(AttributeType.AGILITY, attrs.agility.compareTo(getMaxAgility(sheet)) < 0 && attrs.remainingAttrPoints > 0);
		attrs.canIncrease.put(AttributeType.SMARTS, attrs.smarts.compareTo(getMaxSmarts(sheet)) < 0 && attrs.remainingAttrPoints > 0);
		attrs.canIncrease.put(AttributeType.SPIRIT, attrs.spirit.compareTo(getMaxSpirit(sheet)) < 0 && attrs.remainingAttrPoints > 0);
		attrs.canIncrease.put(AttributeType.VIGOR, attrs.vigor.compareTo(getMaxVigor(sheet)) < 0 && attrs.remainingAttrPoints > 0);

		// can decrease if current is above min, and current points are less than the max starting number
		attrs.canDecrease.put(AttributeType.STRENGTH, attrs.strength.compareTo(getMinStrength(sheet)) > 0 && attrs.remainingAttrPoints < getMaxAttributePoints(sheet));
		attrs.canDecrease.put(AttributeType.AGILITY, attrs.agility.compareTo(getMinAgility(sheet)) > 0 && attrs.remainingAttrPoints < getMaxAttributePoints(sheet));
		attrs.canDecrease.put(AttributeType.SMARTS, attrs.smarts.compareTo(getMinSmarts(sheet)) > 0 && attrs.remainingAttrPoints < getMaxAttributePoints(sheet));
		attrs.canDecrease.put(AttributeType.SPIRIT, attrs.spirit.compareTo(getMinSpirit(sheet)) > 0 && attrs.remainingAttrPoints < getMaxAttributePoints(sheet));
		attrs.canDecrease.put(AttributeType.VIGOR, attrs.vigor.compareTo(getMinVigor(sheet)) > 0 && attrs.remainingAttrPoints < getMaxAttributePoints(sheet));


		// get race, set can increase to compareto(race.max)			???


		return attrs;
	}

	public static boolean validateAndMakeAttributeChange(Sheet sheet, PointBuyRequest pointBuyRequest) {
		AttributeBuy attributes = SheetUtils.calculateAttributePurchases(sheet);

		Roll attrRoll = null;
		switch(pointBuyRequest.getStat()) {
			case STRENGTH:
				attrRoll = sheet.getStrength();
				break;
			case AGILITY:
				attrRoll = sheet.getAgility();
				break;
			case SMARTS:
				attrRoll = sheet.getSmarts();
				break;
			case SPIRIT:
				attrRoll = sheet.getSpirit();
				break;
			case VIGOR:
				attrRoll = sheet.getVigor();
				break;
		}

		// check that the stat can actually be inc'd/dec'd
		if (pointBuyRequest.getOperation() == PointBuyRequest.OperationType.INC) {
			if (attributes.canIncrease.get(pointBuyRequest.getStat())) {
				attrRoll.increase();
				sheet.setRemainingAttrPoints(sheet.getRemainingAttrPoints() - 1);
			}
			else {
				return false;
			}
		}
		else {
			if (attributes.canDecrease.get(pointBuyRequest.getStat())) {
				attrRoll.decrease();
				sheet.setRemainingAttrPoints(sheet.getRemainingAttrPoints() + 1);
			}
			else {
				return false;
			}
		}

		return true;
	}
	
	public static SkillBuy calculateSkillPurchases(Sheet sheet) {
		SkillBuy skillBuy = new SkillBuy();
		
		Map<SkillType, SkillRoll> skillMap = populateSkillMap(Sheet sheet);
		
		skillBuy.skills = skillMap;
		skillBuy.remainingSkillPoints = sheet.getRemainingSkillPoints();
		
		for (SkillType skillType : skillMap) {
			skillMap.get(skillType);
			
			skillBuy.canIncreaseSkill.put(skillType, true);
			
			skillBuy.canDecreaseSkill.put(skillType, true);
		}
		
		return skillBuy;
	}
	
	/** Adds all the sheet's skillrolls to a map for convenience */
	public Map<SkillType, SkillRoll> populateSkillMap(Sheet sheet) {
		Map<SkillType, SkillRoll> map = new HashMap<>();
		for (SkillRoll roll : sheet.getSkills()) {
			map.put(roll.getType(), roll);
		}
		return map;
	}

}