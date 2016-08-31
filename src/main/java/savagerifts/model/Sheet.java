package savagerifts.model;

import savagerifts.model.framework.Framework;
import savagerifts.model.perk.PerkSelection;
import savagerifts.model.power.Power;
import savagerifts.model.skill.SkillRoll;

import javax.persistence.Table;
import java.util.List;

@Table
public class Sheet {
	DieType str, agi, smr, spr, vgr;
	Integer attrBonusesStr, attrBonusesAgi, attrBonusesSmr, attrBonusesSpr, attrBonusesVgr;
	Integer remainingAttrPoints;
	Integer remainingSkillPoints;
	Integer remianingHindrancePoints;		// points left from buying hindrances that can be spent on edges, etc
	Integer strain;
	Integer toughness;
	Integer charisma;
	Integer pace;
	Integer parry;
	Integer isp;
	Integer ppe;
	
	Framework framework;
	
	List<PerkSelection> chosenPerks;		// this object needs to track the perk selected (if any) and the rollId of the class's tableroll so
								// we know which of the given rolls this was chosen by
	boolean hasSelectedTableRolls;		// true if all rolls have been made and all swaps have been made (if any)
	
	Race race;
	
	List<SkillRoll> skills;			// skills and their rolls
	
	List<Language> languages;		// known languages
	
	List<Power> powers;		// known powers
	
	List<Hindrance> hindrances;		// chosen hindrances
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