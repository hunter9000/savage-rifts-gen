package savagerifts.model.race;

import savagerifts.model.edge.Edge;

import javax.persistence.*;

@Entity
@Table(name = "race_ability")
public class RaceAbility {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name = "race", nullable = false)
	private Race race;

	@Column(name = "isComplication")
	private boolean isComplication;

	@OneToOne
	@JoinColumn(name = "includedEdge")
	private Edge includedEdge;


	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public Race getRace() {
		return race;
	}
	public void setRace(Race race) {
		this.race = race;
	}

	public boolean isComplication() {
		return isComplication;
	}
	public void setComplication(boolean complication) {
		isComplication = complication;
	}

	public Edge getIncludedEdge() {
		return includedEdge;
	}
	public void setIncludedEdge(Edge includedEdge) {
		this.includedEdge = includedEdge;
	}
}