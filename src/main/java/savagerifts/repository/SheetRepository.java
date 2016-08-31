package savagerifts.repository;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import savagerifts.model.Sheet;

@Repository
@Qualifier(value = "sheetRepository")
public interface SheetRepository extends CrudRepository<Sheet, Long> {
}
