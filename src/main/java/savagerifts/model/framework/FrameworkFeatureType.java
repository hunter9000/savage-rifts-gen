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
	UNSTABLE_PSYCHO("Unstable Psycho"),

	// cyber-knight
	CK_CYBER_ARMOR("Cyber-Armor"),
	CK_CYBERKINETIC_COMBAT("Cyberkinetic Combat"),
	CK_FIRST_INTO_BATTLE("First Into Battle"),
	CK_INNER_LIGHT("Inner Light"),
	CK_INTENSE_COMBAT_TRAINING("Intense Combat Training"),
	CK_MINOR_PSIONIC("Minor Psionic"),
	CK_PSI_SWORD("Psi-Sword"),
	CK_REVERED_PROTECTORS("Revered Protectors"),

	CK_CODE_OF_HONOR("Code of Honor"),
	CK_CYBERNETICS("Cybernetics"),
	
	// glitter boy
	GB_FULLY_TRAINED("Fully Trained"),
	GB_GLITTER_BOY_ARMOR("Glitter Boy Armor"),
	GB_HEROIC_LEGACY("Heroic Legacy"),
	GB_MANY_HAVE_FALLEN("Many Have Fallen"),

	GB_BIG_AND_SHINY("Big and Shiny"),
	GB_CLOSED_OFF("Closed Off"),
	GB_DIGGING_IN("Digging In"),
	GB_ENEMIES("Enemies"),
	GB_HIGHLY_TECHNICAL_MACHINERY("Highly Technical Machinery"),
	GB_SONIC_BOOM("Sonic Boom"),
	GB_STAND_BY_TO_FIRE("Stand By to Fire"),

	// juicer
	JC_INTERNAL_REPAIR_SYSTEM("Internal Repair System"),
	JC_SUPER_ENDURANCE("Super Endurance"),
	JC_SUPER_REFLEXES("Super Reflexes"),
	JC_SUPER_SPEED("Super Speed"),
	JC_SUPER_STRENGTH("Super Strength"),

	JC_CYBERNETICS("Cybernetics"),
	JC_DEATH_WISH("Death Wish"),
	JC_DRUG_INDUCED_EUPHORIA_TRANQUILITY("Drug-induced Euphoria/Tranquility"),
	JC_PSIONICS_AND_MAGIC("Psionics and Magic"),




	;
	
	private String displayName;
	public String getDisplayName() {
		return displayName;
	}
	FrameworkFeatureType(String displayName) {
		this.displayName = displayName;
	}
	
}