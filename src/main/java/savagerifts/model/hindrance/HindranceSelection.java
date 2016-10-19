package savagerifts.model.hindrance;

import savagerifts.model.sheet.Sheet;

import javax.persistence.*;

@Entity
@Table(name = "hindrance_selection")
public class HindranceSelection {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;
	
	@JsonIgnore
	@OneToOne
	@JoinColumn(name = "sheet")
	private Sheet sheet;
	
	@OneToOne
	@JoinColumn(name = "hindrance")
	private Hindrance hindrance;
			
}
