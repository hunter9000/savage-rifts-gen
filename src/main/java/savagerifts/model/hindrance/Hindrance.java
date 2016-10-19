package savagerifts.model.hindrance;

import savagerifts.model.sheet.Sheet;

import javax.persistence.*;

@Entity
@Table(name = "hindrance")
public class Hindrance {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;
	
	@Column(name="type", nullable = false, updatable = false)
	@Enumerated(EnumType.STRING)
	private HindranceType type;
	
	@Column(name = "description", nullable = false, updateable = false)
	private String description;
	
	@Column(name = "isMinor", nullable = false, updatable = false)
	private boolean isMinor;
	
	@Column(name = "isMajor", nullable = false, updatable = false)
	private boolean isMajor;
	
	@Transient
	public boolean isMinor() {
		return type.isMinor();
	}
	public void isMinor(boolean isMinor) {
		// nothing, readonly property
	}
	
	@Transient
	public boolean isMajor() {
		return type.isMajor();
	}
	public void isMajor(boolean isMajor) {
		// nothing, readonly property
	}
	
	@Transient
	public String getDisplayName() {
		return type.getDisplayName();
	}
	public void setDisplayName(String displayName) {
		// nothing, readonly property
	}
		
}
