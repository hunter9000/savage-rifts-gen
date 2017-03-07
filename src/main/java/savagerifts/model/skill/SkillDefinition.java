package savagerifts.model.skill;

import savagerifts.model.edge.EdgeSkillPrerequisite;
import savagerifts.model.sheet.SkillPurchase;
import savagerifts.request.SkillBuyRequest;
import savagerifts.response.SkillRollInfo;

/** Wrapper around a SkillType and a SkillKnowledge */
public class SkillDefinition {
    public SkillType skillType;
    public SkillKnowledge skillKnowledge;

    public SkillDefinition(SkillRollInfo sri) {
        this.skillType = sri.getSkillRoll().getSkillType();
        this.skillKnowledge = sri.getSkillRoll().getSkillKnowledge();
    }

    public SkillDefinition(SkillBuyRequest skillBuyRequest) {
        this.skillType = skillBuyRequest.getSkill();
        this.skillKnowledge = skillBuyRequest.getSkillKnowledge();
    }

    public SkillDefinition(EdgeSkillPrerequisite prereq) {
        this.skillType = prereq.getSkillType();
        this.skillKnowledge = prereq.getSkillKnowledge();
    }

    public SkillDefinition(SkillPurchase skillPurchase) {
        this.skillType = skillPurchase.getSkillType();
        this.skillKnowledge = skillPurchase.getSkillKnowledge();
    }

    public SkillDefinition(SkillRoll roll) {
        this.skillType = roll.getSkillType();
        this.skillKnowledge = roll.getSkillKnowledge();
    }

    @Override
    public boolean equals(Object obj) {
        SkillDefinition other = (SkillDefinition)obj;
        boolean equal = this.skillType == other.skillType;
        if (this.skillKnowledge != null) {
            equal &= this.skillKnowledge.equals(other.skillKnowledge);
        }
        return equal;
    }

    @Override
    public int hashCode() {
        return this.skillType.hashCode() + (this.skillKnowledge != null ? this.skillKnowledge.hashCode() : 0);
    }
}
