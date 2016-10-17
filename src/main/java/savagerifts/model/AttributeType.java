package savagerifts.model;

public enum AttributeType {
	STRENGTH("Strength"),
	AGILITY("Agility"),
	SMARTS("Smarts"),
	SPIRIT("Spirit"),
	VIGOR("Vigor");

	private String displayName;

	public String getDisplayName() {
		return displayName;
	}

	AttributeType(String displayName) {
		this.displayName = displayName;
	}
}