package savagerifts.model.perk;

import savagerifts.model.benefittable.BenefitTableRoll;

import javax.persistence.Table;

//@Table
// how to handle swapped? 
public class PerkSelection {
	Perk perk;			// the perk selected
	BenefitTableRoll roll;		// the tableroll this perk was selected for
}