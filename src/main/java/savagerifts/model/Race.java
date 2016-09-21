package savagerifts.model;

import java.util.List;
import javax.persistence.*;

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