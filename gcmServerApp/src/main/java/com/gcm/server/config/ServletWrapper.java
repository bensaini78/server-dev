package com.gcm.server.config;

import java.util.Enumeration;
import java.util.Properties;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

public class ServletWrapper extends AbstractController
implements InitializingBean {
	
	private static Logger logger = LoggerFactory
			.getLogger(ServletWrapper.class);
	
	private Class servletClass;

	private String servletName;

	private Properties initParameters = new Properties();
	
	private Servlet servletInstance;

	public void afterPropertiesSet(){
		try{
			
			if (this.servletClass == null) {
				throw new IllegalArgumentException("servletClass is required");
			}
			if (!Servlet.class.isAssignableFrom(this.servletClass)) {
				throw new IllegalArgumentException("servletClass [" + this.servletClass.getName() +
					"] needs to implement interface [javax.servlet.Servlet]");
			}
			
			
			logger.info("Initializing Servlet Class:{}",servletClass);
			
			logger.info("Init Parameters :{}",initParameters);
			
			this.servletInstance = (Servlet) this.servletClass.newInstance();
			this.servletInstance.init(new CustomServletConfig());
		    
			logger.info("Initialization of Servlet Class:{} Successfull",servletClass);
		} catch(Exception ex){
			logger.error("Exception during initilialization of servlet class:{}",servletClass,ex);
		}		
	}
	
	private class CustomServletConfig implements ServletConfig {

		public String getServletName() {
			return servletName;
		}

		public ServletContext getServletContext() {
			return ServletWrapper.this.getServletContext();
		}

		public String getInitParameter(String paramName) {
			return initParameters.getProperty(paramName);
		}

		public Enumeration getInitParameterNames() {
			return initParameters.keys();
		}
	}
	
	@Override
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response)
		throws Exception {

		this.servletInstance.service(request, response);
		return null;
	}
	
	public void setServletClass(Class servletClass) {
		this.servletClass = servletClass;
	}

	public void setServletName(String servletName) {
		this.servletName = servletName;
	}

	public void setInitParameters(Properties initParameters) {
		this.initParameters = initParameters;
	}

	public Class getServletClass() {
		return servletClass;
	}

	public Properties getInitParameters() {
		return initParameters;
	}	
}
