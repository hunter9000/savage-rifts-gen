package savagerifts.model.skill;

import com.fasterxml.jackson.annotation.JsonIgnore;
import savagerifts.model.AttributeType;
import savagerifts.model.sheet.Roll;
import savagerifts.model.sheet.Sheet;

import javax.persistence.*;

@Entity
@Table(name = "skill_roll")
public class SkillRoll {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id", unique = true, nullable = false)
    private Long id;

	@OneToOne
	@JoinColumn(name = "sheet", nullable = false, updatable = false)
	@JsonIgnore
	private Sheet sheet;

	@Column(name = "skillType", nullable = false)
	@Enumerated(EnumType.STRING)
	private SkillType skillType;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "skillKnowledge")
	private SkillKnowledge skillKnowledge;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "roll", nullable = false)
	private Roll roll;


	public SkillRoll() {

	}
	/** Copy constructor */
	public SkillRoll(SkillType skillType, Roll roll) {
		this.skillType = skillType;
		this.roll = new Roll(roll.getDieType(), roll.getModifier());
	}


	@Transient
	public String getDisplayName() {
		return skillType.getDisplayName();
	}
	public void setDisplayName(String displayName) {
		// nothing, read only property
	}

	@Transient
	public AttributeType getLinkedAttribute() {
		return skillType.getLinkedAttribute();
	}
	public void setLinkedAttribute(AttributeType linkedAttribute) {
		// nothing, readonly property
	}

	@Transient
	public String getLinkedAttributeDisplayName() {
		return this.skillType.getLinkedAttribute().getDisplayName();
	}
	public void setLinkedAttributeDisplayName(String linkedAttributeDisplayName) {
		// nothing, readonly property
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public Sheet getSheet() {
		return sheet;
	}
	public void setSheet(Sheet sheet) {
		this.sheet = sheet;
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

	public Roll getRoll() {
		return roll;
	}
	public void setRoll(Roll roll) {
		this.roll = roll;
	}
}