package savagerifts.repository;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import savagerifts.model.perk.PerkSelection;

@Repository
@Qualifier(value = "perkSelectionRepository")
public interface PerkSelectionRepository extends CrudRepository<PerkSelection, Long> {
    @Modifying
    void deleteById(Long id);
}
