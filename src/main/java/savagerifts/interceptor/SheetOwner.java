package savagerifts.interceptor;

import savagerifts.model.sheet.SheetCreationStep;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/** Annotates a request method to indicate that a sheet is being requested (sheetId path parameter) that must belong to the loggedin user */
@Target({ElementType.METHOD, ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
public @interface SheetOwner {
    // the optional creation step(s) that this sheet must be in for this request to be valid
    SheetCreationStep[] requiredSteps() default {};
}
