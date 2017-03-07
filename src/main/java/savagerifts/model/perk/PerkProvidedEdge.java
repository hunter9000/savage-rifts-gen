package savagerifts.model.perk;


import savagerifts.model.edge.Edge;

import javax.persistence.*;

@Entity
@Table(name = "perk_provided_edge")
public class PerkProvidedEdge {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    @OneToOne
    @JoinColumn(name = "perk", nullable = false, updatable = false)
    private Perk perk;

    @OneToOne
    @JoinColumn(name = "provided_edge", nullable = false, updatable = false)
    private Edge providedEdge;      // not nullable

    @OneToOne
    @JoinColumn(name = "backup_edge", updatable = false)
    private Edge backupEdge;        // nullable, default null

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

    public Edge getProvidedEdge() {
        return providedEdge;
    }
    public void setProvidedEdge(Edge providedEdge) {
        this.providedEdge = providedEdge;
    }

    public Edge getBackupEdge() {
        return backupEdge;
    }
    public void setBackupEdge(Edge backupEdge) {
        this.backupEdge = backupEdge;
    }
}
