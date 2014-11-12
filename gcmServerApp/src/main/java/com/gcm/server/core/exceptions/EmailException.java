package com.gcm.server.core.exceptions;

public class EmailException extends RuntimeException {

	public EmailException() {
		super();		
	}

	public EmailException(String message, Throwable cause) {
		super(message, cause);		
	}

	public EmailException(String message) {
		super(message);	
	}

	public EmailException(Throwable cause) {
		super(cause);		
	}
}
