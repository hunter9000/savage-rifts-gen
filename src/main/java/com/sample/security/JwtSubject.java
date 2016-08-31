package com.sample.security;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sample.model.user.RoleType;

import java.util.List;

public class JwtSubject {

    private long userId;
    private List<RoleType> roles;
    private String userName;

    public long getUserId() {
        return userId;
    }
    public void setUserId(long userId) {
        this.userId = userId;
    }

    /** Don't use these to determine user's access, get the roles from the db. these are for the ui to use. */
    public List<RoleType> getRoles() {
        return roles;
    }
    public void setRoles(List<RoleType> roles) {
        this.roles = roles;
    }

    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }

    @JsonIgnore
    public String getAsJSON() throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(this) ;
    }

    @JsonIgnore
    public boolean isValid() {
        return userId > 0;
    }
}
