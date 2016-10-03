package savagerifts.model.hindrance;

//gadgeteer, rich, filthy rich is different,
//noble, no mercy not available

public enum HindranceType {
	ALL_THUMBS(SeverityType.MINOR),
	ANEMIC(SeverityType.MINOR),
	ARROGANT(SeverityType.MAJOR),
	BAD_EYES(SeverityType.MINOR, SeverityType.MAJOR),
	BAD_LUCK(SeverityType.MAJOR),
	BIG_MOUTH(SeverityType.MINOR),
	BLIND(SeverityType.MAJOR),
	BLOODTHIRSTY(SeverityType.MAJOR),
	CAUTIOUS(SeverityType.MINOR),
	CLUELESS(SeverityType.MAJOR),
	CODE_OF_HONOR(SeverityType.MAJOR),
	CURIOUS(SeverityType.MAJOR),
	DEATH_WISH(SeverityType.MINOR),
	DELUSIONAL(SeverityType.MINOR, SeverityType.MAJOR),
	DOUBTING_THOMAS(SeverityType.MINOR),
	ELDERLY(SeverityType.MAJOR),
	ENEMY(SeverityType.MINOR, SeverityType.MAJOR),
	GREEDY(SeverityType.MINOR, SeverityType.MAJOR),
	HABIT(SeverityType.MINOR, SeverityType.MAJOR),
	HARD_OF_HEARING(SeverityType.MINOR, SeverityType.MAJOR),
	HEROIC(SeverityType.MAJOR),
	ILLITERATE(SeverityType.MINOR),
	LAME(SeverityType.MAJOR).
	LOYAL(SeverityType.MINOR),
	MEAN(SeverityType.MINOR),
	OBESE(SeverityType.MINOR),
	ONE_ARM(SeverityType.MAJOR).
	ONE_EYE(SeverityType.MAJOR),
	ONE_LEG(SeverityType.MAJOR),
	OUTSIDER(SeverityType.MINOR),
	OVERCONFIDENT(SeverityType.MAJOR),
	PACIFIST(SeverityType.MINOR, SeverityType.MAJOR),
	PHOBIE(SeverityType.MINOR, SeverityType.MAJOR),
	POVERTY(SeverityType.MINOR),
	QUIRK(SeverityType.MINOR),
	SMALL(SeverityType.MAJOR),
	STUBBORN(SeverityType.MINOR),
	UGLY(SeverityType.MINOR),
	VENGEFUL(SeverityType.MINOR, SeverityType.MAJOR),
	VOW(SeverityType.MINOR, SeverityType.MAJOR),
	WANTED(SeverityType.MINOR, SeverityType.MAJOR),
	YELLOW(SeverityType.MAJOR),
	YOUNG(SeverityType.MAJOR),
	
	LAST_CALL(SeverityType.MINOR),
	MANIA(SeverityType.MINOR, SeverityType.MAJOR),
	MONOLOGUER(SeverityType.MAJOR),

	
	private String description;
	private boolean isMinor;
	private boolean isMajor;
	
	HindranceType(String description, SeverityType... severities) {
		for (SeverityType sev : severities) {
			isMinor |= (sev == SeverityType.MINOR);
			isMajor |= (sev == SeverityType.MAJOR);
		}
	}
	public String getDescription() {
		return description;
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

public enum SeverityType {
	MINOR,
	MAJOR;	
}