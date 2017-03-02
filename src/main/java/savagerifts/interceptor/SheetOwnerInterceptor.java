package savagerifts.interceptor;

import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.ModelAndView;
import savagerifts.model.sheet.Sheet;
import savagerifts.model.user.User;
import savagerifts.repository.SheetRepository;
import savagerifts.security.BadRequestException;
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
            throw new BadRequestException("No sheetId parameter provided");
        }
        Sheet sheet = sheetRepository.findOne(sheetId);
        if (sheet == null) {
            throw new BadRequestException("sheetId parameter invalid");
        }

        User user = AuthUtils.getLoggedInUser(request);
        if (!sheet.getOwner().equals(user)) {
            throw new ForbiddenAccessException();
        }

        // check if the sheet is in the required steps, if any
        if (sheetOwnerAnnotation.requiredSteps().length > 0 && !ArrayUtils.contains(sheetOwnerAnnotation.requiredSteps(), sheet.getCreationStep())) {
            throw new BadRequestException("Sheet is not in the required creation step to make this call. Required: " + sheetOwnerAnnotation.requiredSteps() + ", currently: " + sheet.getCreationStep());
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
