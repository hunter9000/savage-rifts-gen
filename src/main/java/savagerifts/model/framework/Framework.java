package savagerifts.model.framework;

import savagerifts.model.DieType;
import savagerifts.model.Edge;
import savagerifts.model.Gear;
import savagerifts.model.Hindrance;
import savagerifts.model.benefittable.BenefitTableRoll;
import savagerifts.model.power.PowerList;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "framework")
public class Framework {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;

	@Column(name = "type", nullable = false, unique = true, updatable = false)
	@Enumerated(EnumType.STRING)
	private FrameworkType type;


//	private List<BenefitTableRoll> tableRolls;
//	private List<Edge> builtInEdges;
//	private List<Hindrance> builtInHinderance;
//	private PowerList powerList;
//	private List<Gear> startingGear;

	@Column(name = "startingAttributePoints")
	private int startingAttributePoints;



	@Column(name="startingStrengthDieType")
	@Enumerated(EnumType.STRING)
	private DieType startingStrengthDieType;

	@Column(name="startingAgilityDieType")
	@Enumerated(EnumType.STRING)
	private DieType startingAgilityDieType;

	@Column(name="startingSmartsDieType")
	@Enumerated(EnumType.STRING)
	private DieType startingSmartsDieType;

	@Column(name="startingSpiritDieType")
	@Enumerated(EnumType.STRING)
	private DieType startingSpiritDieType;

	@Column(name="startingVigorDieType")
	@Enumerated(EnumType.STRING)
	private DieType startingVigorDieType;



	@Column(name="maxStrengthDieType")
	@Enumerated(EnumType.STRING)
	private DieType maxStrengthDieType;

	@Column(name="maxAgilityDieType")
	@Enumerated(EnumType.STRING)
	private DieType maxAgilityDieType;

	@Column(name="maxSmartsDieType")
	@Enumerated(EnumType.STRING)
	private DieType maxSmartsDieType;

	@Column(name="maxSpiritDieType")
	@Enumerated(EnumType.STRING)
	private DieType maxSpiritDieType;

	@Column(name="maxVigorDieType")
	@Enumerated(EnumType.STRING)
	private DieType maxVigorDieType;

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public FrameworkType getType() {
		return type;
	}
	public void setType(FrameworkType type) {
		this.type = type;
	}

	public int getStartingAttributePoints() {
		return startingAttributePoints;
	}
	public void setStartingAttributePoints(int startingAttributePoints) {
		this.startingAttributePoints = startingAttributePoints;
	}

	public DieType getStartingStrengthDieType() {
		return startingStrengthDieType;
	}
	public void setStartingStrengthDieType(DieType startingStrengthDieType) {
		this.startingStrengthDieType = startingStrengthDieType;
	}

	public DieType getStartingAgilityDieType() {
		return startingAgilityDieType;
	}
	public void setStartingAgilityDieType(DieType startingAgilityDieType) {
		this.startingAgilityDieType = startingAgilityDieType;
	}

	public DieType getStartingSmartsDieType() {
		return startingSmartsDieType;
	}
	public void setStartingSmartsDieType(DieType startingSmartsDieType) {
		this.startingSmartsDieType = startingSmartsDieType;
	}

	public DieType getStartingSpiritDieType() {
		return startingSpiritDieType;
	}
	public void setStartingSpiritDieType(DieType startingSpiritDieType) {
		this.startingSpiritDieType = startingSpiritDieType;
	}

	public DieType getStartingVigorDieType() {
		return startingVigorDieType;
	}
	public void setStartingVigorDieType(DieType startingVigorDieType) {
		this.startingVigorDieType = startingVigorDieType;
	}

	public DieType getMaxStrengthDieType() {
		return maxStrengthDieType;
	}
	public void setMaxStrengthDieType(DieType maxStrengthDieType) {
		this.maxStrengthDieType = maxStrengthDieType;
	}

	public DieType getMaxAgilityDieType() {
		return maxAgilityDieType;
	}
	public void setMaxAgilityDieType(DieType maxAgilityDieType) {
		this.maxAgilityDieType = maxAgilityDieType;
	}

	public DieType getMaxSmartsDieType() {
		return maxSmartsDieType;
	}
	public void setMaxSmartsDieType(DieType maxSmartsDieType) {
		this.maxSmartsDieType = maxSmartsDieType;
	}

	public DieType getMaxSpiritDieType() {
		return maxSpiritDieType;
	}
	public void setMaxSpiritDieType(DieType maxSpiritDieType) {
		this.maxSpiritDieType = maxSpiritDieType;
	}

	public DieType getMaxVigorDieType() {
		return maxVigorDieType;
	}
	public void setMaxVigorDieType(DieType maxVigorDieType) {
		this.maxVigorDieType = maxVigorDieType;
	}

	//	Combat Cyborg, rolls: [BenefitTableRoll(rollId: 1, allowed: {Cybernetics, Close Combat Weapons, Ranged Weapons, Training})
//						   BenefitTableRoll(rollId: 2, allowed: {Cybernetics, Close Combat Weapons, Ranged Weapons, Training})
//						   BenefitTableRoll(rollId: 3, disallowed: {Body Armor}, notMagic: true, notPsionics: true) ]
//				   bonuses: //Bionic Augmentation,
//							Cybernetic Enhancements,
//							//High-Performance Legs,
//							Fleet-Footed,
//							M.D.C. Armor,
//							More Machine,
//							Size +1,
//							Upgradable
//							Unarmed Combat,
//				   startingAttributePoints = 2
//				   maxStr = DieType.D4
//				   maxAgi = DieType.D4
//				   startingStr = new Roll(DieType.D12, 2)
//				   startingAgi = new Roll(DieType.D10, 0)
//				   startingVgr = new Roll(DieType.D12, 0)
//
//	Crazy,
//	Cyber-Knight,
//	Glitter Boy,
//	Juicer,
//	MARS,
//	Burster,
//	Mind Melter,
//	Ley Line Walker,
//	Mystic,
//	Techno-Wizard,
//	Flame Wind Dragon Hatchling,
	
}