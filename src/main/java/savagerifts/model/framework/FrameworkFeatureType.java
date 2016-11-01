package savagerifts.model.framework;

public enum FrameworkFeatureType {
	// combat cyborg
	BIONIC_AUGMENTATION("Bionic Augmentation"),
	CYBERNETIC_ENHANCEMENTS("Cybernetic Enhancements"),
	HIGH_PERFORMANCE_LEGS("High-performance Legs"),
	MDC_ARMOR("M.D.C. Armor"),
	MORE_MACHINE("More Machine"),
	SIZE("Size +1"),
	UPGRADABLE("Upgradable"),
	UNARMED_COMBAT("Unarmed Combat"),

	ALL_THOSE_MOVING_PARTS("All Those Moving Parts"),
	GRAY_MATTER("Gray Matter"),
	HEAVY("Heavy"),
	INHUMAN_APPEARANCE("Inhuman Appearance"),
	LOSS_OF_DEXTERITY("Loss of Dexterity"),
	MALFUNCTION("Malfunction"),
	SHADOW_OF_THEMSELVES("Shadow of Themselves"),
	SPIRITUALLY_NUMB("Spiritually Number"),
	TOTAL_CONVERSION("Total Conversion"),

	// crazy
	BIO_REGENERATION("Bio-Regeneration"),
	ENHANCED_ATTRIBUTES("Enhanced Attributes"),
	ENHANCED_SPEED("Enhanced Speed"),
	HEIGHTENED_SENSES("Heightened Senses"),
	MINOR_PSIONIC("Minor Psionic"),
	QUICK("Quick"),
	SUPER_ENDURANCE("Super Endurance"),
	SUPER_REFLEXES("Super Reflexes"),

	CYBERNETICS("Cybernetics"),
	DISTINCTIVE_APPEARANCE("Distinctive Appearance"),
	MAGIC("Magic"),
	NEEDS_ACTION("Needs Action"),
	UNSTABLE_PSYCHO("Unstable Psycho");

	// cyber-knight
	CYBER_ARMOR("Cyber-Armor"),
	CYBERKINETIC_COMBAT("Cyberkinetic Combat"),
	FIRST_INTO_BATTLE("First Into Battle"),
	INNER_LIGHT("Inner Light"),
	INTENSE_COMBAT_TRAINING("Intense Combat Training"),
	MINOR_PSIONIC("Minor Psionic"),
	PSI_SWORD("Psi-Sword"),
	REVERED_PROTECTORS("Revered Protectors"),
	
	CODE_OF_HONOR("Code of Honor"),
	CYBERNETICS("Cybernetics");
	
	// glitter boy
	FULLY_TRAINED("Fully Trained"),
	GLITTER_BOY_ARMOR("Glitter Boy Armor"),
	HEROIC_LEGACY("Heroic Legacy"),
	MANY_HAVE_FALLEN("Many Have Fallen"),
	
	BIG_AND_SHINY("Big and Shiny"),
	CLOSED_OFF("Closed Off"),
	DIGGING_IN("Digging In"),
	ENEMIES,("Enemies"),
	HIGHLY_TECHNICAL_MACHINERY("Highly Technical Machinery"),
	SONIC_BOOM("Sonic Boom"),
	STAND_BY_TO_FIRE("Stand By to Fire"),
	
	;
	
	private String displayName;
	public String getDisplayName() {
		return displayName;
	}
	FrameworkFeatureType(String displayName) {
		this.displayName = displayName;
	}
	
}