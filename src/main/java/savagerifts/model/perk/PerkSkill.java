package savagerifts.model.perk;

//@Entity
//@Table(name = "perk_skill")
public class PerkSkill {

//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @Column(name = "id", unique = true, nullable = false)
    private Long id;

//    @OneToOne
//    @JoinColumn(name = "perk", nullable = false, updatable = false)
    private Perk perk;

    // skill stuff here

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
}
