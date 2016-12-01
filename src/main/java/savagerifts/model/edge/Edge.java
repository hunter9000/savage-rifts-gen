package savagerifts.model.edge;

import savagerifts.model.framework.Framework;
import savagerifts.model.sheet.XPRank;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "edge")
public class Edge {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;
	
	@Column(name = "edgeType", nullable = false, updatable = false, unique = true)
	@Enumerated(EnumType.STRING)
	private EdgeType edgeType;
	
	@Column(name = "edgeCategoryType", nullable = false, updatable = false, unique = true)
	@Enumerated(EnumType.STRING)
	private EdgeCategoryType edgeCategoryType;
	
	@Column(name = "description", nullable = false, updatable = false, length = 2000)
	private String description;
	
	@Column(name = "xpLevelType", nullable = false, updatable = false)
	@Enumerated(EnumType.STRING)
	private XPRank requiredLevel;

	@ManyToMany()
	@JoinTable(name = "edge_required_framework",
			joinColumns = {@JoinColumn(name = "edgeId", nullable = false, updatable = false) },		// column that points to this table
			inverseJoinColumns = { @JoinColumn(name = "frameworkId", nullable = false, updatable = false) })		// column that points to the framework table
	private List<Framework> requiredFrameworks;

	// ONE TO MANY, NEED JOIN TABLE
	// i.e. STRENGTH d10+ and AGILITY D6+
	// @OneToOne
	// @JoinColumn(name = "requiredAttribute", updatable = false)
	// private Roll requiredAttribute;
	@OneToMany(mappedBy = "sheet")		// don't cascade changes
	private List<EdgeAttributePrerequisite> attributePrereqs;
	
	@OneToMany(mappedBy = "sheet")		// don't cascade changes
	private List<EdgeSkillPrerequisite> skillPrereqs;
	
	@Column(name = "attributePrerequisiteLogicType", nullable = false, updatable = false)
	@Enumerated(EnumType.STRING)
	private PrerequisiteLogicType attributePrerequisiteLogicType;
	
	@Column(name = "skillPrerequisiteLogicType", nullable = false, updatable = false)
	@Enumerated(EnumType.STRING)
	private PrerequisiteLogicType skillPrerequisiteLogicType;
	
	@Column(name = "edgePrerequisiteLogicType", nullable = false, updatable = false)
	@Enumerated(EnumType.STRING)
	private PrerequisiteLogicType edgePrerequisiteLogicType;
	
//	SkillType requiredSkill;
//	DieType requiredSkillDie;
	
	@ManyToMany()
	@JoinTable(name = "edge_prerequisites",
			joinColumns = {@JoinColumn(name = "edgeId", nullable = false, updatable = false) },		// column that points to this table
			inverseJoinColumns = { @JoinColumn(name = "prerequisiteEdgeId", nullable = false, updatable = false) })		// column that points to the other edge
	private List<Edge> prerequisiteEdges;

	
	// are the reqs and'd or or'd? trademark weapon has or's skill prereq, soul drain has or'd edge prereq
	// acrobat has and'd attr, adept/assassin has and'd skills, champion has both
	// gadgeteer/mr fix it has non-specific skill reqs, how to handle?
	// scholar/professional/expert/master has req that depends on what you choose for the edge
	
	// wild card edges can't be chosen, they happen when dealt a joker
	
	
	// professional edges have non-stacking elements

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public XPRank getRequiredLevel() {
		return requiredLevel;
	}
	public void setRequiredLevel(XPRank requiredLevel) {
		this.requiredLevel = requiredLevel;
	}

	public List<Framework> getRequiredFrameworks() {
		return requiredFrameworks;
	}
	public void setRequiredFrameworks(List<Framework> requiredFrameworks) {
		this.requiredFrameworks = requiredFrameworks;
	}

//	public Roll getRequiredAttribute() {
//		return requiredAttribute;
//	}
//	public void setRequiredAttribute(Roll requiredAttribute) {
//		this.requiredAttribute = requiredAttribute;
//	}

//	public SkillType getRequiredSkill() {
//		return requiredSkill;
//	}
//
//	public void setRequiredSkill(SkillType requiredSkill) {
//		this.requiredSkill = requiredSkill;
//	}
//
//	public DieType getRequiredSkillDie() {
//		return requiredSkillDie;
//	}
//
//	public void setRequiredSkillDie(DieType requiredSkillDie) {
//		this.requiredSkillDie = requiredSkillDie;
//	}

	public List<Edge> getPrerequisiteEdges() {
		return prerequisiteEdges;
	}
	public void setPrerequisiteEdges(List<Edge> prerequisiteEdges) {
		this.prerequisiteEdges = prerequisiteEdges;
	}


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