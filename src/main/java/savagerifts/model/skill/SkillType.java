package savagerifts.model.skill;

import com.fasterxml.jackson.annotation.JsonFormat;
import savagerifts.model.AttributeType;

@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum SkillType {
	ARCANA("Arcana", AttributeType.SMARTS),
	BOATING("Boating", AttributeType.AGILITY),
	CLIMBING("Climbing", AttributeType.STRENGTH),
	DRIVING("Driving", AttributeType.AGILITY),
	FAITH("Faith", AttributeType.SPIRIT),
	FIGHTING("Fighting", AttributeType.AGILITY),
	GAMBLING("Gambling", AttributeType.SMARTS),
	HEALING("Healing", AttributeType.SMARTS),
	INTIMIDATION("Intimidation", AttributeType.SPIRIT),
	INVESTIGATION("Investigation", AttributeType.SMARTS),
	KNOWLEDGE("Knowledge", AttributeType.SMARTS),
	LOCKPICKING("Lockpicking", AttributeType.AGILITY),
	NOTICE("Notice", AttributeType.SMARTS),
	PERSUASION("Persuasion", AttributeType.SPIRIT),
	PILOTING("Piloting", AttributeType.AGILITY),
	PSIONICS("Psionics", AttributeType.SMARTS),
	REPAIR("Repair", AttributeType.SMARTS),
	RIDING("Riding", AttributeType.AGILITY),
	SHOOTING("Shooting", AttributeType.AGILITY),
	SPELLCASTING("Spellcasting", AttributeType.SMARTS),
	STEALTH("Stealth", AttributeType.AGILITY),
	STREETWISE("Streetwise", AttributeType.SMARTS),
	SURVIVAL("Survivial", AttributeType.SMARTS),
	SWIMMING("Swimming", AttributeType.AGILITY),
	TAUNT("Taunt", AttributeType.SMARTS),
	THROWING("Throwing", AttributeType.AGILITY),
	TRACKING("Tracking", AttributeType.SMARTS),
	WEIRD_SCIENCE("Weird Science", AttributeType.SMARTS);

	private String skillName;
	private AttributeType linkedAttribute;

	public String getDisplayName() {
		return skillName;
	}
	public AttributeType getLinkedAttribute() {
		return linkedAttribute;
	}
	SkillType(String skillName, AttributeType linkedAttribute) {
		this.skillName = skillName;
		this.linkedAttribute = linkedAttribute;
	}

}