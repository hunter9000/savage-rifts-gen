package savagerifts.model.sheet;

import savagerifts.model.DieType;

import javax.persistence.*;

@Entity
@Table(name = "roll")
public class Roll {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id", unique = true, nullable = false)
    private Long id;
	
	@Column(name = "die_type", nullable = false)
	@Enumerated(EnumType.STRING)
	private DieType dieType;
	
	@Column(name = "modifier", nullable = false)
	private Integer modifier;

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public DieType getDieType() {
		return dieType;
	}
	public void setDieType(DieType dieType) {
		this.dieType = dieType;
	}

	public Integer getModifier() {
		return modifier;
	}
	public void setModifier(Integer modifier) {
		this.modifier = modifier;
	}
}