package savagerifts.model.sheet;

import com.fasterxml.jackson.annotation.JsonIgnore;
import savagerifts.model.edge.Edge;

import javax.persistence.*;

@Entity
@Table(name = "edge_selection")
public class EdgeSelection {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    @JsonIgnore
    @OneToOne
    @JoinColumn(name = "sheet", nullable = false, updatable = false)
    private Sheet sheet;

    @OneToOne
    @JoinColumn(name = "edge", nullable = false, updatable = false)
    private Edge edge;


    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public Sheet getSheet() {
        return sheet;
    }
    public void setSheet(Sheet sheet) {
        this.sheet = sheet;
    }

    public Edge getEdge() {
        return edge;
    }
    public void setEdge(Edge edge) {
        this.edge = edge;
    }
}
