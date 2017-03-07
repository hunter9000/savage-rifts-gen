package savagerifts.util;

import org.apache.commons.collections4.IterableUtils;
import org.apache.commons.collections4.MultiValuedMap;
import org.apache.commons.collections4.multimap.ArrayListValuedHashMap;
import savagerifts.model.AttributeType;
import savagerifts.model.DieType;
import savagerifts.model.hindrance.Hindrance;
import savagerifts.model.hindrance.HindranceSelection;
import savagerifts.model.hindrance.SeverityType;
import savagerifts.model.sheet.PerkSelection;
import savagerifts.model.sheet.Roll;
import savagerifts.model.sheet.Sheet;
import savagerifts.model.sheet.SkillPurchase;
import savagerifts.model.skill.SkillDefinition;
import savagerifts.model.skill.SkillRoll;
import savagerifts.request.HindranceBuyRequest;
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

	public static final int DEFAULT_ATTRIBUTE_POINTS = 5;
	public static final int DEFAULT_SKILL_POINTS = 15;


	public static PerkSelection getChosenPerkFromSheet(Sheet sheet, Long perkId) {
		return IterableUtils.find(sheet.getChosenPerks(), object -> object.getPerk().getId().equals(perkId));
	}

	/** Used during skill point buy step to calculate the current effective skill rolls, and if it can be increased/decreased */
	public static SkillBuyResponse calculateSkillPurchases(Sheet sheet) {
		SkillBuyResponse skillBuyResponse = new SkillBuyResponse();

		// base skills
		Map<SkillDefinition, SkillRoll> skillMap = populateSkillMap(sheet);

		// skill purchases
		MultiValuedMap<SkillDefinition, SkillPurchase> skillPurchaseMap = getSkillPurchaseMap(sheet);

		// add each of the effective skill rolls to the list of skillRollInfos
		List<SkillRollInfo> skillRollInfos = new ArrayList<>();
		Map<AttributeType, Roll> attrMap = SheetAttributeUtils.populateAttributeMap(sheet);
		for (Map.Entry<SkillDefinition, SkillRoll> entry : skillMap.entrySet()) {
			SkillRoll skillRoll = entry.getValue();

			// for each purchase, increase the roll by 1 die type
			for (SkillPurchase purchase : skillPurchaseMap.get(entry.getKey())) {
				skillRoll.getRoll().increase();
			}

			SkillRollInfo info = new SkillRollInfo();
			boolean lessThanMax = skillRoll.getRoll().compareTo(new Roll(DieType.D12, 0)) < 0;
			boolean canAfford = sheet.getRemainingSkillPoints() >= getSkillPointCost(skillRoll, attrMap, true);
			info.canIncrease = lessThanMax && canAfford;
			// can decrease if there's a SkillPurchase to remove for this skill
			info.canDecrease = !skillPurchaseMap.get(entry.getKey()).isEmpty();
			info.skillRoll = skillRoll;

			skillRollInfos.add(info);
		}

		skillBuyResponse.setSkillRollInfos(skillRollInfos);
		skillBuyResponse.setRemainingSkillPoints(sheet.getRemainingSkillPoints());

		return skillBuyResponse;
	}
	
	private static int getSkillPointCost(SkillRoll skillRoll, Map<AttributeType, Roll> attrMap, boolean increasing) {
		// cost to increase is 1 if the skill is less than it's attr, 2 otherwise
		// cost to decrease is 1 if the skill is leas than or equal to it's attr, 2 otherwise
		int compare = skillRoll.getRoll().compareTo(attrMap.get(skillRoll.getLinkedAttribute()));
		if (increasing) {
			return compare < 0 ? 1 : 2;
		}
		else {
			return compare <= 0 ? 1 : 2;
		}
	}

	/** Adds all the sheet's skillrolls to a map for serialization.
	 *  The SkillRoll values are copied so that they can be manipulated without affecting the persisted objects. */
	static Map<SkillDefinition, SkillRoll> populateSkillMap(Sheet sheet) {
		Map<SkillDefinition, SkillRoll> map = new HashMap<>();
		for (SkillRoll roll : sheet.getSkills()) {
			map.put(new SkillDefinition(roll) , new SkillRoll(roll.getSkillType(), roll.getRoll()));
		}
		return map;
	}

	static MultiValuedMap<SkillDefinition, SkillPurchase> getSkillPurchaseMap(Sheet sheet) {
		MultiValuedMap<SkillDefinition, SkillPurchase> skillPurchaseMap = new ArrayListValuedHashMap<>();
		for (SkillPurchase skillPurchase : sheet.getSkillPurchases()) {
			skillPurchaseMap.put(new SkillDefinition(skillPurchase), skillPurchase);
		}
		return skillPurchaseMap;
	}

	public static boolean validateAndMakeSkillChange(Sheet sheet, SkillBuyRequest skillBuyRequest) {
		SkillBuyResponse skills = SheetUtils.calculateSkillPurchases(sheet);

		// find the skillrollinfo that matches the request
		SkillRollInfo skillRollInfo = IterableUtils.find(skills.getSkillRollInfos(),
														 object -> new SkillDefinition((SkillRollInfo)object).equals(new SkillDefinition(skillBuyRequest)));

		MultiValuedMap<SkillDefinition, SkillPurchase> purchaseMap = getSkillPurchaseMap(sheet);

		// check that the stat can actually be inc'd/dec'd, then make the change to the attr and the attr points
		if (skillBuyRequest.isIncrease() && skillRollInfo.canIncrease) {
			int pointCost = getSkillPointCost(skillRollInfo.getSkillRoll(), SheetAttributeUtils.populateAttributeMap(sheet), true);
			SkillPurchase purchase = new SkillPurchase();
			purchase.setSheet(sheet);
			purchase.setSkillType(skillRollInfo.getSkillRoll().getSkillType());
			purchase.setSkillKnowledge(skillRollInfo.getSkillRoll().getSkillKnowledge());
			sheet.getSkillPurchases().add(purchase);
			sheet.setRemainingSkillPoints(sheet.getRemainingSkillPoints() - pointCost);
			return true;
		}
		if (skillBuyRequest.isDecrease() && skillRollInfo.canDecrease) {
			int pointCost = getSkillPointCost(skillRollInfo.getSkillRoll(), SheetAttributeUtils.populateAttributeMap(sheet), false);
			// find the matching skillpurchase in the sheet's list, remove it
			SkillPurchase skillPurchase = IterableUtils.find(sheet.getSkillPurchases(),
															 object -> new SkillDefinition((SkillPurchase) object).equals(new SkillDefinition(skillBuyRequest)));
			sheet.getSkillPurchases().remove(skillPurchase);
			sheet.setRemainingSkillPoints(sheet.getRemainingSkillPoints() + pointCost);
			return true;
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