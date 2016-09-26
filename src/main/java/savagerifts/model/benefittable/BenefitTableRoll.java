package savagerifts.model.benefittable;

import com.fasterxml.jackson.annotation.JsonIgnore;
import savagerifts.model.framework.Framework;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "benefit_table_roll")
public class BenefitTableRoll {


	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;

	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "framework", nullable = false, updatable = false)
	private Framework framework;

	@Column(name = "roll_number", nullable = false)
	private Integer rollNumber;

	@ManyToMany()
	@JoinTable(name = "benefit_table_roll_allowance",
			joinColumns = {@JoinColumn(name = "benefitTableRollId", nullable = false, updatable = false) },		// column that points to this table
			inverseJoinColumns = { @JoinColumn(name = "benefitTableId", nullable = false, updatable = false) })		// column that points to the benefittable table
	private List<BenefitTable> allowedTables;

//	@ManyToMany()
//	@JoinTable(name = "benefit_table_roll_allowance",
//			joinColumns = {@JoinColumn(name = "benefitTableRollId", nullable = false, updatable = false) },		// column that points to this table
//			inverseJoinColumns = { @JoinColumn(name = "benefitTableId", nullable = false, updatable = false) })		// column that points to the benefittable table
//	private List<BenefitTable> restrictedTables;

//	@Column(name = "allowMagic", nullable = false, updatable = false)
//	private boolean allowMagic;
//
//	@Column(name = "allowPsionics", nullable = false, updatable = false)
//	private boolean allowPsionics;



	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public Framework getFramework() {
		return framework;
	}
	public void setFramework(Framework framework) {
		this.framework = framework;
	}

	public Integer getRollNumber() {
		return rollNumber;
	}
	public void setRollNumber(Integer rollNumber) {
		this.rollNumber = rollNumber;
	}

	public List<BenefitTable> getAllowedTables() {
		return allowedTables;
	}
	public void setAllowedTables(List<BenefitTable> allowedTables) {
		this.allowedTables = allowedTables;
	}

//	public List<BenefitTable> getRestrictedTables() {
//		return restrictedTables;
//	}
//	public void setRestrictedTables(List<BenefitTable> restrictedTables) {
//		this.restrictedTables = restrictedTables;
//	}
//
//	public boolean isAllowMagic() {
//		return allowMagic;
//	}
//	public void setAllowMagic(boolean allowMagic) {
//		this.allowMagic = allowMagic;
//	}
//
//	public boolean isAllowPsionics() {
//		return allowPsionics;
//	}
//	public void setAllowPsionics(boolean allowPsionics) {
//		this.allowPsionics = allowPsionics;
//	}
}