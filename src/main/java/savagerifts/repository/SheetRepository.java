package savagerifts.repository;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import savagerifts.model.sheet.Sheet;
import savagerifts.model.user.User;

import java.util.List;

@Repository
@Qualifier(value = "sheetRepository")
public interface SheetRepository extends CrudRepository<Sheet, Long> {
    List<Sheet> findByOwner(User owner);
}
