package savagerifts.model.sheet;

import savagerifts.model.DieType;
import savagerifts.model.framework.Framework;
import savagerifts.model.perk.PerkSelection;
import savagerifts.model.user.User;

import javax.persistence.*;
import java.util.List;

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

	// attribute die types
	@Column(name="strengthDieType")
	@Enumerated(EnumType.STRING)
	private DieType strengthDieType;
	@Column(name="agilityDieType")
	@Enumerated(EnumType.STRING)
	private DieType agilityDieType;
	@Column(name="smartsDieType")
	@Enumerated(EnumType.STRING)
	private DieType smartsDieType;
	@Column(name="spiritDieType")
	@Enumerated(EnumType.STRING)
	private DieType spiritDieType;
	@Column(name="vigorDieType")
	@Enumerated(EnumType.STRING)
	private DieType vigorDieType;
	
	// attribute bonuses
	@Column(name="strengthBonus")
	private Integer strengthBonus;
	@Column(name="agilityBonus")
	private Integer agilityBonus;
	@Column(name="smartsBonus")
	private Integer smartsBonus;
	@Column(name="spiritBonus")
	private Integer spiritBonus;
	@Column(name="vigorBonus")
	private Integer vigorBonus;
	
	@Column(name = "remainingAttributePoints")
	private Integer remainingAttrPoints;
	
	@Column(name = "remainingSkillPoints")
	private Integer remainingSkillPoints;
	
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

	@OneToMany(mappedBy = "sheet", cascade = CascadeType.ALL)
	private List<PerkSelection> chosenPerks;		// this object needs to track the perk selected (if any) and the rollId of the class's tableroll so
													// we know which of the given rolls this was chosen by
	
/*	@Column(name = "hasCompletedTableRolls", nullable = false)
	private boolean hasCompletedTableRolls = false;		// true if all rolls have been made and all swaps have been made (if any)
	
	@Column(name = "hasCompletedTableRollSwaps", nullable = false)
	private boolean hasCompletedTableRollSwaps = false;*/
	

	
	
	//@Column(name = "race")
//	private Race race;
//
//	private List<SkillRoll> skills;			// skills and their rolls
//
//	private List<Language> languages;		// known languages
//
//	private List<Power> powers;		// known powers
//
//	private List<Hindrance> hindrances;		// chosen hindrances

/*	@Column(name = "hasSelectedHindrances")
	boolean hasSelectedHindrances;		// if the player has finished choosing hindrances, either by clicking finished, or selecting the last one
*/	
//	boolean hasMagic? hasPsionics?
	
	// transient stages
	//boolean hasSelectedFramework
	//boolean hasSelectedRace
	//boolean hasSelectedAttributes
	//boolean hasSelectedSkills
	//boolean hasSelectedHindrances
/*
	@Column(name = "hasSelectedEdges")
	boolean hasSelectedEdges;
*/	
	
	ALTER TABLE DROP COLUMN `has_completed_table_rolls`
	ALTER TABLE DROP COLUMN `has_completed_table_roll_swaps`
	ALTER TABLE DROP COLUMN `has_selected_hindrances`
	ALTER TABLE DROP COLUMN `has_selected_edges`
	
//	void create() {
//		str = new Roll(DieType.D4, 0);
//		agi = new Roll(DieType.D4, 0);
//		smr = new Roll(DieType.D4, 0);
//		spr = new Roll(DieType.D4, 0);
//		vgr = new Roll(DieType.D4, 0);
//
//		remainingAttrPoints = 5;
//		remainingSkillPoints = 15;
//	}
//
//	void populateTransients() {
//		if (framework == null) {
//			hasSelectedFramework = true;
//		}
//		if () {
//
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

	public DieType getStrengthDieType() {
		return strengthDieType;
	}
	public void setStrengthDieType(DieType strengthDieType) {
		this.strengthDieType = strengthDieType;
	}

	public DieType getAgilityDieType() {
		return agilityDieType;
	}
	public void setAgilityDieType(DieType agilityDieType) {
		this.agilityDieType = agilityDieType;
	}

	public DieType getSmartsDieType() {
		return smartsDieType;
	}
	public void setSmartsDieType(DieType smartsDieType) {
		this.smartsDieType = smartsDieType;
	}

	public DieType getSpiritDieType() {
		return spiritDieType;
	}
	public void setSpiritDieType(DieType spiritDieType) {
		this.spiritDieType = spiritDieType;
	}

	public DieType getVigorDieType() {
		return vigorDieType;
	}
	public void setVigorDieType(DieType vigorDieType) {
		this.vigorDieType = vigorDieType;
	}

	public Integer getStrengthBonus() {
		return strengthBonus;
	}
	public void setStrengthBonus(Integer strengthBonus) {
		this.strengthBonus = strengthBonus;
	}

	public Integer getAgilityBonus() {
		return agilityBonus;
	}
	public void setAgilityBonus(Integer agilityBonus) {
		this.agilityBonus = agilityBonus;
	}

	public Integer getSmartsBonus() {
		return smartsBonus;
	}
	public void setSmartsBonus(Integer smartsBonus) {
		this.smartsBonus = smartsBonus;
	}

	public Integer getSpiritBonus() {
		return spiritBonus;
	}
	public void setSpiritBonus(Integer spiritBonus) {
		this.spiritBonus = spiritBonus;
	}

	public Integer getVigorBonus() {
		return vigorBonus;
	}
	public void setVigorBonus(Integer vigorBonus) {
		this.vigorBonus = vigorBonus;
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

	public Framework getFramework() {
		return framework;
	}
	public void setFramework(Framework framework) {
		this.framework = framework;
	}

	public boolean isHasCompletedTableRolls() {
		return hasCompletedTableRolls;
	}
	public void setHasCompletedTableRolls(boolean hasCompletedTableRolls) {
		this.hasCompletedTableRolls = hasCompletedTableRolls;
	}

	public boolean isHasCompletedTableRollSwaps() {
		return hasCompletedTableRollSwaps;
	}
	public void setHasCompletedTableRollSwaps(boolean hasCompletedTableRollSwaps) {
		this.hasCompletedTableRollSwaps = hasCompletedTableRollSwaps;
	}

	//	public Race getRace() {
//		return race;
//	}
//	public void setRace(Race race) {
//		this.race = race;
//	}
//
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

	public boolean isHasSelectedHindrances() {
		return hasSelectedHindrances;
	}
	public void setHasSelectedHindrances(boolean hasSelectedHindrances) {
		this.hasSelectedHindrances = hasSelectedHindrances;
	}

	public boolean isHasSelectedEdges() {
		return hasSelectedEdges;
	}
	public void setHasSelectedEdges(boolean hasSelectedEdges) {
		this.hasSelectedEdges = hasSelectedEdges;
	}
}