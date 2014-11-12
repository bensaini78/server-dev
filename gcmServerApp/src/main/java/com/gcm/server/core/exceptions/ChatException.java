package com.gcm.server.core.exceptions;

public class ChatException extends RuntimeException {

	public ChatException() {
		super();		
	}

	public ChatException(String message, Throwable cause) {
		super(message, cause);		
	}

	public ChatException(String message) {
		super(message);	
	}

	public ChatException(Throwable cause) {
		super(cause);		
	}
}
