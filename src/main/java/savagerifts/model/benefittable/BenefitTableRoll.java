package savagerifts.model.benefittable;

import javax.persistence.Table;
import java.util.List;

@Table
public class BenefitTableRoll {
	List<Table> allowedTables;
	List<Table> restrictedTables;
	//boolean allowMagic		 just define the disallowed tables as the magic ones
	//boolean allowPsionics
}