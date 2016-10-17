package savagerifts.repository;

import savagerifts.model.user.Role;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Qualifier(value="roleRepository")
public interface RoleRepository extends CrudRepository<Role, Long> {
}