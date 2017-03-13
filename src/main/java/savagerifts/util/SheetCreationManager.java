package savagerifts.util;


import savagerifts.model.AttributeType;
import savagerifts.model.framework.Framework;
import savagerifts.model.race.Race;
import savagerifts.model.race.ability.RaceAbility;
import savagerifts.model.sheet.Roll;
import savagerifts.model.sheet.Sheet;
import savagerifts.model.sheet.SheetCreationStep;
import savagerifts.model.skill.SkillRoll;
import savagerifts.model.skill.SkillType;
import savagerifts.model.user.User;
import savagerifts.request.NewSheetRequest;

import java.util.ArrayList;
import java.util.List;

public class SheetCreationManager {

    private Sheet sheet;

    public SheetCreationManager(Sheet sheet) {
        this.sheet = sheet;
    }

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

        new SheetCreationManager(sheet).handleInitialAttributes();

        return sheet;
    }

    /** Moves the character to the next step */
    public void moveToNextCreationStep() {
        // adjust the attributes based on the current step, to make it more clear what we need to take into account for adjustments.
        // i.e. step == RACE, make adjustments from the race
        this.recalculateAttributes();

        sheet.setCreationStep(sheet.getCreationStep());

        // move past race step if framework doesn't allow race to be chosen
        if (sheet.getCreationStep() == SheetCreationStep.RACE && !sheet.getFramework().isCanSelectRace()) {
            sheet.setCreationStep(sheet.getCreationStep());
        }
    }

    /** Called before setting the creation step, to include any changes introduced from the current step. */
    private void recalculateAttributes() {
        switch(sheet.getCreationStep()) {
            case TABLE_ROLLS:       // we're done making rolls
                // do nothing, we won't make adjustments from table rolls until we finish swapping
                break;
            case TABLE_ROLL_SWAP:   // we're done swapping rolls, make adjustments from the rolls
                handleTableRollAttributeAdjustments();
                break;
            case RACE:              // we've chosen a race, make adjustments from the race
                handleRaceAttributeAdjustments();
                break;
            case ATTRIBUTES:        // we've finished the point buy for attributes
                // do nothing, the attributes are adjusted as part of the manual attribute step
                break;
            case SKILLS:            // we've finished the point buy for skills
                // do nothing, skills don't affect attributes
                break;
            case HINDRANCES:        // we've finished buying hindrances
                handleHindranceAttributeAdjustments();
                break;
            case EDGES:             // we've finished buying edges/money/skill increases/attr increases. just need to adjust from edges
                handleEdgeAttributeAdjustments();
                break;
            case FINISHED:
                // :)
        }
    }

    // sheet is in initial step, set all to defaults from the framework
    private void handleInitialAttributes() {
        sheet.setRemainingAttrPoints(SheetAttributeUtils.getMaxAttributePoints(sheet));

        // set the minimum starting attribute from the framework to the current stat.
        // if not specified, it will be ignored and the default will be used
        for (AttributeType type : AttributeType.values()) {
            SheetAttributeUtils.populateAttributeMap(sheet).get(type).copy(SheetAttributeUtils.getMinAttribute(sheet, type));
        }
    }

    // adjust attributes based on the table rolls and swaps that were made
    private void handleTableRollAttributeAdjustments() {
        // for each of the table rolls, if it affects attrs, adjust
    }

    // we've just set the race, add race bonuses
    private void handleRaceAttributeAdjustments() {
        Race race = sheet.getRace();
        if (race == null) {
            return;
        }
        for (RaceAbility ability : race.getAbilities()) {
            // if this changes an attr, change it here
        }
    }

    // hindrances have been set, adjust the attrs if any hindrance affects them
    private void handleHindranceAttributeAdjustments() {
        // for each hindrance, if it affects attrs, adjust
    }

    // edges have been purchased during creation, adjust the attrs if any edge affects them
    private void handleEdgeAttributeAdjustments() {
        // for each edge, if it affects attrs, adjust
    }

}
