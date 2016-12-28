package savagerifts.model.edge;

import savagerifts.model.DieType;
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
	
	@Column(name = "dieType", nullable = false, updatable = false)
	@Enumerated(EnumType.STRING)
	private DieType dieType;

	
	
}