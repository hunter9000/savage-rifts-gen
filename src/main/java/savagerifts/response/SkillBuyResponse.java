package savagerifts.response;

import java.util.List;

public class SkillBuyResponse {

//    public List<SkillRoll> skills = new ArrayList<>();
//    public Map<SkillType, Boolean> canIncrease = new HashMap<>();
//    public Map<SkillType, Boolean> canDecrease = new HashMap<>();
    public List<SkillRollInfo> skillRollInfos;
    public Integer remainingSkillPoints;

    public List<SkillRollInfo> getSkillRollInfos() {
        return skillRollInfos;
    }
    public void setSkillRollInfos(List<SkillRollInfo> skillRollInfos) {
        this.skillRollInfos = skillRollInfos;
    }

    public Integer getRemainingSkillPoints() {
        return remainingSkillPoints;
    }
    public void setRemainingSkillPoints(Integer remainingSkillPoints) {
        this.remainingSkillPoints = remainingSkillPoints;
    }

//    public List<SkillRoll> getSkills() {
//        return skills;
//    }
//    public void setSkills(List<SkillRoll> skills) {
//        this.skills = skills;
//    }
//
//    public Map<SkillType, Boolean> getCanIncrease() {
//        return canIncrease;
//    }
//    public void setCanIncrease(Map<SkillType, Boolean> canIncrease) {
//        this.canIncrease = canIncrease;
//    }
//
//    public Map<SkillType, Boolean> getCanDecrease() {
//        return canDecrease;
//    }
//    public void setCanDecrease(Map<SkillType, Boolean> canDecrease) {
//        this.canDecrease = canDecrease;
//    }


}
