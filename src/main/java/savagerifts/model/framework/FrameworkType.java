package savagerifts.model.framework;

import com.fasterxml.jackson.annotation.JsonFormat;

@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum FrameworkType {
	COMBAT_CYBORG("Combat Cyborg"),
	CRAZY("Crazy"),
	CYBER_KNIGHT("Cyber-Knight"),
	GLITTER_BOY("Glitter Boy"),
	JUICER("Juicer"),
	MARS("MARS"),
	BURSTER("Burster"),
	MIND_MELTER("Mind Melter"),
	LEY_LINE_WALKER("Ley Line Walker"),
	MYSTIC("Mystic"),
	TECHNO_WIZARD("Techno-Wizard"),
	DRAGON("Flame Wind Dragon Hatchling");

	String displayName;

	public String getDisplayName() {
		return displayName;
	}
	FrameworkType(String displayName) {
		this.displayName = displayName;
	}
}