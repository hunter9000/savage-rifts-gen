package savagerifts.response;

import savagerifts.model.skill.SkillRoll;
import savagerifts.model.skill.SkillType;

import java.util.HashMap;
import java.util.Map;

public class SkillBuyResponse {

    public Map<SkillType, SkillRoll> skills = new HashMap<>();
    public Map<SkillType, Boolean> canIncrease = new HashMap<>();
    public Map<SkillType, Boolean> canDecrease = new HashMap<>();
    public Integer remainingSkillPoints;


    public Map<SkillType, SkillRoll> getSkills() {
        return skills;
    }
    public void setSkills(Map<SkillType, SkillRoll> skills) {
        this.skills = skills;
    }

    public Map<SkillType, Boolean> getCanIncrease() {
        return canIncrease;
    }
    public void setCanIncrease(Map<SkillType, Boolean> canIncrease) {
        this.canIncrease = canIncrease;
    }

    public Map<SkillType, Boolean> getCanDecrease() {
        return canDecrease;
    }
    public void setCanDecrease(Map<SkillType, Boolean> canDecrease) {
        this.canDecrease = canDecrease;
    }

    public Integer getRemainingSkillPoints() {
        return remainingSkillPoints;
    }
    public void setRemainingSkillPoints(Integer remainingSkillPoints) {
        this.remainingSkillPoints = remainingSkillPoints;
    }
}
