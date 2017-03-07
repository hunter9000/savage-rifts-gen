package savagerifts.response;

import org.apache.commons.collections4.ListValuedMap;
import org.apache.commons.collections4.multimap.ArrayListValuedHashMap;
import savagerifts.model.skill.SkillType;

import java.util.Collection;
import java.util.List;
import java.util.Map;

public class SkillBuyResponse {

//    public List<SkillRoll> skills = new ArrayList<>();
//    public Map<SkillType, Boolean> canIncrease = new HashMap<>();
//    public Map<SkillType, Boolean> canDecrease = new HashMap<>();
    private List<SkillRollInfo> skillRollInfos;
    private Integer remainingSkillPoints;

    private Map<SkillType, Collection<SkillRollInfo>> skillMap;


    public List<SkillRollInfo> getSkillRollInfos() {
        return skillRollInfos;
    }
    public void setSkillRollInfos(List<SkillRollInfo> skillRollInfos) {
        this.skillRollInfos = skillRollInfos;

        ListValuedMap<SkillType, SkillRollInfo> multiMap = new ArrayListValuedHashMap<>();
        for (SkillRollInfo info : skillRollInfos) {
            multiMap.put(info.getSkillRoll().getSkillType(), info);
        }

        skillMap = multiMap.asMap();
    }

    public Integer getRemainingSkillPoints() {
        return remainingSkillPoints;
    }
    public void setRemainingSkillPoints(Integer remainingSkillPoints) {
        this.remainingSkillPoints = remainingSkillPoints;
    }

    public Map<SkillType, Collection<SkillRollInfo>> getSkillMap() {
        return skillMap;
    }
    public void setSkillMap(Map<SkillType, Collection<SkillRollInfo>> skillMap) {
        this.skillMap = skillMap;
    }
}
