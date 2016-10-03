package savagerifts.model.hindrance;

// the hindrace that a sheet has chosen

//@Entity
//@Table(name = "hindrance")
public class Hindrance {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name = "sheet")
	private Sheet sheet;
	
	@Column(name="type", nullable = false, updatable = false)
	@Enumerated(EnumType.STRING)
	private HindranceType type;
	
	// the severity that the player chose
	@Column(name="severityType", nullable = false, updatable = false)
	@Enumerated(EnumType.STRING)
	private SeverityType severityType;
		
}
