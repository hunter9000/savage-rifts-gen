package savagerifts.model.sheet;

import savagerifts.model.DieType;

import javax.persistence.*;

@Entity
@Table(name = "roll")
public class Roll implements Comparable {
	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id", unique = true, nullable = false)
    private Long id;
	
	@Column(name = "die_type", nullable = false)
	@Enumerated(EnumType.STRING)
	private DieType dieType = DieType.D4;
	
	@Column(name = "modifier", nullable = false)
	private Integer modifier = 0;

	public Roll() { }
	public Roll(DieType dieType, Integer modifier) {
		this.dieType = dieType;
		this.modifier = modifier;
	}

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

	public void copy(Roll other) {
		if (other != null) {
			this.dieType = other.dieType;
			this.modifier = other.modifier;
		}
	}

	public void increase() {
		if (dieType == DieType.D12) {
			modifier = modifier + 1;
		}
		else {
			dieType = dieType.getIncreasedType();
		}
	}

	public void decrease() {
		if (dieType == DieType.D12) {
			if (modifier > 0) {
				modifier = modifier - 1;
			}
			else {
				dieType = dieType.getDecreasedType();
			}
		}
		else {
			dieType = dieType.getDecreasedType();
		}
	}

	@Override
	public String toString() {
		String s = dieType.getDisplayName();
		if (modifier > 0) {
			s += "+" + modifier;
		}
		return s;
	}

	@Override
	public int compareTo(Object other) {
		if (other == null) {
			return -1;
		}
		Roll rollB = (Roll)other;
		int dieTypeComparison = this.dieType.compareTo(rollB.dieType);
		if (dieTypeComparison == 0) {
			return modifier.compareTo(rollB.modifier);
		}
		return dieTypeComparison;
	}
}