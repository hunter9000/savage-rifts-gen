package savagerifts.model.framework;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "framework_feature")
public class FrameworkFeature {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false, updatable = false)
	private Long id;

	@JsonIgnore
	@OneToOne
	@JoinColumn(name = "framework", nullable = false, updatable = false)
	private Framework framework;
	
	@Column(name = "frameworkFeatureType", nullable = false, unique = true, updatable = false)
	@Enumerated(EnumType.STRING)
	private FrameworkFeatureType frameworkFeatureType;
	
	@Column(name = "frameworkAbilityType", nullable = false, unique = true, updatable = false)
	@Enumerated(EnumType.STRING)
	private FrameworkAbilityType frameworkAbilityType;

	@Column(name = "description", length = 1000, nullable = false, updatable = false)
	private String description;

	@OneToMany(mappedBy = "frameworkFeature")
	private List<FrameworkEdge> frameworkEdges;


	
	@Transient
	public String getDisplayName() {
		return frameworkFeatureType.getDisplayName();
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

	public Framework getFramework() {
		return framework;
	}
	public void setFramework(Framework framework) {
		this.framework = framework;
	}

	public FrameworkFeatureType getFrameworkFeatureType() {
		return frameworkFeatureType;
	}
	public void setFrameworkFeatureType(FrameworkFeatureType frameworkFeatureType) {
		this.frameworkFeatureType = frameworkFeatureType;
	}

	public FrameworkAbilityType getFrameworkAbilityType() {
		return frameworkAbilityType;
	}
	public void setFrameworkAbilityType(FrameworkAbilityType frameworkAbilityType) {
		this.frameworkAbilityType = frameworkAbilityType;
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	public List<FrameworkEdge> getFrameworkEdges() {
		return frameworkEdges;
	}
	public void setFrameworkEdges(List<FrameworkEdge> frameworkEdges) {
		this.frameworkEdges = frameworkEdges;
	}
}