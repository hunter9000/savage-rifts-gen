

public class RaceAbility {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;
	
	@ManyToOne
	@JoinColumn(name = "race", nullable = false)
	private Race race;
	
	@OneToOne
	@JoinColumn(name = "includedEdge")
	private Edge includedEdge;
	
}