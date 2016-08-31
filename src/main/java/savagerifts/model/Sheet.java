package savagerifts.model;

import savagerifts.model.framework.Framework;
import savagerifts.model.perk.PerkSelection;
import savagerifts.model.power.Power;
import savagerifts.model.skill.SkillRoll;

import javax.persistence.*;
import java.util.List;

@Table
public class Sheet {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;

	// attribute die types
	@Column(name="strengthDieType")
	private DieType strengthDieType;
	@Column(name="agilityDieType")
	private DieType agilityDieType;
	@Column(name="smartsDieType")
	private DieType smartsDieType;
	@Column(name="spiritDieType")
	private DieType spiritDieType;
	@Column(name="vigorDieType")
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
	private Integer remianingHindrancePoints;		// points left from buying hindrances that can be spent on edges, etc
	
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
	
	@Column(name = "framework")
	private Framework framework;
	
	private List<PerkSelection> chosenPerks;		// this object needs to track the perk selected (if any) and the rollId of the class's tableroll so
								// we know which of the given rolls this was chosen by
	
	@Column(name = "hasCompletedTableRolls")
	private boolean hasCompletedTableRolls;		// true if all rolls have been made and all swaps have been made (if any)
	
	//@Column(name = "race")
	private Race race;
	
	private List<SkillRoll> skills;			// skills and their rolls
	
	private List<Language> languages;		// known languages
	
	private List<Power> powers;		// known powers
	
	private List<Hindrance> hindrances;		// chosen hindrances
	boolean hasSelectedHindrances;		// if the player has finished choosing hindrances, either by clicking finished, or selecting the last one
	
//	boolean hasMagic? hasPsionics?
	
	// transient stages
	//boolean hasSelectedFramework
	//boolean hasSelectedRace
	//boolean hasSelectedAttributes
	//boolean hasSelectedSkills
	//boolean hasSelectedHindrances	
	boolean hasSelectedEdges;
	
	
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
}