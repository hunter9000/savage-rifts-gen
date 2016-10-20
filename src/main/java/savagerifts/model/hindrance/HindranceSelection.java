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
	
	@Column(name = "severityType", nullable = false)
	@Enumerated(Enumeration.STRING)
	private SeverityType severityType;
	
	
	@Override
	public boolean equals(Object o) {
		if (o instanceof HindranceSelection) {
			HindranceSelection other = (HindranceSelection)o;
			return this.hindrance.getHindranceType() == other.getHindrance().getHindranceType() 
					&& this.severityType == other.severityType;
		}
		return false;
	}
}
