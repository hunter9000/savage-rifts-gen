package savagerifts.repository;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import savagerifts.model.skill.SkillKnowledge;
import savagerifts.model.user.User;

import java.util.List;

@Repository
@Qualifier(value = "skillKnowledgeRepository")
public interface SkillKnowledgeRepository extends CrudRepository<SkillKnowledge, Long> {
    List<SkillKnowledge> findByUser(User user);
    List<SkillKnowledge> findByUserIsNull();

}