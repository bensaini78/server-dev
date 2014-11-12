package com.gcm.server.core;

import java.util.HashMap;

/**
 * Class {@code KeyValuePairMap} is a {@code HashMap} implementation which provides a 
 * work-around for use in RESTFull Spring MVC applications to address an apparent limitation 
 * in the framework that doesn't allow any kind of {@code Collection Object} using a parameterized-type to be
 * passed as a parameter to a {@code Controller Class} method, as doing so will generates a Runtime {@code Exception}.
 */
public class KeyValuePairMap extends HashMap<String,Object>{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
}
