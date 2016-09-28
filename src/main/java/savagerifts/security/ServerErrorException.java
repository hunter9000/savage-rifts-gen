package savagerifts.security;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value= HttpStatus., reason="Something went wrong")     // 500
public class ServerErrorException extends RuntimeException {

}

