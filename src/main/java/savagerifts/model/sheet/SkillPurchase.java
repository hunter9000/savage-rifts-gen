package savagerifts.model.sheet;

import com.fasterxml.jackson.annotation.JsonIgnore;
import savagerifts.model.skill.SkillKnowledge;
import savagerifts.model.skill.SkillType;

import javax.persistence.*;

@Entity
@Table(name = "skill_purchase")
public class SkillPurchase {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    @JsonIgnore
    @OneToOne
    @JoinColumn(name = "sheet", nullable = false, updatable = false)
    private Sheet sheet;

    @Column(name = "skill_type", nullable = false)
    @Enumerated(EnumType.STRING)
    private SkillType skillType;

    @OneToOne
    @JoinColumn(name = "skill_knowledge", nullable = false, updatable = false)
    private SkillKnowledge skillKnowledge;

    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public Sheet getSheet() {
        return sheet;
    }
    public void setSheet(Sheet sheet) {
        this.sheet = sheet;
    }

    public SkillType getSkillType() {
        return skillType;
    }
    public void setSkillType(SkillType skillType) {
        this.skillType = skillType;
    }

    public SkillKnowledge getSkillKnowledge() {
        return skillKnowledge;
    }
    public void setSkillKnowledge(SkillKnowledge skillKnowledge) {
        this.skillKnowledge = skillKnowledge;
    }
}
