package savagerifts.security;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value= HttpStatus.BAD_REQUEST, reason="please check request parameters")     // 400 bad request
public class BadRequestException extends RuntimeException {

}

