package savagerifts.model.benefittable;

import com.fasterxml.jackson.annotation.JsonIgnore;
import savagerifts.model.perk.Perk;

import javax.persistence.*;

@Entity
@Table(name = "perk_range")
public class PerkRange {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;

	@Column(name = "min", nullable = false, updatable = false)
	private Integer min;

	@Column(name = "max", nullable = false, updatable = false)
	private Integer max;

	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "benefitTable", nullable = false, updatable = false)
	private BenefitTable benefitTable;

	@OneToOne
	@JoinColumn(name = "perk", nullable = false, updatable = false)
	private Perk perk;

	// flag this perk range as having already been taken by the user, so that the ui will know to show it as unchoosable
	@Transient
	private boolean perkHasBeenChosen = false;

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public Integer getMin() {
		return min;
	}
	public void setMin(Integer min) {
		this.min = min;
	}

	public Integer getMax() {
		return max;
	}
	public void setMax(Integer max) {
		this.max = max;
	}

	public BenefitTable getBenefitTable() {
		return benefitTable;
	}
	public void setBenefitTable(BenefitTable benefitTable) {
		this.benefitTable = benefitTable;
	}

	public Perk getPerk() {
		return perk;
	}
	public void setPerk(Perk perk) {
		this.perk = perk;
	}
	
	public boolean getPerkHasBeenChosen() {
		return perkHasBeenChosen;
	}
	public void setPerkHasBeenChosen(boolean perkHasBeenChosen) {
		this.perkHasBeenChosen = perkHasBeenChosen;
	}
}