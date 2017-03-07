package savagerifts.model.perk;

import savagerifts.model.Gear;

//@Entity
//@Table(name = "perk_provided_gear")
public class PerkProvidedGear {

//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @Column(name = "id", unique = true, nullable = false)
    private Long id;

//    @OneToOne
//    @JoinColumn(name = "perk", nullable = false, updatable = false)
    private Perk perk;

    Gear gear;
    Integer quantity;

}
