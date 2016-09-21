package savagerifts.model.benefittable;

import savagerifts.model.perk.PerkRange;

import java.util.List;
import javax.persistence.*;

//@Table
public class BenefitTable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "isMagic")
	private boolean isMagic;
	
	@Column(name = "isPsionic")
	private boolean isPsionic;
	
	
	private List<PerkRange> perkRangesList;
}