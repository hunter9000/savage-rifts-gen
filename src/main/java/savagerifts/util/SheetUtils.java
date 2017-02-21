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
import savagerifts.model.skill.SkillDefinition;
import savagerifts.model.skill.SkillKnowledge;
import savagerifts.model.skill.SkillRoll;
import savagerifts.model.skill.SkillType;
import savagerifts.model.user.User;
import savagerifts.request.HindranceBuyRequest;
import savagerifts.request.NewSheetRequest;
import savagerifts.request.SkillBuyRequest;
import savagerifts.response.HindranceBuyResponse;
import savagerifts.response.SkillBuyResponse;
import savagerifts.response.SkillRollInfo;
import savagerifts.security.BadRequestException;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SheetUtils {
	
	private static final DieType DEFAULT_STARTING_ATTRIBUTE = DieType.D4;

	private static final int NUM_MAJOR_HINDRANCES = 1;
	private static final int NUM_MINOR_HINDRANCES = 2;

	public static final int EDGE_RAISE_COST = 2;
	public static final int ATTR_RAISE_COST = 2;
	public static final int SKILL_RAISE_COST = 1;
	public static final int MONEY_RAISE_COST = 1;


	public static Sheet createSheet(User owner, NewSheetRequest sheetRequest, Framework framework) {
		Sheet sheet = new Sheet();
		sheet.setOwner(owner);
		sheet.setName(sheetRequest.characterName);
		sheet.setFramework(framework);

		List<SkillRoll> skillList = new ArrayList<>();
		for (SkillType skillType : SkillType.values()) {
			// TODO don't create a plain knowledge skill here
			SkillRoll skill = new SkillRoll();
			skill.setSheet(sheet);
			skill.setSkillType(skillType);
			skill.setRoll(new Roll());
			skillList.add(skill);
		}
		sheet.setSkills(skillList);
		
		SheetAttributeUtils.recalculateAttributes(sheet);
		
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
	


	/** Moves the character to the next step, which will be null if done with all steps. */
	public static void moveToNextCreationStep(Sheet sheet) {
		SheetCreationStep step = sheet.getCreationStep();

		sheet.setCreationStep(step.getNextStep());
	}



	public static SkillBuyResponse calculateSkillPurchases(Sheet sheet) {
		SkillBuyResponse skillBuyResponse = new SkillBuyResponse();
		
//		Map<SkillType, SkillRoll> skillMap = populateSkillMap(sheet);
		List<SkillRoll> skillRolls = sheet.getSkills();
		List<SkillRollInfo> skillRollInfos = new ArrayList<>();

		skillBuyResponse.remainingSkillPoints = sheet.getRemainingSkillPoints();
		
		Map<AttributeType, Roll> attrMap = SheetAttributeUtils.populateAttributeMap(sheet);
		
		for (SkillRoll skillRoll : skillRolls) {
//			SkillRoll skillRoll = skillMap.get(skillType);
			SkillRollInfo info = new SkillRollInfo();

			int pointCost = getSkillPointCost(skillRoll, attrMap);
			info.canIncrease = skillRoll.getRoll().compareTo(new Roll(DieType.D12,0)) < 0 && sheet.getRemainingSkillPoints() >= pointCost;
			info.canDecrease = skillRoll.getRoll().compareTo(new Roll()) > 0 && sheet.getRemainingSkillPoints() < 15;
			info.skillRoll = skillRoll;

			skillRollInfos.add(info);
		}

		skillBuyResponse.skillRollInfos = skillRollInfos;

		return skillBuyResponse;
	}
	
	private static int getSkillPointCost(SkillRoll skillRoll, Map<AttributeType, Roll> attrMap) {
		// cost to increase is 1 if the skill is less than it's attr, 2 if it's greater than or equal to the attr
		return skillRoll.getRoll().compareTo(attrMap.get(skillRoll.getLinkedAttribute())) < 0 ? 1 : 2;
	}
//
//	public static MultiKeyMap getSkills() {
//		MultiKeyMap<> map = MultiKeyMap.multiKeyMap(new HashedMap<>());
//
//	}

	/** Adds all the sheet's skillrolls to a map for serialization. */
	static Map<SkillDefinition, SkillRoll> populateSkillMap(Sheet sheet) {
		Map<SkillDefinition, SkillRoll> map = new HashMap<>();
		for (SkillRoll roll : sheet.getSkills()) {
			map.put(new SkillDefinition(roll.getSkillType(), roll.getSkillKnowledge()) , roll);
		}
		return map;
	}

	public static boolean skillMatches(SkillType typeA, SkillKnowledge knowledgeTypeA, SkillType typeB, SkillKnowledge knowledgeTypeB) {
		if (typeA == typeB && typeA != null) {		// if the types match
			if (typeA != SkillType.KNOWLEDGE) {			// if these aren't knowledge skills, they're equal
				return true;
			}
			else {		// check knowledge subtypes are equal
				return (knowledgeTypeA != null && knowledgeTypeA.equals(knowledgeTypeB));
			}
		}
		return false;
	}

	public static boolean validateAndMakeSkillChange(Sheet sheet, SkillBuyRequest skillBuyRequest) {
		SkillBuyResponse skills = SheetUtils.calculateSkillPurchases(sheet);

		// get the skill that we want to change
//		Map<SkillType, SkillRoll> skillMap = populateSkillMap(sheet);
//		List<SkillRoll> skillRolls = new ArrayList<>();
		SkillRollInfo skillRollInfo = null;
		for (SkillRollInfo sri : skills.getSkillRollInfos()) {
			if (skillMatches(sri.getSkillRoll().getSkillType(), sri.getSkillRoll().getSkillKnowledge(), skillBuyRequest.getSkill(), skillBuyRequest.getSkillKnowledge())) {
//			if (sri.getSkillRoll().getSkillType() == skillBuyRequest.getSkill() && sri.getSkillRoll().getSkillKnowledge().equals(skillBuyRequest.getSkillKnowledge())) {
				skillRollInfo = sri;
				break;
			}
		}

		int pointCost = getSkillPointCost(skillRollInfo.getSkillRoll(), SheetAttributeUtils.populateAttributeMap(sheet));
		
		// check that the stat can actually be inc'd/dec'd, then make the change to the attr and the attr points
		if (skillBuyRequest.getOperation() == SkillBuyRequest.OperationType.INC) {
			if (skillRollInfo.canIncrease) {
				skillRollInfo.getSkillRoll().getRoll().increase();
				sheet.setRemainingSkillPoints(sheet.getRemainingSkillPoints() - pointCost);
				return true;
			}
		}
		else if (skillBuyRequest.getOperation() == SkillBuyRequest.OperationType.DEC) {
			if (skillRollInfo.canDecrease) {
				skillRollInfo.getSkillRoll().getRoll().decrease();
				sheet.setRemainingSkillPoints(sheet.getRemainingSkillPoints() + pointCost);
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
			if (hs.getSeverityType() == SeverityType.MAJOR) {
				hindranceBuyResponse.setMajor(hs.getHindrance());
				majorCount++;
			}
			if (hs.getSeverityType() == SeverityType.MINOR) {
				if (minorCount == 0) {
					hindranceBuyResponse.setMinor1(hs.getHindrance());
				}
				else {
					hindranceBuyResponse.setMinor2(hs.getHindrance());
				}
				minorCount++;
			}
		}
		
		if (majorCount > NUM_MAJOR_HINDRANCES || minorCount > NUM_MINOR_HINDRANCES) {
			throw new BadRequestException();
		}
		
		hindranceBuyResponse.setNumMajorsChosen(majorCount);
		hindranceBuyResponse.setNumMinorsChosen(minorCount);
		hindranceBuyResponse.setNumMajorSelections(NUM_MAJOR_HINDRANCES - majorCount);
		hindranceBuyResponse.setNumMinorSelections(NUM_MINOR_HINDRANCES - minorCount);
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
			if (hindranceBuyRequest.getSeverityType() == SeverityType.MAJOR && hindranceBuyResponse.getNumMajorsChosen() >= NUM_MAJOR_HINDRANCES) {
				return false;
			}
			else if (hindranceBuyRequest.getSeverityType() == SeverityType.MINOR && hindranceBuyResponse.getNumMinorsChosen() >= NUM_MINOR_HINDRANCES) {
				return false;
			}
			
			// everything seems to be in order, lets add that hindrance!
			HindranceSelection hs = new HindranceSelection();
			hs.setSheet(sheet);
			hs.setHindrance(hindrance);
			hs.setSeverityType(hindranceBuyRequest.getSeverityType());
			
			sheet.getChosenHindrances().add(hs);
			sheet.setRemainingHindrancePoints(sheet.getRemainingHindrancePoints() + hindranceBuyRequest.getSeverityType().getNumPoints());
			
			return true;
		}
		else if (hindranceBuyRequest.getOperation() == HindranceBuyRequest.OperationType.REMOVE) {
			// check that the sheet already has this hindrace
			HindranceSelection hindranceSelection = null;
			for (HindranceSelection hs : sheet.getChosenHindrances()) {
				if (hs.getHindrance().getType() == hindrance.getType()) {
					hindranceSelection = hs;
					break;
				}
			}
			if (hindranceSelection == null) {
				throw new BadRequestException();
			}
			
			sheet.getChosenHindrances().remove(hindranceSelection);
			sheet.setRemainingHindrancePoints(sheet.getRemainingHindrancePoints() - hindranceSelection.getSeverityType().getNumPoints());
		}

		return true;
	}
	


}