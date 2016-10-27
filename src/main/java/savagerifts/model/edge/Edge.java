package savagerifts.model.edge;

import savagerifts.model.framework.Framework;
import savagerifts.model.sheet.Roll;
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
	
	@Column(name = "XpLevelType")
	@Enumerated(EnumType.STRING)
	private XPRank requiredLevel;

	@ManyToMany()
	@JoinTable(name = "edge_required_framework",
			joinColumns = {@JoinColumn(name = "edgeId", nullable = false, updatable = false) },		// column that points to this table
			inverseJoinColumns = { @JoinColumn(name = "frameworkId", nullable = false, updatable = false) })		// column that points to the framework table
	private List<Framework> requiredFrameworks;

	// i.e. STRENGTH d10+
	@OneToOne
	@JoinColumn(name = "requiredAttribute", updatable = false)
	private Roll requiredAttribute;
	
//	SkillType requiredSkill;
//	DieType requiredSkillDie;
	
	@ManyToMany()
	@JoinTable(name = "edge_prerequisites",
			joinColumns = {@JoinColumn(name = "edgeId", nullable = false, updatable = false) },		// column that points to this table
			inverseJoinColumns = { @JoinColumn(name = "prerequisiteEdgeId", nullable = false, updatable = false) })		// column that points to the other edge
	private List<Edge> prerequisiteEdges;



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

	public Roll getRequiredAttribute() {
		return requiredAttribute;
	}
	public void setRequiredAttribute(Roll requiredAttribute) {
		this.requiredAttribute = requiredAttribute;
	}

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