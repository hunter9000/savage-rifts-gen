package com.sample.repository;

import com.sample.model.user.Role;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Qualifier(value="roleRepository")
public interface RoleRepository extends CrudRepository<Role, Long> {
    public List<Role> findAll();
}