package savagerifts.model.race;

import savagerifts.model.edge.Edge;

import javax.persistence.*;

@Entity
@Table(name = "race_ability")
public class RaceAbility {
	
	// needs a one to many skill_adjustment (+2 to throwing)
	// one to many attr adjustment (-2 to smarts rolls)
	// one to many edges (adds w/e edge)
	// one to many attribute starting/max values  (str starts d6, max d12+1)
	// flag to restrict magic use
	// flag to restrict psionics use
	// flag to restrict cybernetics use
	// ppe/isp adjustment (starts with +5 ppe)
	// add a hindrance (dog boy gets outsider) (multiples always or'd together? )
	// powers granted, and extra powers from framework list (fennodi start with these 3, and get one more if they have a list to choose from)
	// adjustment to charisma, toughness, parry, pace, running die, etc
	// reach? (trimadore)
	
	// how to do choice of skills to start with? (trimadore)
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;
	
	@Column(name = "race_ability_type")
	@Enumerated(EnumType.STRING)
	private RaceAbilityType raceAbilityType;
	
	@ManyToOne
	@JoinColumn(name = "race", nullable = false)
	private Race race;

	@Column(name = "name", updatable = false, nullable = false)
	private String name;
	
	@Column(name = "description", length = 1024, updatable = false, nullable = false)
	private String description;

	@OneToOne
	@JoinColumn(name = "includedEdge")
	private Edge includedEdge;


	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public RaceAbilityType getRaceAbilityType() {
		return raceAbilityType;
	}
	public void setRaceAbilityType(RaceAbilityType raceAbilityType) {
		this.raceAbilityType = raceAbilityType;
	}

	public Race getRace() {
		return race;
	}
	public void setRace(Race race) {
		this.race = race;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	public Edge getIncludedEdge() {
		return includedEdge;
	}
	public void setIncludedEdge(Edge includedEdge) {
		this.includedEdge = includedEdge;
	}
}