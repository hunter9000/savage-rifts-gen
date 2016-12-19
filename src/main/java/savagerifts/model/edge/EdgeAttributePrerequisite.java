package savagerifts.model.edge;

import savagerifts.model.AttributeType;
import savagerifts.model.DieType;

import javax.persistence.*;

@Entity
@Table(name = "edge_attribute_prerequisite")
public class EdgeAttributePrerequisite {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	private Long id;
	
	@JoinColumn(name = "edge", nullable = false, updatable = false)
	private Edge edge;
	
	@Column(name = "attributeType", nullable = false, updatable = false)
	@Enumerated(EnumType.STRING)
	private AttributeType attributeType;
	
	@Column(name = "dieType", nullable = false, updatable = false)
	@Enumerated(EnumType.STRING)
	private DieType dieType;

	
	
}