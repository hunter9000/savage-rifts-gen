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
	@Column(name = "hasStrengthLimit", nullable = false, updatable = false)
	private boolean hasStrengthLimit;
	@Column(name = "hasAgilityLimit", nullable = false, updatable = false)
	private boolean hasAgilityLimit;
	@Column(name = "hasSmartsLimit", nullable = false, updatable = false)
	private boolean hasSmartsLimit;
	@Column(name = "hasSpiritLimit", nullable = false, updatable = false)
	private boolean hasSpiritLimit;
	@Column(name = "hasVigorLimit", nullable = false, updatable = false)
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


}