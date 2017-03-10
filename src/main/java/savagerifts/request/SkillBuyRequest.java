package savagerifts.request;

import savagerifts.model.skill.SkillKnowledge;
import savagerifts.model.skill.SkillType;
import savagerifts.security.BadRequestException;

public class SkillBuyRequest {
    private SkillType skill;
    private SkillKnowledge skillKnowledge;
    private OperationType operation;		// inc or dec

    public enum OperationType {
        INC, DEC
    }

    public boolean isIncrease() {
        return operation == OperationType.INC;
    }
    public boolean isDecrease() {
        return operation == OperationType.DEC;
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

    public SkillKnowledge getSkillKnowledge() {
        return skillKnowledge;
    }
    public void setSkillKnowledge(SkillKnowledge skillKnowledge) {
        this.skillKnowledge = skillKnowledge;
    }

    public boolean validate() throws BadRequestException {
        String errorString = "";
        boolean error = false;
        if (skill == null) {
            errorString += " skill is required ";
            error = true;
        }
//        if (skillKnowledge == null) {
//            errorString += " skillKnowledge is invalid ";
//            error = true;
//        }
        if (operation == null) {
            errorString += " operation is required ";
            error = true;
        }
        if (error) {
            throw new BadRequestException("request is invalid for these reasons: " + errorString);
        }
        return true;
    }

    @Override
    public String toString() {
        return skill + "[" + skillKnowledge + "] " + operation;
    }
}