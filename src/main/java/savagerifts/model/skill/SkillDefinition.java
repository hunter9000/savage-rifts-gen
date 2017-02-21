package savagerifts.model.skill;

/** Wrapper around a SkillType and a SkillKnowledge */
public class SkillDefinition {
    public SkillType skillType;
    public SkillKnowledge skillKnowledge;

    public SkillDefinition() {

    }
    public SkillDefinition(SkillType skillType, SkillKnowledge skillKnowledge) {
        this.skillType = skillType;
        this.skillKnowledge = skillKnowledge;
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
