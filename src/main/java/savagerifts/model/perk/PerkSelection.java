package savagerifts.model.perk;

import savagerifts.model.benefittable.BenefitTableRoll;

import javax.persistence.Table;

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
	Perk perk;			// the perk selected
	
	@OneToOne
	@JoinColumn(name = "roll")
	BenefitTableRoll roll;		// the tableroll this perk was selected for
	
	// two other perks were traded in for this one, don't show this one as an option for further swapping
	@Column(name = "wasSwappedFor")
	private boolean wasSwappedFor;
}