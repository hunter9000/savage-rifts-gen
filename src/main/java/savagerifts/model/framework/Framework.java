package savagerifts.model.framework;

import savagerifts.model.DieType;
import savagerifts.model.benefittable.BenefitTableRoll;
import savagerifts.model.sheet.Roll;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "framework")
public class Framework {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false, updatable = false)
	private Long id;

	@Column(name = "type", nullable = false, unique = true, updatable = false)
	@Enumerated(EnumType.STRING)
	private FrameworkType type;

	@OneToMany(mappedBy = "framework", cascade = CascadeType.ALL)
	private List<BenefitTableRoll> tableRolls;


//	private List<Edge> builtInEdges;
//	private List<Hindrance> builtInHinderance;
//	private PowerList powerList;
//	private List<Gear> startingGear;

	@Column(name = "startingAttributePoints", updatable = false)
	private Integer startingAttributePoints;

	@Column(name = "canSelectRace", nullable = false, updatable = false)
	private boolean canSelectRace = true;

/*	@Column(name="startingStrengthDieType")
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

	
	// starting attribute bonuses
	@Column(name="startingStrengthBonus")
	private Integer startingStrengthBonus;
	@Column(name="startingAgilityBonus")
	private Integer startingAgilityBonus;
	@Column(name="startingSmartsBonus")
	private Integer startingSmartsBonus;
	@Column(name="startingSpiritBonus")
	private Integer startingSpiritBonus;
	@Column(name="startingVigorBonus")
	private Integer startingVigorBonus;
*/

	@OneToOne
	@JoinColumn(name = "startingStrength", updatable = false)
	private Roll startingStrength;
	@OneToOne
	@JoinColumn(name = "startingAgility", updatable = false)
	private Roll startingAgility;
	@OneToOne
	@JoinColumn(name = "startingSmarts", updatable = false)
	private Roll startingSmarts;
	@OneToOne
	@JoinColumn(name = "startingSpirit", updatable = false)
	private Roll startingSpirit;
	@OneToOne
	@JoinColumn(name = "startingVigor", updatable = false)
	private Roll startingVigor;

/*	@Column(name="maxStrengthDieType")
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

	// maximum attribute bonuses
	@Column(name="maxStrengthBonus")
	private Integer maxStrengthBonus;
	@Column(name="maxAgilityBonus")
	private Integer maxAgilityBonus;
	@Column(name="maxSmartsBonus")
	private Integer maxSmartsBonus;
	@Column(name="maxSpiritBonus")
	private Integer maxSpiritBonus;
	@Column(name="maxVigorBonus")
	private Integer maxVigorBonus;
*/	

	/** These are the maximums when buying attributes during that phase, not necessarily the limit when purchasing edges, etc. */
	@OneToOne
	@JoinColumn(name = "maxStrength", updatable = false)
	private Roll maxStrength;
	@OneToOne
	@JoinColumn(name = "maxAgility", updatable = false)
	private Roll maxAgility;
	@OneToOne
	@JoinColumn(name = "maxSmarts", updatable = false)
	private Roll maxSmarts;
	@OneToOne
	@JoinColumn(name = "maxSpirit", updatable = false)
	private Roll maxSpirit;
	@OneToOne
	@JoinColumn(name = "maxVigor", updatable = false)
	private Roll maxVigor;
	
	/** If the attributes have a natural limit when purchasing edges, etc. Doesn't apply during attribute buy step, that's limited by the max attrs. */
	private boolean hasStrengthLimit;
	private boolean hasAgilityLimit;
	private boolean hasSmartsLimit;
	private boolean hasSpiritLimit;
	private boolean hasVigorLimit;
	
	
	@Transient
	public String getDisplayName() {
		return type.getDisplayName();
	}
	public void setDisplayName() {
		// nothing, read only property
	}

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

	public List<BenefitTableRoll> getTableRolls() {
		return tableRolls;
	}
	public void setTableRolls(List<BenefitTableRoll> tableRolls) {
		this.tableRolls = tableRolls;
	}

	public Integer getStartingAttributePoints() {
		return startingAttributePoints;
	}
	public void setStartingAttributePoints(Integer startingAttributePoints) {
		this.startingAttributePoints = startingAttributePoints;
	}

	public boolean isCanSelectRace() {
		return canSelectRace;
	}
	public void setCanSelectRace(boolean canSelectRace) {
		this.canSelectRace = canSelectRace;
	}

	public Roll getStartingStrength() {
		return startingStrength;
	}
	public void setStartingStrength(Roll startingStrength) {
		this.startingStrength = startingStrength;
	}

	public Roll getStartingAgility() {
		return startingAgility;
	}
	public void setStartingAgility(Roll startingAgility) {
		this.startingAgility = startingAgility;
	}

	public Roll getStartingSmarts() {
		return startingSmarts;
	}
	public void setStartingSmarts(Roll startingSmarts) {
		this.startingSmarts = startingSmarts;
	}

	public Roll getStartingSpirit() {
		return startingSpirit;
	}
	public void setStartingSpirit(Roll startingSpirit) {
		this.startingSpirit = startingSpirit;
	}

	public Roll getStartingVigor() {
		return startingVigor;
	}
	public void setStartingVigor(Roll startingVigor) {
		this.startingVigor = startingVigor;
	}

	public Roll getMaxStrength() {
		return maxStrength;
	}
	public void setMaxStrength(Roll maxStrength) {
		this.maxStrength = maxStrength;
	}

	public Roll getMaxAgility() {
		return maxAgility;
	}
	public void setMaxAgility(Roll maxAgility) {
		this.maxAgility = maxAgility;
	}

	public Roll getMaxSmarts() {
		return maxSmarts;
	}
	public void setMaxSmarts(Roll maxSmarts) {
		this.maxSmarts = maxSmarts;
	}

	public Roll getMaxSpirit() {
		return maxSpirit;
	}
	public void setMaxSpirit(Roll maxSpirit) {
		this.maxSpirit = maxSpirit;
	}

	public Roll getMaxVigor() {
		return maxVigor;
	}
	public void setMaxVigor(Roll maxVigor) {
		this.maxVigor = maxVigor;
	}

	public boolean isHasStrengthLimit() {
		return hasStrengthLimit;
	}
	public void setHasStrengthLimit(boolean hasStrengthLimit) {
		this.hasStrengthLimit = hasStrengthLimit;
	}

	public boolean isHasAgilityLimit() {
		return hasAgilityLimit;
	}
	public void setHasAgilityLimit(boolean hasAgilityLimit) {
		this.hasAgilityLimit = hasAgilityLimit;
	}

	public boolean isHasSmartsLimit() {
		return hasSmartsLimit;
	}
	public void setHasSmartsLimit(boolean hasSmartsLimit) {
		this.hasSmartsLimit = hasSmartsLimit;
	}

	public boolean isHasSpiritLimit() {
		return hasSpiritLimit;
	}
	public void setHasSpiritLimit(boolean hasSpiritLimit) {
		this.hasSpiritLimit = hasSpiritLimit;
	}

	public boolean isHasVigorLimit() {
		return hasVigorLimit;
	}
	public void setHasVigorLimit(boolean hasVigorLimit) {
		this.hasVigorLimit = hasVigorLimit;
	}

	//	public DieType getStartingStrengthDieType() {
