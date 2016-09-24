package savagerifts.model.benefittable;

import savagerifts.model.perk.Perk;

import javax.persistence.Entity;
import javax.persistence.Table;

//@Entity
//@Table(name = "perk_range")
public class PerkRange {
	int min, max;
	Perk perk;
}