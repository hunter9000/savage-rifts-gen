package savagerifts.repository;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import savagerifts.model.perk.Perk;

@Repository
@Qualifier(value = "perkRepository")
public interface PerkRepository extends CrudRepository<Perk, Long> {

}
