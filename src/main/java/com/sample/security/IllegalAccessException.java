package com.sample.security;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value= HttpStatus.FORBIDDEN, reason="Illegal access requested")     // 403
public class IllegalAccessException extends RuntimeException {

}

