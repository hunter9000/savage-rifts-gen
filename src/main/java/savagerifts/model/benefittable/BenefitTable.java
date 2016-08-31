package savagerifts.model.benefittable;

import savagerifts.model.perk.PerkRange;

import javax.persistence.Table;
import java.util.List;

@Table
public class BenefitTable {
	String name;
	boolean isMagic;
	boolean isPsionic;
	List<PerkRange> perkRangesList;
}