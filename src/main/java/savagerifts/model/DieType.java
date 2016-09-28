package savagerifts.model;

public enum DieType {
	
	private int pips;
	private DieType(int pips) {
		this.pips = pips;
	}
	public int getPips() {
		return pips;
	}
	
	D0(0), 
	D4(4), 
	D6(6), 
	D8(8), 
	D10(10), 
	D12(12);
}