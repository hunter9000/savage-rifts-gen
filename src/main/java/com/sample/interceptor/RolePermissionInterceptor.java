package com.sample.interceptor;

import com.sample.model.user.RoleType;
import com.sample.model.user.User;
import com.sample.repository.UserRepository;
import com.sample.security.JwtSubject;
import com.sample.util.AuthUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RolePermissionInterceptor implements HandlerInterceptor {

    @Autowired
    private UserRepository userRepository;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // get the annotation
        HandlerMethod handlerMethod = (HandlerMethod) handler;
        RolePermissions permissionAnnotation = handlerMethod.getMethod().getAnnotation(RolePermissions.class);
        if (permissionAnnotation != null) {        // if present,
            // return if any roles in annotation match any roles in user.roles
            JwtSubject subject = (JwtSubject)request.getAttribute(AuthUtils.JWT_TOKEN_NAME);

            User user = userRepository.findOne(subject.getUserId());

            for (RoleType roleType : permissionAnnotation.allowedRoles()) {
                if (AuthUtils.userHasRole(user, roleType)) {
                    return true;
                }
            }
            throw new IllegalAccessException();
        }
        else {        // else return true since no perms are required
            return true;
        }
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}

