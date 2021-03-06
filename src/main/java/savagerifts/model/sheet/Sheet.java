package savagerifts.model.sheet;

import savagerifts.model.framework.Framework;
import savagerifts.model.hindrance.HindranceSelection;
import savagerifts.model.race.Race;
import savagerifts.model.skill.SkillRoll;
import savagerifts.model.user.User;
import savagerifts.util.SheetUtils;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "sheet")
public class Sheet {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;

	@OneToOne
	@JoinColumn(name = "owner", nullable = false, updatable = false)
	private User owner;

	@Column(name = "name", nullable = false)
	private String name;

	@Column(name = "rank", nullable = false)
	@Enumerated(EnumType.STRING)
	private XPRank rank = XPRank.NOVICE;

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
	private Integer remainingAttrPoints = SheetUtils.DEFAULT_ATTRIBUTE_POINTS;

	@Column(name = "remainingSkillPoints")
	private Integer remainingSkillPoints = SheetUtils.DEFAULT_SKILL_POINTS;
	
	@Column(name = "remainingHindrancePoints")
	private Integer remainingHindrancePoints = 0;		// points left from buying hindrances that can be spent on edges, etc
	
	@Column(name = "strain")
	private Integer strain;
	
	@Column(name = "toughness")
	private Integer toughness;
	
	@Column(name = "charisma")
	private Integer charisma = 0;
	
	@Column(name = "pace")
	private Integer pace;
	
	@Column(name = "parry")
	private Integer parry;
	
	@Column(name = "isp")
	private Integer isp = 0;

	@Column(name = "ppe")
	private Integer ppe = 0;

	@OneToOne
	@JoinColumn(name = "framework")
	private Framework framework;

	@OneToMany(mappedBy = "sheet", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)
	private List<PerkSelection> chosenPerks;		// this object needs to track the perk selected (if any) and the rollId of the class's tableroll so
													// we know which of the given rolls this was chosen by
	
	@Column(name = "creationStep", nullable = false)
	@Enumerated(EnumType.STRING)
	private SheetCreationStep creationStep = SheetCreationStep.TABLE_ROLLS;

	@OneToOne
	@JoinColumn(name = "race")
	private Race race;

	@OneToMany(mappedBy = "sheet", cascade = CascadeType.ALL)
	private List<SkillRoll> skills;			// skills and their rolls

	@OneToMany(mappedBy = "sheet", cascade = CascadeType.ALL, orphanRemoval = true, fetch=FetchType.EAGER)
	private Set<SkillPurchase> skillPurchases;


//	private List<Language> languages;		// known languages
//
//	private List<Power> powers;		// known powers

	@OneToMany(mappedBy = "sheet", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<HindranceSelection> chosenHindrances;		// chosen hindrances

	// things bought with hindrance points
	@OneToMany(mappedBy = "sheet", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<EdgeSelection> chosenEdgeSelections;
	
	@OneToMany(mappedBy = "sheet", cascade = CascadeType.ALL, orphanRemoval = true, fetch = FetchType.EAGER)
	private Set<AttributeRaiseSelection> chosenAttributeRaises;
	
	@OneToMany(mappedBy = "sheet", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<SkillRaiseSelection> chosenSkillRaises;
	
	@OneToMany(mappedBy = "sheet", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<MoneyRaiseSelection> chosenMoneyRaises;

	
	
//	boolean hasMagic? hasPsionics?
		

//	public Roll getAttribute(AttributeType type) {
//		switch(type) {
//			case STRENGTH: return getStrength();
//			case AGILITY: return getAgility();
//			case SMARTS: return getSmarts();
//			case SPIRIT: return getSpirit();
//			case VIGOR: return getVigor();
//			default: throw new RuntimeException("AttributeType " + type + " not implemented");
//		}
//	}


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

	public XPRank getRank() {
		return rank;
	}
	public void setRank(XPRank rank) {
		this.rank = rank;
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

	public List<SkillRoll> getSkills() {
		return skills;
	}
	public void setSkills(List<SkillRoll> skills) {
		this.skills = skills;
	}

	public Set<SkillPurchase> getSkillPurchases() {
		return skillPurchases;
	}
	public void setSkillPurchases(Set<SkillPurchase> skillPurchases) {
		this.skillPurchases = skillPurchases;
	}

	public List<HindranceSelection> getChosenHindrances() {
		return chosenHindrances;
	}
	public void setChosenHindrances(List<HindranceSelection> chosenHindrances) {
		this.chosenHindrances = chosenHindrances;
	}

	public List<EdgeSelection> getChosenEdgeSelections() {
		return chosenEdgeSelections;
	}
	public void setChosenEdgeSelections(List<EdgeSelection> chosenEdgeSelections) {
		this.chosenEdgeSelections = chosenEdgeSelections;
	}

	public Set<AttributeRaiseSelection> getChosenAttributeRaises() {
		return chosenAttributeRaises;
	}

	public void setChosenAttributeRaises(Set<AttributeRaiseSelection> chosenAttributeRaises) {
		this.chosenAttributeRaises = chosenAttributeRaises;
	}

	public List<SkillRaiseSelection> getChosenSkillRaises() {
		return chosenSkillRaises;
	}
	public void setChosenSkillRaises(List<SkillRaiseSelection> chosenSkillRaises) {
		this.chosenSkillRaises = chosenSkillRaises;
	}

	public List<MoneyRaiseSelection> getChosenMoneyRaises() {
		return chosenMoneyRaises;
	}
	public void setChosenMoneyRaises(List<MoneyRaiseSelection> chosenMoneyRaises) {
		this.chosenMoneyRaises = chosenMoneyRaises;
	}

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

}