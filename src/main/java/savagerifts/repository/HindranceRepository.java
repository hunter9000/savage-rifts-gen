package savagerifts.repository;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import savagerifts.model.hindrance.Hindrance;
import savagerifts.model.hindrance.HindranceType;

@Repository
@Qualifier(value = "hindranceRepository")
public interface HindranceRepository extends CrudRepository<Hindrance, Long> {
    Hindrance findByType(HindranceType hindranceType);
}
