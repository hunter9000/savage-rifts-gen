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

	@OneToOne
	@JoinColumn(name = "edge", nullable = false, updatable = false)
	private Edge edge;
	
	@Column(name = "attributeType", nullable = false, updatable = false)
	@Enumerated(EnumType.STRING)
	private AttributeType attributeType;
	
	@Column(name = "dieType", nullable = false, updatable = false)
	@Enumerated(EnumType.STRING)
	private DieType dieType;

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public Edge getEdge() {
		return edge;
	}
	public void setEdge(Edge edge) {
		this.edge = edge;
	}

	public AttributeType getAttributeType() {
		return attributeType;
	}
	public void setAttributeType(AttributeType attributeType) {
		this.attributeType = attributeType;
	}

	public DieType getDieType() {
		return dieType;
	}
	public void setDieType(DieType dieType) {
		this.dieType = dieType;
	}
}