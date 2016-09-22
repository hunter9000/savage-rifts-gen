package savagerifts.util;

import org.springframework.beans.factory.annotation.Autowired;
import savagerifts.model.user.Role;
import savagerifts.model.user.RoleType;
import savagerifts.model.user.User;
import savagerifts.repository.UserRepository;
import savagerifts.security.JwtSubject;

import javax.servlet.http.HttpServletRequest;

public class AuthUtils {

    public static final String JWT_TOKEN_NAME = "jwtToken";
    public static final String LOGGED_IN_USER = "loggedInUser";
    public static final String CHARACTER_NAME = "character";

    public static boolean isUserAdmin(User user) {
        return userHasRole(user, RoleType.ADMIN);
    }

    public static boolean isUserPlayer(User user) {
        return userHasRole(user, RoleType.PLAYER);
    }

    public static boolean userHasRole(User user, RoleType role) {
        for (Role userrole : user.getRoles()) {
            if (userrole.getRoleName().equals(role)) {
                return true;
            }
        }
        return false;
    }

    public static long getUserId(HttpServletRequest request) {
        return ((JwtSubject)request.getAttribute(JWT_TOKEN_NAME)).getUserId();
    }

    public static User getLoggedInUser(HttpServletRequest request) {
        return ((User)request.getAttribute(LOGGED_IN_USER));
    }
}
