package com.gcm.server.common;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public class ApplicationPropertiesBean {

	private Properties applicationProperties;

	public ApplicationPropertiesBean() {
	}

	public void setApplicationProperties(Properties props) {
		applicationProperties = props;
	}

	public String getProperty(String key) {
		return applicationProperties.getProperty(key);
	}
	
	public Map<String, String> getProperties() {
         return Collections.unmodifiableMap(new HashMap<String, String>((Map)applicationProperties));
	}
}
