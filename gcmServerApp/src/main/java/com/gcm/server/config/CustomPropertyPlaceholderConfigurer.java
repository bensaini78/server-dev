package com.gcm.server.config;

import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

import com.gcm.server.util.StringUtils;


/**
 * 
 * @author bensaini
 *
 */
public class CustomPropertyPlaceholderConfigurer extends PropertyPlaceholderConfigurer {
	
	private static Logger logger = LoggerFactory.getLogger(CustomPropertyPlaceholderConfigurer.class);

	protected String systemPropertyPrefixName = "cv_contact_us_env_prefix";
	
	protected String delimiter = ".";
	
	private String prefix = System.getProperty(systemPropertyPrefixName);
	
	{
		logger.info("System Env Prefix:{} Value At Startup:{}",systemPropertyPrefixName,prefix);
		
		if(prefix==null){
			//If env prefix not loaded via System Property
			//String envPrefixDefault=prop.getProperty(ApplicationPropertyConstants.ENV_PREFIX_DEFAULT);
			//LOG.fatal("Property variable:"+ApplicationPropertyConstants.ENV_PREFIX_PROPERTY_NAME+
				//	 " not found :Defaulting to "+envPrefixDefault);
			logger.error("System Env Prefix:{} Not Found",systemPropertyPrefixName);
			//TODO defaulting to dev
			prefix = "dev";
		}
	}
	
	/**
	 * @return the systemPropertyPrefixName
	 */
	public String getSystemPropertyPrefixName() {
		return systemPropertyPrefixName;
	}

	/**
	 * @param systemPropertyPrefixName the systemPropertyPrefixName to set
	 */
	public void setSystemPropertyPrefixName(String systemPropertyPrefixName) {
		this.systemPropertyPrefixName = systemPropertyPrefixName;
	}

	/**
	 * @return the delimiter
	 */
	public String getDelimiter() {
		return delimiter;
	}

	/**
	 * @param delimiter the delimiter to set
	 */
	public void setDelimiter(String delimiter) {
		this.delimiter = delimiter;
	}

	/**
	 * Override base class to prefix the property name based on the
	 *  System Property Prefix, if one exists.
	 */
	protected String resolvePlaceholder(String placeholder, Properties props) {
		if(!StringUtils.isEmpty(systemPropertyPrefixName)) {
			
			if(!StringUtils.isEmpty(prefix)) {
				StringBuffer propNameSB = new StringBuffer();
				propNameSB.append(prefix);
				if(!StringUtils.isEmpty(delimiter)) {
					propNameSB.append(delimiter);
				}
				propNameSB.append(placeholder);
				return props.getProperty(propNameSB.toString());
			}
			
		}
		return props.getProperty(placeholder);
	}
}
