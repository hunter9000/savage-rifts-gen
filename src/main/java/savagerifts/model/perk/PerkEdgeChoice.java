package savagerifts.model.perk;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import savagerifts.model.edge.EdgeCategoryType;

import javax.persistence.*;

@Entity
@Table(name = "perk_edge_choice")
@JsonIgnoreProperties(value = {"perk"})
public class PerkEdgeChoice {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    @JsonIgnore
    @OneToOne
    @JoinColumn(name = "perk", nullable = false, updatable = false)
    private Perk perk;

    // category to choose an edge from
    @Column(name = "edge_category", nullable = false, updatable = false)
    @Enumerated(EnumType.STRING)
    private EdgeCategoryType edgeCategory;

    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public Perk getPerk() {
        return perk;
    }
    public void setPerk(Perk perk) {
        this.perk = perk;
    }

    public EdgeCategoryType getEdgeCategory() {
        return edgeCategory;
    }
    public void setEdgeCategory(EdgeCategoryType edgeCategory) {
        this.edgeCategory = edgeCategory;
    }
}
