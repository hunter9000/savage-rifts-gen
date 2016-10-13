package savagerifts.model;

public enum DieType {
	D0(0), 
	D4(4), 
	D6(6), 
	D8(8), 
	D10(10), 
	D12(12),
	D20(20);

	private int pips;

	public int getPips() {
		return pips;
	}

	public DieType getIncreasedType() {
		if (this != D20) {
			return DieType.values()[this.ordinal()+1];
		}
		return this;
	}

	public DieType getDecreasedType() {
		if (this != D0) {
			return DieType.values()[this.ordinal()-1];
		}
		return this;
	}

	DieType(int pips) {
		this.pips = pips;
	}

}