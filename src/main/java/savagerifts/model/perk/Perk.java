package savagerifts.model.perk;

import savagerifts.model.Gear;
import savagerifts.model.benefittable.BenefitTableType;

import javax.persistence.*;

@Entity
@Table(name = "perk")
public class Perk {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;

	@Column(name = "description", nullable = false, length = 1000)
	private String description;

	@Column(name = "type", nullable = false, updatable = false)
	@Enumerated(EnumType.STRING)
	private PerkType type;


//	private Gear providedGear;


	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	public PerkType getType() {
		return type;
	}
	public void setType(PerkType type) {
		this.type = type;
	}
	
	public boolean equals() {
		
	}
}