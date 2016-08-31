package savagerifts.model;

import javax.persistence.Table;
import java.util.List;

@Table
public class Race {
	List<Edge> builtInEdges;
	List<Hindrance> builtInHinderance;
	boolean hasMagic;
	boolean hasPsionics;
	
}