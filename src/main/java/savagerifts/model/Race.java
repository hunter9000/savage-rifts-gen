package savagerifts.model;

import javax.persistence.Table;
import java.util.List;

//@Table
public class Race {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;
	
	
	private List<Edge> builtInEdges;
	
	private List<Hindrance> builtInHinderance;
	
	private boolean hasMagic;
	
	private boolean hasPsionics;
	
}