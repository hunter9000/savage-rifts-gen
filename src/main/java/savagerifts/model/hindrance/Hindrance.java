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
	
	@Column(name = "description", length = 1500, nullable = false, updatable = false)
	private String description;
	
	@Column(name = "isMinor", nullable = false, updatable = false)
	private boolean isMinor;
	
	@Column(name = "isMajor", nullable = false, updatable = false)
	private boolean isMajor;

	@Transient
	public String getDisplayName() {
		return type.getDisplayName();
	}
	public void setDisplayName(String displayName) {
		// nothing, readonly property
	}

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public HindranceType getType() {
		return type;
	}
	public void setType(HindranceType type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isMinor() {
		return isMinor;
	}
	public void setMinor(boolean minor) {
		isMinor = minor;
	}

	public boolean isMajor() {
		return isMajor;
	}
	public void setMajor(boolean major) {
		isMajor = major;
	}
}
