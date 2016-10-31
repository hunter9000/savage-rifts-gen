package savagerifts.repository;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import savagerifts.model.edge.Edge;

@Repository
@Qualifier(value = "edgeRepository")
public interface EdgeRepository  extends CrudRepository<Edge, Long>  {
}
