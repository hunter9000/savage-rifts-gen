package savagerifts.model.benefittable;

import com.fasterxml.jackson.annotation.JsonFormat;

@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum BenefitTableType {
	BODY_ARMOR("Body Armor"),
	CLOSE_COMBAT_WEAPONS("Close Combat Weapons"),
	CYBERNETICS("Cybernetics"),
	EDUCATION("Education"),
	ENCHANTED_ITEMS_MYSTIC_GADGETS("Enchanted Items & Mystic Gadgets"),
	EXPERIENCE_WISDOM("Experience & Wisdom"),
	MAGIC_MYSTICISM("Magic & Mysticism"),
	PSIONICS("Psionics"),
	RANGED_WEAPONS("Ranged Weapons"),
	TRAINING("Training"),
	UNDERWORLD_BLACK_OPS("Underworld & Black Ops");
	
	private String displayName;
	BenefitTableType(String displayName) {
		this.displayName = displayName;
	}
	public String getDisplayName() {
		return displayName;
	}
}