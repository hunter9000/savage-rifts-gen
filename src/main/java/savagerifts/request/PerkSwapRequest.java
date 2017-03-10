package savagerifts.request;

public class PerkSwapRequest {

	Long perkId1;
	Long perkId2;

	Long swapPerkId;

//	Perk perkSelection1;
//	Perk perkSelection2;
//
//	Perk swapPerk;

//	public Perk getPerkSelection1() {
//		return perkSelection1;
//	}
//	public void setPerkSelection1(Perk perkSelection1) {
//		this.perkSelection1 = perkSelection1;
//	}
//
//	public Perk getPerkSelection2() {
//		return perkSelection2;
//	}
//	public void setPerkSelection2(Perk perkSelection2) {
//		this.perkSelection2 = perkSelection2;
//	}
//
//	public Perk getSwapPerk() {
//		return swapPerk;
//	}
//	public void setSwapPerk(Perk swapPerk) {
//		this.swapPerk = swapPerk;
//	}


	public Long getPerkId1() {
		return perkId1;
	}
	public void setPerkId1(Long perkId1) {
		this.perkId1 = perkId1;
	}

	public Long getPerkId2() {
		return perkId2;
	}
	public void setPerkId2(Long perkId2) {
		this.perkId2 = perkId2;
	}

	public Long getSwapPerkId() {
		return swapPerkId;
	}
	public void setSwapPerkId(Long swapPerkId) {
		this.swapPerkId = swapPerkId;
	}

	public boolean validate() {
		return perkId1 != null && perkId2 != null && swapPerkId != null;
	}
}