package savagerifts.model.edge;

import com.fasterxml.jackson.annotation.JsonFormat;

@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum EdgeCategoryType {
	BACKGROUND("Background"),
	COMBAT("Combat"),
	LEADERSHIP("Leadership"),
	POWER("Power"),
	PROFESSIONAL("Professional"),
	SOCIAL("Social"),
	WEIRD("Weird"),
	WILD_CARD("Wild Card"),
	LEGENDARY("Legendary"),
	ICONIC("Iconic"),;

	private String displayName;

	public String getDisplayName() {
		return displayName;
	}

	EdgeCategoryType(String displayName) {
		this.displayName = displayName;
	}
}