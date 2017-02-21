package savagerifts.util;


import savagerifts.model.AttributeType;
import savagerifts.model.edge.Edge;
import savagerifts.model.edge.EdgeAttributePrerequisite;
import savagerifts.model.edge.EdgeSkillPrerequisite;
import savagerifts.model.edge.PrerequisiteLogicType;
import savagerifts.model.framework.Framework;
import savagerifts.model.sheet.Roll;
import savagerifts.model.sheet.Sheet;
import savagerifts.model.skill.SkillDefinition;
import savagerifts.model.skill.SkillRoll;

import java.util.List;
import java.util.Map;

public class SheetEdgePurchaseManager {

    private Sheet sheet;
    private Edge edge;
    private Map<AttributeType, Roll> attrMap;
    private Map<SkillDefinition, SkillRoll> skillMap;

    public SheetEdgePurchaseManager(Sheet sheet, Edge edge) {
        this.sheet = sheet;
        this.edge = edge;

        this.attrMap = SheetAttributeUtils.populateAttributeMap(sheet);
        this.skillMap = SheetUtils.populateSkillMap(sheet);
    }

    public boolean sheetQualifiesForEdge() {
        // check required level, if not character creation

        // check edge's framework prereq
        for (Framework framework : edge.getRequiredFrameworks()) {
            if (!framework.equals(sheet.getFramework())) {
                return false;
            }
        }

        // check edge's attr prereqs
        if (!meetsAllEdgeAttributeRequirements()) {
            return false;
        }

        // check edge's skill prereqs
        if (!meetsAllSkillRequirements()) {
            return false;
        }

        // check edge's edge prereqs
        if (!meetsAllEdgeRequirements()) {
            return false;
        }

        return true;
    }

    private boolean meetsAllEdgeAttributeRequirements() {
        boolean attrsMet = edge.getAttributePrerequisiteLogicType() == PrerequisiteLogicType.AND;
        for (EdgeAttributePrerequisite prereq : edge.getAttributePrereqs() ) {
            if (edge.getAttributePrerequisiteLogicType() == PrerequisiteLogicType.AND) {
                attrsMet &= meetsAttributeRequirement(prereq);
            }
            else {
                attrsMet |= meetsAttributeRequirement(prereq);
            }
        }
        return attrsMet;
    }

    private boolean meetsAttributeRequirement(EdgeAttributePrerequisite prereq) {
        AttributeType type = prereq.getAttributeType();
        Roll attrRoll = attrMap.get(type);

        return prereq.getDieType().isLessThanOrEqualTo(attrRoll.getDieType());
    }

    private boolean meetsAllSkillRequirements() {
        boolean skillsMet = edge.getSkillPrerequisiteLogicType() == PrerequisiteLogicType.AND;
        for (EdgeSkillPrerequisite prereq : edge.getSkillPrereqs() ) {
            if (edge.getSkillPrerequisiteLogicType() == PrerequisiteLogicType.AND) {
                skillsMet &= meetsSkillRequirement(prereq);
            }
            else {
                skillsMet |= meetsSkillRequirement(prereq);
            }
        }
        return skillsMet;
    }

    private boolean meetsSkillRequirement(EdgeSkillPrerequisite prereq) {
        SkillRoll skillRoll = skillMap.get(new SkillDefinition(prereq.getSkillType(), prereq.getSkillKnowledge()));
        // if this sheet doesn't have this skill, doesn't meet req
        if (skillRoll == null) {
            return false;
        }

        return prereq.getDieType().isLessThanOrEqualTo(skillRoll.getRoll().getDieType());
    }

    private boolean meetsAllEdgeRequirements() {
//        PrerequisiteLogicType edgePrerequisiteLogicType;
//        List<Edge> prerequisiteEdges;
        for (Edge prereqEdge : edge.getPrerequisiteEdges()) {

        }
    }
}
