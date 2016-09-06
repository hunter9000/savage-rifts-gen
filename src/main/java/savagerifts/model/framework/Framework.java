package savagerifts.model.framework;

import savagerifts.model.DieType;
import savagerifts.model.Edge;
import savagerifts.model.Gear;
import savagerifts.model.Hindrance;
import savagerifts.model.benefittable.BenefitTableRoll;
import savagerifts.model.power.PowerList;

import javax.persistence.Table;
import java.util.List;

//@Table
public class Framework {
	FrameworkType type;
	List<BenefitTableRoll> tableRolls;
	List<Edge> builtInEdges;
	List<Hindrance> builtInHinderance;
	PowerList powerList;
	List<Gear> startingGear;
	int startingAttributePoints;
	DieType startingStr, startingAgi;// etc;
	DieType maxStr, maxAgi;// etc;
	
	
//	Combat Cyborg, rolls: [BenefitTableRoll(rollId: 1, allowed: {Cybernetics, Close Combat Weapons, Ranged Weapons, Training})
//						   BenefitTableRoll(rollId: 2, allowed: {Cybernetics, Close Combat Weapons, Ranged Weapons, Training})
//						   BenefitTableRoll(rollId: 3, disallowed: {Body Armor}, notMagic: true, notPsionics: true) ]
//				   bonuses: //Bionic Augmentation,
//							Cybernetic Enhancements,
//							//High-Performance Legs,
//							Fleet-Footed,
//							M.D.C. Armor,
//							More Machine,
//							Size +1,
//							Upgradable
//							Unarmed Combat,
//				   startingAttributePoints = 2
//				   maxStr = DieType.D4
//				   maxAgi = DieType.D4
//				   startingStr = new Roll(DieType.D12, 2)
//				   startingAgi = new Roll(DieType.D10, 0)
//				   startingVgr = new Roll(DieType.D12, 0)
//
//	Crazy,
//	Cyber-Knight,
//	Glitter Boy,
//	Juicer,
//	MARS,
//	Burster,
//	Mind Melter,
//	Ley Line Walker,
//	Mystic,
//	Techno-Wizard,
//	Flame Wind Dragon Hatchling,
	
}