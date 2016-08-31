package com.sample.interceptor;

import com.sample.model.user.RoleType;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/** Annotates a method that has a role requirement. Used by RolePermissionInterceptor to validate that the user has at least one of the allowedRoles */
@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface RolePermissions {
    RoleType[] allowedRoles();
}