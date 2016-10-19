package savagerifts.model.framework;

@Entity
@Table(name = "framework_feature")
public class FrameworkFeature {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false, updatable = false)
	private Long id;
	
	@OneToOne
	@JoinColumn(name = "framework", nullable = false, updatable = false)
	private Framework framework;
	
	@Column(name = "frameworkFeatureType", nullable = false, unique = true, updatable = false)
	@Enumerated(EnumType.STRING)
	private FrameworkFeatureType frameworkFeatureType;
	
	@Column(name = "frameworkAbilityType", nullable = false, unique = true, updatable = false)
	@Enumerated(EnumType.STRING)
	private FrameworkAbilityType frameworkAbilityType;
	
	@OneToOne
	@JoinColumn(name = "providedEdge", updatable = false)
	private Edge providedEdge;
	
//	@OneToOne
//	@JoinColumn(name = "providedGear", updatable = false)
//	private Gear providedGear;
	
	@Transient
	public String getDisplayName() {
		return frameworkFeatureType.getDisplayName();
	}
	public void setDisplayName(String displayName) {
		// nothing, readonly property
	}
	
}