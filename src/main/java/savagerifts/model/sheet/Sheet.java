package savagerifts.model.sheet;

import savagerifts.model.DieType;
import savagerifts.model.framework.Framework;
import savagerifts.model.hindrance.Hindrance;
import savagerifts.model.perk.PerkSelection;
import savagerifts.model.race.Race;
import savagerifts.model.user.User;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "sheet")
public class Sheet {

	public static final int DEFAULT_ATTRIBUTE_POINTS = 5;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;

	@OneToOne
	@JoinColumn(name = "owner", nullable = false, updatable = false)
	private User owner;

	@Column(name = "name", nullable = false)
	private String name;


	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "strength", nullable = false)
	private Roll strength = new Roll();
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "agility", nullable = false)
	private Roll agility = new Roll();
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "smarts", nullable = false)
	private Roll smarts = new Roll();
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "spirit", nullable = false)
	private Roll spirit = new Roll();
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "vigor", nullable = false)
	private Roll vigor = new Roll();
	
	
	@Column(name = "remainingAttributePoints")
	private Integer remainingAttrPoints = Sheet.DEFAULT_ATTRIBUTE_POINTS;

	@Column(name = "remainingSkillPoints")
	private Integer remainingSkillPoints = 15;
	
	@Column(name = "remainingHindrancePoints")
	private Integer remainingHindrancePoints;		// points left from buying hindrances that can be spent on edges, etc
	
	@Column(name = "strain")
	private Integer strain;
	
	@Column(name = "toughness")
	private Integer toughness;
	
	@Column(name = "charisma")
	private Integer charisma;
	
	@Column(name = "pace")
	private Integer pace;
	
	@Column(name = "parry")
	private Integer parry;
	
	@Column(name = "isp")
	private Integer isp;
	
	@Column(name = "ppe")
	private Integer ppe;

	@OneToOne
	@JoinColumn(name = "framework")
	private Framework framework;

	@OneToMany(mappedBy = "sheet", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<PerkSelection> chosenPerks;		// this object needs to track the perk selected (if any) and the rollId of the class's tableroll so
													// we know which of the given rolls this was chosen by
	
	@Column(name = "creationStep", nullable = false)
	@Enumerated(EnumType.STRING)
	private SheetCreationStep creationStep = SheetCreationStep.TABLE_ROLLS;

	@OneToOne
	@JoinColumn(name = "race")
	private Race race;

//	private List<SkillRoll> skills;			// skills and their rolls
//
//	private List<Language> languages;		// known languages
//
//	private List<Power> powers;		// known powers

//	@OneToMany(mappedBy = "sheet", cascade = CascadeType.ALL)
//	private List<Hindrance> hindrances;		// chosen hindrances

/*	@Column(name = "hasSelectedHindrances")
	boolean hasSelectedHindrances;		// if the player has finished choosing hindrances, either by clicking finished, or selecting the last one
*/	
//	boolean hasMagic? hasPsionics?
	
/*
	@Column(name = "hasSelectedEdges")
	boolean hasSelectedEdges;
*/	


	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public User getOwner() {
		return owner;
	}
	public void setOwner(User owner) {
		this.owner = owner;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}


	public Roll getStrength() {
		return strength;
	}
	public void setStrength(Roll strength) {
		this.strength = strength;
	}

	public Roll getAgility() {
		return agility;
	}
	public void setAgility(Roll agility) {
		this.agility = agility;
	}

	public Roll getSmarts() {
		return smarts;
	}
	public void setSmarts(Roll smarts) {
		this.smarts = smarts;
	}

	public Roll getSpirit() {
		return spirit;
	}
	public void setSpirit(Roll spirit) {
		this.spirit = spirit;
	}

	public Roll getVigor() {
		return vigor;
	}
	public void setVigor(Roll vigor) {
		this.vigor = vigor;
	}

	public Integer getRemainingAttrPoints() {
		return remainingAttrPoints;
	}
	public void setRemainingAttrPoints(Integer remainingAttrPoints) {
		this.remainingAttrPoints = remainingAttrPoints;
	}

	public Integer getRemainingSkillPoints() {
		return remainingSkillPoints;
	}
	public void setRemainingSkillPoints(Integer remainingSkillPoints) {
		this.remainingSkillPoints = remainingSkillPoints;
	}

	public Integer getRemainingHindrancePoints() {
		return remainingHindrancePoints;
	}
	public void setRemainingHindrancePoints(Integer remainingHindrancePoints) {
		this.remainingHindrancePoints = remainingHindrancePoints;
	}

	public Integer getStrain() {
		return strain;
	}
	public void setStrain(Integer strain) {
		this.strain = strain;
	}

	public Integer getToughness() {
		return toughness;
	}
	public void setToughness(Integer toughness) {
		this.toughness = toughness;
	}

	public Integer getCharisma() {
		return charisma;
	}
	public void setCharisma(Integer charisma) {
		this.charisma = charisma;
	}

	public Integer getPace() {
		return pace;
	}
	public void setPace(Integer pace) {
		this.pace = pace;
	}

	public Integer getParry() {
		return parry;
	}
	public void setParry(Integer parry) {
		this.parry = parry;
	}

	public Integer getIsp() {
		return isp;
	}
	public void setIsp(Integer isp) {
		this.isp = isp;
	}

	public Integer getPpe() {
		return ppe;
	}
	public void setPpe(Integer ppe) {
		this.ppe = ppe;
	}

	public List<PerkSelection> getChosenPerks() {
		return chosenPerks;
	}
	public void setChosenPerks(List<PerkSelection> chosenPerks) {
		this.chosenPerks = chosenPerks;
	}

	public SheetCreationStep getCreationStep() {
		return creationStep;
	}
	public void setCreationStep(SheetCreationStep creationStep) {
		this.creationStep = creationStep;
	}

	public Framework getFramework() {
		return framework;
	}
	public void setFramework(Framework framework) {
		this.framework = framework;
	}

	public Race getRace() {
		return race;
	}
	public void setRace(Race race) {
		this.race = race;
	}

//	public List<SkillRoll> getSkills() {
//		return skills;
//	}
//	public void setSkills(List<SkillRoll> skills) {
//		this.skills = skills;
//	}
//
//	public List<Language> getLanguages() {
//		return languages;
//	}
//	public void setLanguages(List<Language> languages) {
//		this.languages = languages;
//	}
//
//	public List<Power> getPowers() {
//		return powers;
//	}
//	public void setPowers(List<Power> powers) {
//		this.powers = powers;
//	}
//
//	public List<Hindrance> getHindrances() {
//		return hindrances;
//	}
//	public void setHindrances(List<Hindrance> hindrances) {
//		this.hindrances = hindrances;
//	}

//	public boolean isHasSelectedHindrances() {
//		return hasSelectedHindrances;
//	}
//	public void setHasSelectedHindrances(boolean hasSelectedHindrances) {
//		this.hasSelectedHindrances = hasSelectedHindrances;
//	}
//
//	public boolean isHasSelectedEdges() {
//		return hasSelectedEdges;
//	}
//	public void setHasSelectedEdges(boolean hasSelectedEdges) {
//		this.hasSelectedEdges = hasSelectedEdges;
//	}
}