package savagerifts.model.race.ability;

import savagerifts.model.AttributeType;

import javax.persistence.*;

@Entity
@Table(name = "race_ability_attr_adjustment")
public class RaceAbilityAttrAdjustment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    @JoinColumn(name = "race_ability", nullable = false, updatable = false)
    private RaceAbility raceAbility;

    @Column(name = "attr_type", nullable = false, updatable = false)
    @Enumerated(EnumType.STRING)
    private AttributeType attrType;

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

    public AttributeType getAttrType() {
        return attrType;
    }
    public void setAttrType(AttributeType attrType) {
        this.attrType = attrType;
    }

    public Integer getBonus() {
        return bonus;
    }
    public void setBonus(Integer bonus) {
        this.bonus = bonus;
    }
}
