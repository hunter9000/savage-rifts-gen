package savagerifts.repository;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import savagerifts.model.race.Race;

@Repository
@Qualifier(value = "raceRepository")
public interface RaceRepository extends CrudRepository<Race, Long> {

}