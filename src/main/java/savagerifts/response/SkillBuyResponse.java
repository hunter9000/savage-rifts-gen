package savagerifts.response;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.apache.commons.collections4.ListValuedMap;
import org.apache.commons.collections4.multimap.ArrayListValuedHashMap;
import savagerifts.model.skill.SkillDefinition;
import savagerifts.model.skill.SkillType;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SkillBuyResponse {

    private List<SkillRollInfo> skillRollInfos;

    private Integer remainingSkillPoints;

    private Map<SkillType, Collection<SkillRollInfo>> skillMap;

    @JsonIgnore
    private Map<SkillDefinition, SkillRollInfo> skillDefinitionMap;


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

        skillDefinitionMap = new HashMap<>();
        for (SkillRollInfo info : skillRollInfos) {
            skillDefinitionMap.put(new SkillDefinition(info), info);
        }
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

    public Map<SkillDefinition, SkillRollInfo> getSkillDefinitionMap() {
        return skillDefinitionMap;
    }
    public void setSkillDefinitionMap(Map<SkillDefinition, SkillRollInfo> skillDefinitionMap) {
        this.skillDefinitionMap = skillDefinitionMap;
    }
}
