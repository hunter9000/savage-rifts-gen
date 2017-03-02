package savagerifts.model.race.ability;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import savagerifts.model.edge.Edge;

import javax.persistence.*;

@Entity
@Table(name = "race_ability_edge")
@JsonIgnoreProperties(value = {"raceAbility"})
public class RaceAbilityEdge {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    @OneToOne
    @JoinColumn(name = "race_ability", nullable = false, updatable = false)
    private RaceAbility raceAbility;

    @OneToOne
    @JoinColumn(name = "edge", nullable = false, updatable = false)
    private Edge edge;

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

    public Edge getEdge() {
        return edge;
    }
    public void setEdge(Edge edge) {
        this.edge = edge;
    }
}
