package savagerifts.model.skill;

import savagerifts.model.AttributeType;

public enum SkillType {
	BOATING("Boating", AttributeType.AGI),
	CLIMBING("Climbing", AttributeType.STR),
	DRIVING("Driving", AttributeType.AGI),
	FIGHTING("Fighting", AttributeType.AGI),
	GAMBLING("Gambling", AttributeType.SMR),
	HEALING("Healing", AttributeType.SMR),
	INTIMIDATION("Intimidation", AttributeType.SPR),
	INVESTIGATION("Investigation", AttributeType.SMR),
	KNOWLEDGE("Knowledge", AttributeType.SMR),
	LOCKPICKING("Lockpicking", AttributeType.AGI),
	NOTICE("Notice", AttributeType.SMR),
	PERSUASION("Persuasion", AttributeType.SPR),
	PILOTING("Piloting", AttributeType.AGI),
	REPAIR("Repair", AttributeType.SMR),
	RIDING("Riding", AttributeType.AGI),
	SHOOTING("Shooting", AttributeType.AGI),
	STEALTH("Stealth", AttributeType.AGI),
	STREETWISE("Streetwise", AttributeType.SMR),
	SURVIVAL("Survivial", AttributeType.SMR),
	SWIMMING("Swimming", AttributeType.AGI),
	TAUNT("Taunt", AttributeType.SMR),
	THROWING("Throwing", AttributeType.AGI),
	TRACKING("Tracking", AttributeType.SMR);

	private String skillName;
	private AttributeType linkedAttribute;

	SkillType(String skillName, AttributeType linkedAttribute) {
		this.skillName = skillName;
		this.linkedAttribute = linkedAttribute;
	}



}