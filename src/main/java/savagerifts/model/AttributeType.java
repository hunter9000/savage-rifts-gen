package savagerifts.model;

import com.fasterxml.jackson.annotation.JsonFormat;

@JsonFormat(shape = JsonFormat.Shape.OBJECT)
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