package com.sample.model.user;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;

@Entity
@Table(name = "role")
@JsonIgnoreProperties(value = "user")
public class Role {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "role_name", nullable = false, length = 20, updatable = false, unique = true)
    @Enumerated(EnumType.STRING)
    private RoleType roleName;

    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }

    public RoleType getRoleName() {
        return roleName;
    }
    public void setRoleName(RoleType roleName) {
        this.roleName = roleName;
    }
}

