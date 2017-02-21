package savagerifts.model.edge;

import savagerifts.model.DieType;
import savagerifts.model.skill.SkillKnowledge;
import savagerifts.model.skill.SkillType;

import javax.persistence.*;

@Entity
@Table(name = "edge_skill_prerequisite")
public class EdgeSkillPrerequisite {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;

	@OneToOne
	@JoinColumn(name = "edge", nullable = false, updatable = false)
	private Edge edge;
	
	@Column(name = "skillType", nullable = false, updatable = false)
	@Enumerated(EnumType.STRING)
	private SkillType skillType;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "skillKnowledge")
	private SkillKnowledge skillKnowledge;

	@Column(name = "dieType", nullable = false, updatable = false)
	@Enumerated(EnumType.STRING)
	private DieType dieType;

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public Edge getEdge() {
		return edge;
	}
	public void setEdge(Edge edge) {
		this.edge = edge;
	}

	public SkillType getSkillType() {
		return skillType;
	}
	public void setSkillType(SkillType skillType) {
		this.skillType = skillType;
	}

	public SkillKnowledge getSkillKnowledge() {
		return skillKnowledge;
	}
	public void setSkillKnowledge(SkillKnowledge skillKnowledge) {
		this.skillKnowledge = skillKnowledge;
	}

	public DieType getDieType() {
		return dieType;
	}
	public void setDieType(DieType dieType) {
		this.dieType = dieType;
	}
}