package savagerifts.model.race.ability;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import savagerifts.model.DieType;
import savagerifts.model.skill.SkillType;

import javax.persistence.*;

@Entity
@Table(name = "race_ability_skill_default")
@JsonIgnoreProperties(value = {"raceAbility"})
public class RaceAbilitySkillDefault {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    @OneToOne
    @JoinColumn(name = "race_ability", nullable = false, updatable = false)
    private RaceAbility raceAbility;

    @Column(name = "skill_type", nullable = false, updatable = false)
    @Enumerated(EnumType.STRING)
    private SkillType skillType;

    @Column(name = "starting_die_type", nullable = false, updatable = false)
    @Enumerated(EnumType.STRING)
    private DieType startingDieType;

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

    public DieType getStartingDieType() {
        return startingDieType;
    }
    public void setStartingDieType(DieType startingDieType) {
        this.startingDieType = startingDieType;
    }
}
