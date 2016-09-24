package savagerifts.interceptor;

import savagerifts.model.user.RoleType;
import savagerifts.model.user.User;
import savagerifts.repository.UserRepository;
import savagerifts.security.ForbiddenAccessException;
import savagerifts.util.AuthUtils;
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
        if (permissionAnnotation == null) {        // if present,
            return true;
        }

        // return if any roles in annotation match any roles in user.roles
        User user = AuthUtils.getLoggedInUser(request);

        for (RoleType roleType : permissionAnnotation.allowedRoles()) {
            if (AuthUtils.userHasRole(user, roleType)) {
                return true;
            }
        }
        throw new ForbiddenAccessException();
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {

    }
}

