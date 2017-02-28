package savagerifts.model.race.ability;

import savagerifts.model.hindrance.Hindrance;

import javax.persistence.*;

@Entity
@Table(name = "race_ability_hindrance")
public class RaceAbilityHindrance {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    @OneToOne
    @JoinColumn(name = "race_ability", nullable = false, updatable = false)
    private RaceAbility raceAbility;

	@OneToOne
	@JoinColumn(name = "hindrance", nullable = false, updatable = false)
	private Hindrance hindrance;

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

    public Hindrance getHindrance() {
        return hindrance;
    }
    public void setHindrance(Hindrance hindrance) {
        this.hindrance = hindrance;
    }
}