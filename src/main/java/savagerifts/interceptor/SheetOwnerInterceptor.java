package savagerifts.interceptor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.ModelAndView;
import savagerifts.model.sheet.Sheet;
import savagerifts.model.user.User;
import savagerifts.repository.SheetRepository;
import savagerifts.security.ForbiddenAccessException;
import savagerifts.util.AuthUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

@Component
public class SheetOwnerInterceptor implements HandlerInterceptor {

    @Autowired
    private SheetRepository sheetRepository;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // get the annotation
        HandlerMethod handlerMethod = (HandlerMethod) handler;
        SheetOwner sheetOwnerAnnotation = handlerMethod.getMethod().getAnnotation(SheetOwner.class);
        if (sheetOwnerAnnotation == null) {        // if not present, don't process
            return true;
        }

        Map<String, String> pathVariables = (Map<String, String>)request.getAttribute(HandlerMapping.URI_TEMPLATE_VARIABLES_ATTRIBUTE);

        Long sheetId = Long.valueOf(pathVariables.get("sheetId"));
        if (sheetId == null) {
            throw new ForbiddenAccessException();
        }
        Sheet sheet = sheetRepository.findOne(sheetId);
        if (sheet == null) {
            throw new ForbiddenAccessException();
        }

        User user = AuthUtils.getLoggedInUser(request);
        if (!sheet.getOwner().equals(user)) {
            throw new ForbiddenAccessException();
        }

        request.setAttribute(AuthUtils.SHEET, sheet);

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }



}
