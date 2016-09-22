package savagerifts.repository;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import savagerifts.model.framework.Framework;
import savagerifts.model.sheet.Sheet;

@Repository
@Qualifier(value = "frameworkRepository")
public interface FrameworkRepository extends CrudRepository<Framework, Long> {

}
