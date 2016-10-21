package savagerifts.model.hindrance;

import com.fasterxml.jackson.annotation.JsonIgnore;
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

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public Sheet getSheet() {
		return sheet;
	}
	public void setSheet(Sheet sheet) {
		this.sheet = sheet;
	}

	public Hindrance getHindrance() {
		return hindrance;
	}
	public void setHindrance(Hindrance hindrance) {
		this.hindrance = hindrance;
	}
}
