package savagerifts.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum DieType {
	D0(0, ""),
	D4(4, "d4"),
	D6(6, "d6"),
	D8(8, "d8"),
	D10(10, "d10"),
	D12(12, "d12"),
	D20(20, "d20");

	private int pips;
	private String displayName;

	public int getPips() {
		return pips;
	}
	public String getDisplayName() {
		return displayName;
	}

	@JsonIgnore
	public DieType getIncreasedType() {
		if (this != D20) {
			return DieType.values()[this.ordinal()+1];
		}
		return this;
	}
	@JsonIgnore
	public DieType getDecreasedType() {
		if (this != D0) {
			return DieType.values()[this.ordinal()-1];
		}
		return this;
	}

	@JsonIgnore
	public boolean isLessThanOrEqualTo(DieType other) {
		return this.ordinal() <= other.ordinal();
	}
	
	DieType(int pips, String displayName) {
		this.pips = pips;
		this.displayName = displayName;
	}

}