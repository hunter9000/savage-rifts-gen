package savagerifts.model.framework;

public enum FrameworkType {
	COMBAT_CYBORG("Combat Cyborg"),
	CRAZY("Crazy"),
	CYPER_KNIGHT("Cyber-Knight"),
	GLITTER_BOY("Glitter Boy"),
	JUICER("Juicer"),
	MARS("MARS"),
	BURSTER("Burster"),
	MIND_MELTER("Mind Melter"),
	LEY_LINE_WALKER("Ley Line Walker"),
	MYSTIC("Mystic"),
	TECHNO_WIZARD("Techno-Wizard"),
	DRAGON("Flame Wind Dragon Hatchling");

	String frameworkName;

	FrameworkType(String frameworkName) {
		this.frameworkName = frameworkName;
	}
}