//		return startingStrengthDieType;
//	}
//	public void setStartingStrengthDieType(DieType startingStrengthDieType) {
//		this.startingStrengthDieType = startingStrengthDieType;
//	}
//
//	public DieType getStartingAgilityDieType() {
//		return startingAgilityDieType;
//	}
//	public void setStartingAgilityDieType(DieType startingAgilityDieType) {
//		this.startingAgilityDieType = startingAgilityDieType;
//	}
//
//	public DieType getStartingSmartsDieType() {
//		return startingSmartsDieType;
//	}
//	public void setStartingSmartsDieType(DieType startingSmartsDieType) {
//		this.startingSmartsDieType = startingSmartsDieType;
//	}
//
//	public DieType getStartingSpiritDieType() {
//		return startingSpiritDieType;
//	}
//	public void setStartingSpiritDieType(DieType startingSpiritDieType) {
//		this.startingSpiritDieType = startingSpiritDieType;
//	}
//
//	public DieType getStartingVigorDieType() {
//		return startingVigorDieType;
//	}
//	public void setStartingVigorDieType(DieType startingVigorDieType) {
//		this.startingVigorDieType = startingVigorDieType;
//	}
//
//	public DieType getMaxStrengthDieType() {
//		return maxStrengthDieType;
//	}
//	public void setMaxStrengthDieType(DieType maxStrengthDieType) {
//		this.maxStrengthDieType = maxStrengthDieType;
//	}
//
//	public DieType getMaxAgilityDieType() {
//		return maxAgilityDieType;
//	}
//	public void setMaxAgilityDieType(DieType maxAgilityDieType) {
//		this.maxAgilityDieType = maxAgilityDieType;
//	}
//
//	public DieType getMaxSmartsDieType() {
//		return maxSmartsDieType;
//	}
//	public void setMaxSmartsDieType(DieType maxSmartsDieType) {
//		this.maxSmartsDieType = maxSmartsDieType;
//	}
//
//	public DieType getMaxSpiritDieType() {
//		return maxSpiritDieType;
//	}
//	public void setMaxSpiritDieType(DieType maxSpiritDieType) {
//		this.maxSpiritDieType = maxSpiritDieType;
//	}
//
//	public DieType getMaxVigorDieType() {
//		return maxVigorDieType;
//	}
//	public void setMaxVigorDieType(DieType maxVigorDieType) {
//		this.maxVigorDieType = maxVigorDieType;
//	}

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
//	Crazy, 			rolls: [BenefitTableRoll(rollId: 1, allowed: {Body Armor, Close Combat Weapons, Psionics, Ranged Weapons, Training, Underworld & Black Ops})
//		 					BenefitTableRoll(rollId: 1, allowed: {Body Armor, Close Combat Weapons, Psionics, Ranged Weapons, Training, Underworld & Black Ops})
//		 					BenefitTableRoll(rollId: 1, allowed: {Body Armor, Close Combat Weapons, Psionics, Ranged Weapons, Training, Underworld & Black Ops})
//							BenefitTableRoll(rollId: 1, restrictedTables: {MAGIC_MYSTICISM})
//							BenefitTableRoll(rollId: 1, restrictedTables: {MAGIC_MYSTICISM})  ]
//					bonuses:
//					startingAttributePoints = null
//					startingStr = new Roll(DieType.D8, 0)
//					startingAgi = new Roll(DieType.D8, 0)
//					startingVgr = new Roll(DieType.D8, 0)
//					maxStr, maxAgi, maxVgr all have no max
//					double base Pace



//	Cyber-Knight,   no stat starting bonus or max

//	Glitter Boy,    no stat starting bonus or max

//	Juicer,         startingVgr = d8, no max
//					startingAgi = d8, no max
//					startingStr = d8, no max
//					double base Pace

//	MARS,
//	Burster,
//	Mind Melter,
//	Ley Line Walker,
//	Mystic,
//	Techno-Wizard,
//	Flame Wind Dragon Hatchling,
	
}