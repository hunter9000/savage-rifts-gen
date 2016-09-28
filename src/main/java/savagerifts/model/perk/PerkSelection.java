package savagerifts.model.perk;


import com.fasterxml.jackson.annotation.JsonIgnore;
import savagerifts.model.benefittable.BenefitTableRoll;
import savagerifts.model.sheet.Sheet;

import javax.persistence.*;

@Entity
@Table(name = "perk_selection")
public class PerkSelection {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;
	
	@JsonIgnore
	@OneToOne
	@JoinColumn(name = "sheet")
	private Sheet sheet;
	
	@OneToOne
	@JoinColumn(name = "perk")
	private Perk perk;			// the perk selected
	
	@OneToOne
	@JoinColumn(name = "roll")
	private BenefitTableRoll roll;		// the tableroll this perk was selected for
	
	// two other perks were traded in for this one, don't show this one as an option for further swapping
	@Column(name = "wasSwappedFor")
	private boolean wasSwappedFor = false;


	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public Sheet getSheet() {
		return sheet;
	}
	public void setSheet(Sheet sheet) {
		this.sheet = sheet;
	}

	public Perk getPerk() {
		return perk;
	}
	public void setPerk(Perk perk) {
		this.perk = perk;
	}

	public BenefitTableRoll getRoll() {
		return roll;
	}
	public void setRoll(BenefitTableRoll roll) {
		this.roll = roll;
	}

	public boolean isWasSwappedFor() {
		return wasSwappedFor;
	}
	public void setWasSwappedFor(boolean wasSwappedFor) {
		this.wasSwappedFor = wasSwappedFor;
	}
}