package savagerifts.model.race.ability;

import savagerifts.model.AttributeType;

import javax.persistence.*;

/** Adds +1 to the default attribute die, and +1 to the max value for that attribute during attribute point buy */
@Entity
@Table(name = "race_ability_attr_default")
public class RaceAbilityAttrDefault {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    @OneToOne
    @JoinColumn(name = "race_ability", nullable = false, updatable = false)
    private RaceAbility raceAbility;

	@Column(name = "attribute", nullable = false, updatable = false)
	@Enumerated(EnumType.STRING)
	private AttributeType attribute;

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

    public AttributeType getAttribute() {
        return attribute;
    }
    public void setAttribute(AttributeType attribute) {
        this.attribute = attribute;
    }
}