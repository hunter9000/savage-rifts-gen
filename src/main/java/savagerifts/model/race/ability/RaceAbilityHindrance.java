package savagerifts.model.race.ability;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import savagerifts.model.hindrance.Hindrance;
import savagerifts.model.hindrance.SeverityType;

import javax.persistence.*;

@Entity
@Table(name = "race_ability_hindrance")
@JsonIgnoreProperties(value = {"raceAbility"})
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

	@Column(name = "severity_type", updatable = false, nullable = false)
    @Enumerated(EnumType.STRING)
	private SeverityType severityType;
	
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

    public SeverityType getSeverityType() {
        return severityType;
    }
    public void setSeverityType(SeverityType severityType) {
        this.severityType = severityType;
    }
}