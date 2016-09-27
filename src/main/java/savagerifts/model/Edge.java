package savagerifts.model;

import savagerifts.model.framework.Framework;
import savagerifts.model.sheet.XPLevelType;
import savagerifts.model.skill.SkillType;

import javax.persistence.Table;
import java.util.List;

//@Entity
//@Table(name = "edge")
public class Edge {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;
	
	@Column(name = "XpLevelType")
	@Enumerated(STRING)
	private XPLevelType requiredLevel;

	@ManyToMany()
	@JoinTable(name = "edge_required_framework",
			joinColumns = {@JoinColumn(name = "edgeId", nullable = false, updatable = false) },		// column that points to this table
			inverseJoinColumns = { @JoinColumn(name = "frameworkId", nullable = false, updatable = false) })		// column that points to the framework table
	private List<Framework> requiredFrameworks;

	// i.e. STR d10+
	//AttributeType requiredAttribute;
	//DieType requiredAttributeDie;
	private Roll requiredAttribute;
	
	SkillType requiredSkill;
	DieType requiredSkillDie;
	
	@ManyToMany()
	@JoinTable(name = "edge_prerequisites",
			joinColumns = {@JoinColumn(name = "edgeId", nullable = false, updatable = false) },		// column that points to this table
			inverseJoinColumns = { @JoinColumn(name = "prerequisiteEdgeId", nullable = false, updatable = false) })		// column that points to the other edge
	private List<Edge> prerequisiteEdges;
	
	
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