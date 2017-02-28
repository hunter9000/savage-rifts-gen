package savagerifts.model.race.ability;

import savagerifts.model.race.Race;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "race_ability")
public class RaceAbility {
	


	// one to many attribute starting/max values  (str starts d6, max d12+1)


	// 1-* add a hindrance (dog boy gets outsider) (multiples always or'd together? )
	// 1-* powers granted, and extra powers from framework list (fennodi start with these 3, and get one more if they have a list to choose from)

	// 1-1 reach? (trimadore)
	
	// how to do choice of skills to start with? (trimadore)
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;
	
	@Column(name = "race_ability_type", nullable = false, updatable = false)
	@Enumerated(EnumType.STRING)
	private RaceAbilityType raceAbilityType;
	
	@ManyToOne
	@JoinColumn(name = "race", nullable = false)
	private Race race;

	@Column(name = "name", updatable = false, nullable = false)
	private String name;
	
	@Column(name = "description", length = 1024, updatable = false, nullable = false)
	private String description;

	// flag to restrict magic use
	@Column(name = "restricts_magic_use", nullable = false, updatable = false)
	private Boolean restrictsMagicUse;

	// 1-1 flag to restrict psionics use
	@Column(name = "restricts_psionics_use", nullable = false, updatable = false)
	private Boolean restrictsPsionicsUse;

	// 1-1 flag to restrict cybernetics use
	@Column(name = "restricts_cybernetics_use", nullable = false, updatable = false)
	private Boolean restrictsCyberneticsUse;

	// 1-1 ppe/isp adjustment (starts with +5 ppe)
	@Column(name = "ppe_adjustment", nullable = false, updatable = false)
	private Integer ppeAdjustment;

	@Column(name = "isp_adjustment", nullable = false, updatable = false)
	private Integer ispAdjustment;

	// 1-1 adjustment to charisma, toughness, parry, pace, running die, etc
	@Column(name = "charisma_adjustment", nullable = false, updatable = false)
	private Integer charismaAdjustment;

	@Column(name = "toughness_adjustment", nullable = false, updatable = false)
	private Integer toughnessAdjustment;

	@Column(name = "parry_adjustment", nullable = false, updatable = false)
	private Integer parryAdjustment;

	@Column(name = "pace_adjustment", nullable = false, updatable = false)
	private Integer paceAdjustment;

	@Column(name = "strain_adjustment", nullable = false, updatable = false)
	private Integer strainAdjustment;

	// bonuses to attributes
	@OneToMany(mappedBy = "raceAbility")
	private List<RaceAbilityAttrAdjustment> attributeAdjustments;

	// bonuses to skills
	@OneToMany(mappedBy = "raceAbility")
	private List<RaceAbilitySkillAdjustment> skillAdjustments;

	// one to many edges (adds w/e edge)
	@OneToMany(mappedBy = "raceAbility")
	private List<RaceAbilityEdge> edges;



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

	public Boolean getRestrictsMagicUse() {
		return restrictsMagicUse;
	}
	public void setRestrictsMagicUse(Boolean restrictsMagicUse) {
		this.restrictsMagicUse = restrictsMagicUse;
	}

	public Boolean getRestrictsPsionicsUse() {
		return restrictsPsionicsUse;
	}
	public void setRestrictsPsionicsUse(Boolean restrictsPsionicsUse) {
		this.restrictsPsionicsUse = restrictsPsionicsUse;
	}

	public Boolean getRestrictsCyberneticsUse() {
		return restrictsCyberneticsUse;
	}
	public void setRestrictsCyberneticsUse(Boolean restrictsCyberneticsUse) {
		this.restrictsCyberneticsUse = restrictsCyberneticsUse;
	}

	public Integer getPpeAdjustment() {
		return ppeAdjustment;
	}
	public void setPpeAdjustment(Integer ppeAdjustment) {
		this.ppeAdjustment = ppeAdjustment;
	}

	public Integer getIspAdjustment() {
		return ispAdjustment;
	}
	public void setIspAdjustment(Integer ispAdjustment) {
		this.ispAdjustment = ispAdjustment;
	}

	public Integer getCharismaAdjustment() {
		return charismaAdjustment;
	}
	public void setCharismaAdjustment(Integer charismaAdjustment) {
		this.charismaAdjustment = charismaAdjustment;
	}

	public Integer getToughnessAdjustment() {
		return toughnessAdjustment;
	}
	public void setToughnessAdjustment(Integer toughnessAdjustment) {
		this.toughnessAdjustment = toughnessAdjustment;
	}

	public Integer getParryAdjustment() {
		return parryAdjustment;
	}
	public void setParryAdjustment(Integer parryAdjustment) {
		this.parryAdjustment = parryAdjustment;
	}

	public Integer getPaceAdjustment() {
		return paceAdjustment;
	}
	public void setPaceAdjustment(Integer paceAdjustment) {
		this.paceAdjustment = paceAdjustment;
	}

	public Integer getStrainAdjustment() {
		return strainAdjustment;
	}
	public void setStrainAdjustment(Integer strainAdjustment) {
		this.strainAdjustment = strainAdjustment;
	}

	public List<RaceAbilityAttrAdjustment> getAttributeAdjustments() {
		return attributeAdjustments;
	}
	public void setAttributeAdjustments(List<RaceAbilityAttrAdjustment> attributeAdjustments) {
		this.attributeAdjustments = attributeAdjustments;
	}

	public List<RaceAbilitySkillAdjustment> getSkillAdjustments() {
		return skillAdjustments;
	}
	public void setSkillAdjustments(List<RaceAbilitySkillAdjustment> skillAdjustments) {
		this.skillAdjustments = skillAdjustments;
	}
}