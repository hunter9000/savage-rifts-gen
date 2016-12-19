package savagerifts.model.sheet;

import com.fasterxml.jackson.annotation.JsonIgnore;
import savagerifts.model.skill.SkillType;

import javax.persistence.*;

@Entity
@Table(name = "skill_raise_selection")
public class SkillRaiseSelection {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    @JsonIgnore
    @OneToOne
    @JoinColumn(name = "sheet", nullable = false, updatable = false)
    private Sheet sheet;

    @Column(name = "skill", nullable = false, updatable = false)
    private SkillType skillType;


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
}
