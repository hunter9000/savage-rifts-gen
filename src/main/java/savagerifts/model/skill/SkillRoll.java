package savagerifts.model.skill;

import savagerifts.model.sheet.Roll;

import javax.persistence.*;

@Entity
@Table(name = "skill_roll")
public class SkillRoll {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id", unique = true, nullable = false)
    private Long id;
	
	@Column(name = "skillType", nullable = false)
	@Enumerated(EnumType.STRING)
	private SkillType skillType;

	@OneToOne
	@JoinColumn(name = "roll", nullable = false)
	private Roll roll;


	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public SkillType getSkillType() {
		return skillType;
	}
	public void setSkillType(SkillType skillType) {
		this.skillType = skillType;
	}

	public Roll getRoll() {
		return roll;
	}
	public void setRoll(Roll roll) {
		this.roll = roll;
	}
}