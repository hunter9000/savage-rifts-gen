package savagerifts.model;

import savagerifts.model.framework.Framework;
import savagerifts.model.sheet.XPLevelType;
import savagerifts.model.skill.SkillType;

import javax.persistence.Table;
import java.util.List;

//@Table
public class Edge {
	XPLevelType requiredLevel;

	List<Framework> requiredFrameworks;

	// i.e. STR d10+
	AttributeType requiredAttribute;
	DieType requiredAttributeDie;
	
	SkillType requiredSkill;
	DieType requiredSkillDie;
	
	List<Edge> prereqs;
	
	
//	// combat cyborg
//	//Bionic Augmentation, 		// built in to starting stats
//	Cybernetic Enhancements,
//	//High-Performance Legs, 	// gives fleet footed edge
//	M.D.C. Armor,
//	More Machine,
//	Size +1,
//	Unarmed Combat,
//
//
//
//	Upgradable
}