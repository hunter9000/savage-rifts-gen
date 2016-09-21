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
	DieType dieType;
	
	@Column(name = "modifier", nullable = false)
	Integer modifier;
}