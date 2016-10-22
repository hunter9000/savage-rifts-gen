package savagerifts.util;

import savagerifts.model.AttributeType;
import savagerifts.model.DieType;
import savagerifts.model.framework.Framework;
import savagerifts.model.hindrance.Hindrance;
import savagerifts.model.hindrance.HindranceSelection;
import savagerifts.model.hindrance.SeverityType;
import savagerifts.model.perk.PerkSelection;
import savagerifts.model.sheet.Roll;
import savagerifts.model.sheet.Sheet;
import savagerifts.model.sheet.SheetCreationStep;
import savagerifts.model.skill.SkillRoll;
import savagerifts.model.skill.SkillType;
import savagerifts.model.user.User;
import savagerifts.request.AttributeBuyRequest;
import savagerifts.request.HindranceBuyRequest;
import savagerifts.request.NewSheetRequest;
import savagerifts.request.SkillBuyRequest;
import savagerifts.response.AttributeBuyResponse;
import savagerifts.response.HindranceBuyResponse;
import savagerifts.response.SkillBuyResponse;
import savagerifts.security.BadRequestException;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SheetUtils {
	
	private static DieType DEFAULT_STARTING_ATTRIBUTE = DieType.D4;

	public static Sheet createSheet(User owner, NewSheetRequest sheetRequest, Framework framework) {
		Sheet sheet = new Sheet();
		sheet.setOwner(owner);
		sheet.setName(sheetRequest.characterName);
		sheet.setFramework(framework);

		List<SkillRoll> skillList = new ArrayList<>();
		for (SkillType skillType : SkillType.values()) {
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

	private static Roll getMinAttribute(Sheet sheet, AttributeType attrType) {
		switch(attrType) {
			case STRENGTH:
				return getMinStrength(sheet);
			case AGILITY:
				return getMinAgility(sheet);
			case SMARTS:
				return getMinSmarts(sheet);
			case SPIRIT:
				return getMinSpirit(sheet);
			case VIGOR:
				return getMinVigor(sheet);
			default:
				throw new RuntimeException();
		}
	}

	private static Roll getMaxAttribute(Sheet sheet, AttributeType attrType) {
		switch(attrType) {
			case STRENGTH:
				return getMaxStrength(sheet);
			case AGILITY:
				return getMaxAgility(sheet);
			case SMARTS:
				return getMaxSmarts(sheet);
			case SPIRIT:
				return getMaxSpirit(sheet);
			case VIGOR:
				return getMaxVigor(sheet);
			default:
				throw new RuntimeException();
		}
	}

	private static Roll getMinStrength(Sheet sheet) {
		Framework framework = sheet.getFramework();
		if (framework != null && framework.getStartingStrength() != null) {
			return framework.getStartingStrength();
		}
		return new Roll();		// d4+0
	}

	private static Roll getMinAgility(Sheet sheet) {
		Framework framework = sheet.getFramework();
		if (framework != null && framework.getStartingAgility() != null) {
			return framework.getStartingAgility();
		}
		return new Roll();		// d4+0
	}

	private static Roll getMinSmarts(Sheet sheet) {
		Framework framework = sheet.getFramework();
		if (framework != null && framework.getStartingSmarts() != null) {
			return framework.getStartingSmarts();
		}
		return new Roll();		// d4+0
	}

	private static Roll getMinSpirit(Sheet sheet) {
		Framework framework = sheet.getFramework();
		if (framework != null && framework.getStartingSpirit() != null) {
			return framework.getStartingSpirit();
		}
		return new Roll();		// d4+0
	}

	private static Roll getMinVigor(Sheet sheet) {
		Framework framework = sheet.getFramework();
		if (framework != null && framework.getStartingVigor() != null) {
			return framework.getStartingVigor();
		}
		return new Roll();		// d4+0
	}

	private static Roll getMaxStrength(Sheet sheet) {
		Framework framework = sheet.getFramework();
		if (framework != null && framework.getMaxStrength() != null) {
			return framework.getMaxStrength();
		}
		return new Roll(DieType.D12, 0);		// d4+0
	}

	private static Roll getMaxAgility(Sheet sheet) {
		Framework framework = sheet.getFramework();
		if (framework != null && framework.getMaxAgility() != null) {
			return framework.getMaxAgility();
		}
		return new Roll(DieType.D12, 0);		// d4+0
	}

	private static Roll getMaxSmarts(Sheet sheet) {
		Framework framework = sheet.getFramework();
		if (framework != null && framework.getMaxSmarts() != null) {
			return framework.getMaxSmarts();
		}
		return new Roll(DieType.D12, 0);		// d4+0
	}

	private static Roll getMaxSpirit(Sheet sheet) {
		Framework framework = sheet.getFramework();
		if (framework != null && framework.getMaxSpirit() != null) {
			return framework.getMaxSpirit();
		}
		return new Roll(DieType.D12, 0);		// d4+0
	}

	private static Roll getMaxVigor(Sheet sheet) {
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
	public static AttributeBuyResponse calculateAttributePurchases(Sheet sheet) {
		
		AttributeBuyResponse attrs = new AttributeBuyResponse();
		
		attrs.remainingAttrPoints = sheet.getRemainingAttrPoints();
		attrs.attributes = populateAttributeMap(sheet);

		// get the max and min from the framework/race
		for (AttributeType type : AttributeType.values()) {
			// can increase if the current is less than the max and there are points left
			attrs.canIncrease.put(type, attrs.attributes.get(type).compareTo(getMaxAttribute(sheet, type)) < 0 && attrs.remainingAttrPoints > 0);
			// can decrease if current is above min, and current points are less than the max starting number
			attrs.canDecrease.put(type, attrs.attributes.get(type).compareTo(getMinAttribute(sheet, type)) > 0 && attrs.remainingAttrPoints < getMaxAttributePoints(sheet));
		}

		// get race, set can increase to compareto(race.max)			???


		return attrs;
	}

	/** Adds all the sheet's skillrolls to a map for convenience */
	public static Map<AttributeType, Roll> populateAttributeMap(Sheet sheet) {
		Map<AttributeType, Roll> map = new HashMap<>();
		map.put(AttributeType.STRENGTH, sheet.getStrength());
		map.put(AttributeType.AGILITY, sheet.getAgility());
		map.put(AttributeType.SMARTS, sheet.getSmarts());
		map.put(AttributeType.SPIRIT, sheet.getSpirit());
		map.put(AttributeType.VIGOR, sheet.getVigor());
		return map;
	}

	public static boolean validateAndMakeAttributeChange(Sheet sheet, AttributeBuyRequest pointBuyRequest) {
		AttributeBuyResponse attributes = SheetUtils.calculateAttributePurchases(sheet);

		// get the attribute that we want to change
		Map<AttributeType, Roll> attrMap = populateAttributeMap(sheet);
		Roll attrRoll = attrMap.get(pointBuyRequest.getAttribute());

		// check that the stat can actually be inc'd/dec'd, then make the change to the attr and the attr points
		if (pointBuyRequest.getOperation() == AttributeBuyRequest.OperationType.INC) {
			if (attributes.canIncrease.get(pointBuyRequest.getAttribute())) {
				attrRoll.increase();
				sheet.setRemainingAttrPoints(sheet.getRemainingAttrPoints() - 1);
				return true;
			}
		}
		else if (pointBuyRequest.getOperation() == AttributeBuyRequest.OperationType.DEC) {
			if (attributes.canDecrease.get(pointBuyRequest.getAttribute())) {
				attrRoll.decrease();
				sheet.setRemainingAttrPoints(sheet.getRemainingAttrPoints() + 1);
				return true;
			}
		}

		return false;
	}

	public static SkillBuyResponse calculateSkillPurchases(Sheet sheet) {
		SkillBuyResponse skillBuyResponse = new SkillBuyResponse();
		
		Map<SkillType, SkillRoll> skillMap = populateSkillMap(sheet);
		
		skillBuyResponse.skills = skillMap;
		skillBuyResponse.remainingSkillPoints = sheet.getRemainingSkillPoints();
		
		for (SkillType skillType : skillMap.keySet()) {
			skillMap.get(skillType);

			SkillRoll skill = skillMap.get(skillType);
			skillBuyResponse.canIncrease.put(skillType, skill.getRoll().compareTo(new Roll(DieType.D12, 0)) < 0 && sheet.getRemainingSkillPoints() > 0);
			
			skillBuyResponse.canDecrease.put(skillType, skill.getRoll().compareTo(new Roll()) > 0 && sheet.getRemainingSkillPoints() < 15);
		}
		
		return skillBuyResponse;
	}
	
	/** Adds all the sheet's skillrolls to a map for convenience */
	public static Map<SkillType, SkillRoll> populateSkillMap(Sheet sheet) {
		Map<SkillType, SkillRoll> map = new HashMap<>();
		for (SkillRoll roll : sheet.getSkills()) {
			map.put(roll.getSkillType(), roll);
		}
		return map;
	}

	public static boolean validateAndMakeSkillChange(Sheet sheet, SkillBuyRequest skillBuyRequest) {
		SkillBuyResponse skills = SheetUtils.calculateSkillPurchases(sheet);

		// get the skill that we want to change
		Map<SkillType, SkillRoll> skillMap = populateSkillMap(sheet);
		SkillRoll skillRoll = skillMap.get(skillBuyRequest.getSkill());

		// check that the stat can actually be inc'd/dec'd, then make the change to the attr and the attr points
		if (skillBuyRequest.getOperation() == SkillBuyRequest.OperationType.INC) {
			if (skills.canIncrease.get(skillBuyRequest.getSkill())) {
				skillRoll.getRoll().increase();
				sheet.setRemainingSkillPoints(sheet.getRemainingSkillPoints() - 1);
				return true;
			}
		}
		else if (skillBuyRequest.getOperation() == SkillBuyRequest.OperationType.DEC) {
			if (skills.canDecrease.get(skillBuyRequest.getSkill())) {
				skillRoll.getRoll().decrease();
				sheet.setRemainingSkillPoints(sheet.getRemainingSkillPoints() + 1);
				return true;
			}
		}

		return false;
	}

	
	public static HindranceBuyResponse calculateHindrancePurchases(Sheet sheet) {
		HindranceBuyResponse hindranceBuyResponse = new HindranceBuyResponse();

		int majorCount = 0;
		int minorCount = 0;
		for (HindranceSelection hs : sheet.getChosenHindrances()) {
			if (hs.getHindrance().isMajor()) {
				hindranceBuyResponse.setMajor(hs.getHindrance());
				majorCount++;
			}
			if (hs.getHindrance().isMinor()) {
				if (minorCount == 0) {
					hindranceBuyResponse.setMinor1(hs.getHindrance());
				}
				else {
					hindranceBuyResponse.setMinor2(hs.getHindrance());
				}
				minorCount++;
			}
		}
		
		if (majorCount > 1 || minorCount > 2) {
			throw new BadRequestException();
		}
		
		hindranceBuyResponse.setNumMajorsChosen(majorCount);
		hindranceBuyResponse.setNumMinorsChosen(minorCount);
		hindranceBuyResponse.setNumRemainingHindrancePoints(sheet.getRemainingHindrancePoints());
		
		return hindranceBuyResponse;
	}
	
	public static boolean validateAndMakeHindranceChange(Sheet sheet, Hindrance hindrance, HindranceBuyRequest hindranceBuyRequest) {
		HindranceBuyResponse hindranceBuyResponse = SheetUtils.calculateHindrancePurchases(sheet);

		// check that the hindrance can actually be added or removed, and then add or remove it
		if (hindranceBuyRequest.getOperation() == HindranceBuyRequest.OperationType.ADD) {
			// make sure the sheet doesn't already have the hindrance
			for (HindranceSelection hs : sheet.getChosenHindrances()) {
				if (hs.getHindrance().getType() == hindrance.getType()) {		// can only take each hindrance one time, regardless of severity
					return false;
				}
			}
			
			// make sure that the sheet doesn't already have too many of this type
			if (hindranceBuyRequest.getSeverityType() == SeverityType.MAJOR && hindranceBuyResponse.getNumMajorsChosen() >= 1) {
				return false;
			}
			else if (hindranceBuyRequest.getSeverityType() == SeverityType.MINOR && hindranceBuyResponse.getNumMinorsChosen() >= 2) {
				return false;
			}
			
			// everything seems to be in order, lets add that hindrance!
			HindranceSelection hs = new HindranceSelection();
			hs.setSheet(sheet);
			hs.setHindrance(hindrance);
			
			sheet.getChosenHindrances().add(hs);
			sheet.setRemainingHindrancePoints(sheet.getRemainingHindrancePoints() + hindranceBuyRequest.getSeverityType().getNumPoints());
			
			return true;
		}
		else if (hindranceBuyRequest.getOperation() == HindranceBuyRequest.OperationType.REMOVE) {
			// check that the sheet already has this hindrace
			HindranceSelection hindranceSelection = null;
			for (HindranceSelection hs : sheet.getChosenHindrances()) {
				if (hs.getHindrance().getType() == hindrance.getType() && hs.getSeverityType() == hindranceBuyRequest.getSeverityType()) {
					hindranceSelection = hs;
					break;
				}
			}
			if (hindranceSelection == null) {
				throw new BadRequestException();
			}
			
			sheet.getChosenHindrances().remove(hindranceSelection);
			sheet.setRemainingHindrancePoints(sheet.getRemainingHindrancePoints() - hindranceBuyRequest.getSeverityType().getNumPoints());
		}

		return false;
	}
	
}