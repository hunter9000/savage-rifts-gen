package savagerifts.request;

import savagerifts.model.perk.Perk;

public class PerkSwapRequest {
	
	Perk perkSelection1;
	Perk perkSelection2;
	
	Perk swapPerk;

	public Perk getPerkSelection1() {
		return perkSelection1;
	}
	public void setPerkSelection1(Perk perkSelection1) {
		this.perkSelection1 = perkSelection1;
	}

	public Perk getPerkSelection2() {
		return perkSelection2;
	}
	public void setPerkSelection2(Perk perkSelection2) {
		this.perkSelection2 = perkSelection2;
	}

	public Perk getSwapPerk() {
		return swapPerk;
	}
	public void setSwapPerk(Perk swapPerk) {
		this.swapPerk = swapPerk;
	}

	public boolean validate() {
		return perkSelection1 != null && perkSelection2 != null && swapPerk != null;
	}
}