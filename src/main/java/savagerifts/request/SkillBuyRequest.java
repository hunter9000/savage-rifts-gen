package savagerifts.request;

import savagerifts.model.skill.SkillType;

public class SkillBuyRequest {
    private SkillType skill;
    private OperationType operation;		// inc or dec

    public enum OperationType {
        INC, DEC
    }

    public SkillType getSkill() {
        return skill;
    }
    public void setSkill(SkillType skill) {
        this.skill = skill;
    }

    public OperationType getOperation() {
        return operation;
    }
    public void setOperation(OperationType operation) {
        this.operation = operation;
    }
}
