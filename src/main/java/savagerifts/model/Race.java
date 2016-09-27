package savagerifts.model;

import java.util.List;
import javax.persistence.*;

@Entity
@Table(name = "race")
public class Race {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;
	
	@OneToMany(mappedBy = "race")
	private List<RaceAbility> abilities;
	
	private List<RaceAbility> complications;
	
	@Column(name = "hasMagic", nullable = false)
	private boolean hasMagic;
	
	@Column(name = "hasPsionics", nullable = false)
	private boolean hasPsionics;
	
	
	
	//private List<Edge> builtInEdges;
	//private List<Hindrance> builtInHinderance;
	
}