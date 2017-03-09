package savagerifts.model.framework;

import com.fasterxml.jackson.annotation.JsonIgnore;
import savagerifts.model.edge.Edge;

import javax.persistence.*;

@Entity
@Table(name = "framework_edge")
public class FrameworkEdge {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false, updatable = false)
    private Long id;

    @JsonIgnore
    @OneToOne
    @JoinColumn(name = "frameworkFeature", nullable = false, updatable = false)
    private FrameworkFeature frameworkFeature;

    @OneToOne
    @JoinColumn(name = "edge", nullable = false, updatable = false)
    private Edge edge;

    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public FrameworkFeature getFrameworkFeature() {
        return frameworkFeature;
    }
    public void setFrameworkFeature(FrameworkFeature frameworkFeature) {
        this.frameworkFeature = frameworkFeature;
    }

    public Edge getEdge() {
        return edge;
    }
    public void setEdge(Edge edge) {
        this.edge = edge;
    }
}
