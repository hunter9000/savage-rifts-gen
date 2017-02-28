package savagerifts.model.race.ability;

import savagerifts.model.skill.SkillType;

import javax.persistence.*;

@Entity
@Table(name = "race_ability_skill_adjustment")
public class RaceAbilitySkillAdjustment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    @JoinColumn(name = "race_ability", nullable = false, updatable = false)
    private RaceAbility raceAbility;

    @Column(name = "skill_type", nullable = false, updatable = false)
    @Enumerated(EnumType.STRING)
    private SkillType skillType;

    // needed??
//    @JoinColumn()
//    private SkillKnowledge skillKnowledge;

    @Column(name = "bonus", nullable = false, updatable = false)
    private Integer bonus;

    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public RaceAbility getRaceAbility() {
        return raceAbility;
    }
    public void setRaceAbility(RaceAbility raceAbility) {
        this.raceAbility = raceAbility;
    }

    public SkillType getSkillType() {
        return skillType;
    }
    public void setSkillType(SkillType skillType) {
        this.skillType = skillType;
    }

//    public SkillKnowledge getSkillKnowledge() {
//        return skillKnowledge;
//    }
//    public void setSkillKnowledge(SkillKnowledge skillKnowledge) {
//        this.skillKnowledge = skillKnowledge;
//    }

    public Integer getBonus() {
        return bonus;
    }
    public void setBonus(Integer bonus) {
        this.bonus = bonus;
    }
}
