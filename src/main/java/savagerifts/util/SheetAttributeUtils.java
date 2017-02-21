package savagerifts.util;

import savagerifts.model.AttributeType;
import savagerifts.model.DieType;
import savagerifts.model.framework.Framework;
import savagerifts.model.sheet.Roll;
import savagerifts.model.sheet.Sheet;
import savagerifts.model.sheet.SheetCreationStep;
import savagerifts.request.AttributeBuyRequest;
import savagerifts.response.AttributeBuyResponse;

import java.util.HashMap;
import java.util.Map;

public class SheetAttributeUtils {

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
        for (AttributeType type : AttributeType.values()) {
            sheet.getAttribute(type).copy(getMinAttribute(sheet, type));
        }
        // sheet.getStrength().copy(getMinStrength(sheet));
        // sheet.getAgility().copy(getMinAgility(sheet));
        // sheet.getSmarts().copy(getMinSmarts(sheet));
        // sheet.getSpirit().copy(getMinSpirit(sheet));
        // sheet.getVigor().copy(getMinVigor(sheet));
    }

    public static Integer getMaxAttributePoints(Sheet sheet) {
        Framework framework = sheet.getFramework();
        if (framework != null && framework.getStartingAttributePoints() != null) {
            return framework.getStartingAttributePoints();
        }
        return Sheet.DEFAULT_ATTRIBUTE_POINTS;
    }

    private static Roll getMinAttribute(Sheet sheet, AttributeType type) {
        if (sheet.getFramework() != null && sheet.getFramework().getStartingAttribute(type) != null) {
            return sheet.getFramework().getStartingAttribute(type);
        }
        return new Roll();		// d4+0
    }

    private static Roll getMaxAttribute(Sheet sheet, AttributeType type) {
        if (sheet.getFramework() != null && sheet.getFramework().getMaxAttribute(type) != null) {
            return sheet.getFramework().getMaxAttribute(type);
        }
        return new Roll(DieType.D12, 0);		// d12+0
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
            boolean canIncrease = true;
            boolean canDecrease = false;
            if (sheet.getCreationStep() == SheetCreationStep.ATTRIBUTES) {
                // during character creation, can increase if the current is less than the max and there are points left
                canIncrease = attrs.attributes.get(type).compareTo(getMaxAttribute(sheet, type)) < 0 && attrs.remainingAttrPoints > 0;
                canDecrease = attrs.attributes.get(type).compareTo(getMinAttribute(sheet, type)) > 0 && attrs.remainingAttrPoints < getMaxAttributePoints(sheet);
            }
            attrs.canIncrease.put(type, canIncrease);
            // can decrease if current is above min, and current points are less than the max starting number
            attrs.canDecrease.put(type, canDecrease);
        }

        // get race, set can increase to compareto(race.max)			???


        return attrs;
    }

    /** Adds all the sheet's skillrolls to a map for serialization. Use sheet.getAttribute(type) if you just need to find out an attribute value. */
    static Map<AttributeType, Roll> populateAttributeMap(Sheet sheet) {
        Map<AttributeType, Roll> map = new HashMap<>();
        map.put(AttributeType.STRENGTH, sheet.getStrength());
        map.put(AttributeType.AGILITY, sheet.getAgility());
        map.put(AttributeType.SMARTS, sheet.getSmarts());
        map.put(AttributeType.SPIRIT, sheet.getSpirit());
        map.put(AttributeType.VIGOR, sheet.getVigor());
        return map;
    }

    public static boolean validateAndMakeAttributeChange(Sheet sheet, AttributeBuyRequest pointBuyRequest) {
        AttributeBuyResponse attributes = calculateAttributePurchases(sheet);

        // get the attribute that we want to change
        //Map<AttributeType, Roll> attrMap = populateAttributeMap(sheet);
        //Roll attrRoll = attrMap.get(pointBuyRequest.getAttribute());
        Roll attrRoll = sheet.getAttribute(pointBuyRequest.getAttribute());

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
}
