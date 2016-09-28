package savagerifts.model.benefittable;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.List;
import javax.persistence.*;

@Entity
@Table(name = "benefit_table")
public class BenefitTable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;
	
	@Column(name = "type")
	@Enumerated(EnumType.STRING)
	private BenefitTableType type;
	
	@Column(name = "isMagic")
	private boolean isMagic;
	
	@Column(name = "isPsionic")
	private boolean isPsionic;

	@OneToMany(mappedBy = "benefitTable", cascade=CascadeType.ALL)
	private List<PerkRange> perkRangesList;


	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public BenefitTableType getType() {
		return type;
	}
	public void setType(BenefitTableType type) {
		this.type = type;
	}
	@Transient
	public String getDisplayName() {
		return type.getDisplayName();
	}
	public void setDisplayName() {
		// do nothing, this is a read only property
	}

	public boolean isMagic() {
		return isMagic;
	}
	public void setMagic(boolean magic) {
		isMagic = magic;
	}

	public boolean isPsionic() {
		return isPsionic;
	}
	public void setPsionic(boolean psionic) {
		isPsionic = psionic;
	}

	public List<PerkRange> getPerkRangesList() {
		return perkRangesList;
	}
	public void setPerkRangesList(List<PerkRange> perkRangesList) {
		this.perkRangesList = perkRangesList;
	}
}