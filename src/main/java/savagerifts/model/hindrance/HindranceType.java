package savagerifts.model.hindrance;

public enum HindranceType {
	ALL_THUMBS("All Thumbs"),
	ANEMIC("Anemic"),
	ARROGANT("Arrogant"),
	BAD_EYES("Bad Eyes"),
	BAD_LUCK("Bad Luck"),
	BIG_MOUTH("Big Mouth"),
	BLIND("Blind"),
	BLOODTHIRSTY("Bloodthirsty"),
	CAUTIOUS("Cautious"),
	CLUELESS("Clueless"),
	CODE_OF_HONOR("Code of Honor"),
	CURIOUS("Curious"),
	DEATH_WISH("Death Wish"),
	DELUSIONAL("Delusional"),
	DOUBTING_THOMAS("Doubting Thomas"),
	ELDERLY("Elderly"),
	ENEMY("Enemy"),
	GREEDY("Greedy"),
	HABIT("Habit"),
	HARD_OF_HEARING("Hard of Hearing"),
	HEROIC("Heroic"),
	ILLITERATE("Illiterate"),
	LAME("Lame"),
	LAST_CALL("Last Call"),
	LOYAL("Loyal"),
	MANIA("Mania"),
	MEAN("Mean"),
	MONOLOGUER("Monologuer"),
	OBESE("Obese"),
	ONE_ARM("One Arm"),
	ONE_EYE("One Eye"),
	ONE_LEG("One Leg"),
	OUTSIDER("Outsider"),
	OVERCONFIDENT("Overconfident"),
	PACIFIST("Pacifist"),
	PHOBIA("Phobia"),
	POVERTY("Poverty"),
	QUIRK("Quirk"),
	SMALL("Small"),
	STUBBORN("Stubborn"),
	UGLY("Ugly"),
	VENGEFUL("Vengeful"),
	VOW("Vow"),
	WANTED("Wanted"),
	YELLOW("Yellow"),
	YOUNG("Young");
	
	private String displayName;
	
	HindranceType(String displayName) {
		this.displayName = displayName;
	}
	public String getDisplayName() {
		return displayName;
	}
}

