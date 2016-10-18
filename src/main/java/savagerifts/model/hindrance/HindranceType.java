package savagerifts.model.hindrance;

public enum HindranceType {
	ALL_THUMBS("All Thumbs", SeverityType.MINOR),
	ANEMIC("Anemic", SeverityType.MINOR),
	ARROGANT("Arrogant", SeverityType.MAJOR),
	BAD_EYES("Bad Eyes", SeverityType.MINOR, SeverityType.MAJOR),
	BAD_LUCK("Bad Luck", SeverityType.MAJOR),
	BIG_MOUTH("Big Mouth", SeverityType.MINOR),
	BLIND("Blind", SeverityType.MAJOR),
	BLOODTHIRSTY("Bloodthirsty", SeverityType.MAJOR),
	CAUTIOUS("Cautious", SeverityType.MINOR),
	CLUELESS("Clueless", SeverityType.MAJOR),
	CODE_OF_HONOR("Code of Honor", SeverityType.MAJOR),
	CURIOUS("Curious", SeverityType.MAJOR),
	DEATH_WISH("Death Wish", SeverityType.MINOR),
	DELUSIONAL("Delusional", SeverityType.MINOR, SeverityType.MAJOR),
	DOUBTING_THOMAS("Doubting Thomas", SeverityType.MINOR),
	ELDERLY("Elderly", SeverityType.MAJOR),
	ENEMY("Enemy", SeverityType.MINOR, SeverityType.MAJOR),
	GREEDY("Greedy", SeverityType.MINOR, SeverityType.MAJOR),
	HABIT("Habit", SeverityType.MINOR, SeverityType.MAJOR),
	HARD_OF_HEARING("Hard of Hearing", SeverityType.MINOR, SeverityType.MAJOR),
	HEROIC("Heroic", SeverityType.MAJOR),
	ILLITERATE("Illiterate", SeverityType.MINOR),
	LAME("Lame", SeverityType.MAJOR),
	LAST_CALL("Last Call", SeverityType.MINOR),
	LOYAL("Loyal", SeverityType.MINOR),
	MANIA("Mania", SeverityType.MINOR, SeverityType.MAJOR),
	MEAN("Mean", SeverityType.MINOR),
	MONOLOGUER("Monologuer", SeverityType.MAJOR),
	OBESE("Obese", SeverityType.MINOR),
	ONE_ARM("One Arm", SeverityType.MAJOR),
	ONE_EYE("One Eye", SeverityType.MAJOR),
	ONE_LEG("One Leg", SeverityType.MAJOR),
	OUTSIDER("Outsider", SeverityType.MINOR),
	OVERCONFIDENT("Overconfident", SeverityType.MAJOR),
	PACIFIST("Pacifist", SeverityType.MINOR, SeverityType.MAJOR),
	PHOBIA("Phobia", SeverityType.MINOR, SeverityType.MAJOR),
	POVERTY("Poverty", SeverityType.MINOR),
	QUIRK("Quirk", SeverityType.MINOR),
	SMALL("Small", SeverityType.MAJOR),
	STUBBORN("Stubborn", SeverityType.MINOR),
	UGLY("Ugly", SeverityType.MINOR),
	VENGEFUL("Vengeful", SeverityType.MINOR, SeverityType.MAJOR),
	VOW("Vow", SeverityType.MINOR, SeverityType.MAJOR),
	WANTED("Wanted", SeverityType.MINOR, SeverityType.MAJOR),
	YELLOW("Yellow", SeverityType.MAJOR),
	YOUNG("Young", SeverityType.MAJOR);
	
	private String displayName;
	private boolean isMinor;
	private boolean isMajor;
	
	HindranceType(String displayName, SeverityType... severities) {
		this.displayName = displayName;
		for (SeverityType sev : severities) {
			isMinor |= (sev == SeverityType.MINOR);
			isMajor |= (sev == SeverityType.MAJOR);
		}
	}
	public String getDisplayName() {
		return displayName;
	}
	public boolean isMinor() {
		return isMinor;
	}
	public boolean isMajor() {
		return isMajor;
	}
	public boolean isMinorOrMajor() {
		return isMinor || isMajor;
	}
}

