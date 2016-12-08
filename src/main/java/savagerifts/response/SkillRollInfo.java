package savagerifts.response;

import savagerifts.model.skill.SkillRoll;

public class SkillRollInfo {
    public SkillRoll skillRoll;
    public boolean canIncrease;
    public boolean canDecrease;

    public SkillRoll getSkillRoll() {
        return skillRoll;
    }
    public void setSkillRoll(SkillRoll skillRoll) {
        this.skillRoll = skillRoll;
    }

    public boolean isCanIncrease() {
        return canIncrease;
    }
    public void setCanIncrease(boolean canIncrease) {
        this.canIncrease = canIncrease;
    }

    public boolean isCanDecrease() {
        return canDecrease;
    }
    public void setCanDecrease(boolean canDecrease) {
        this.canDecrease = canDecrease;
    }
}
