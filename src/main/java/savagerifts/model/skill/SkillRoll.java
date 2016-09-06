package savagerifts.model.skill;

import savagerifts.model.Roll;

@Entity
@Table(name = "skill_roll")
public class SkillRoll {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id", unique = true, nullable = false)
    private Long id;
	
	@Column(name = "skillType", nullable = false)
	@Enumerated(STRING)
	SkillType skillType;
	
	@Column(name = "roll", nullable = false)
	Roll roll;
}