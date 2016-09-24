package savagerifts.model.benefittable;

import java.util.List;
import javax.persistence.*;

//@Entity
//@Table(name = "benefit_table")
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


	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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