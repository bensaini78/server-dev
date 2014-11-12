package com.gcm.server.config;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.gcm.server.common.ApplicationPropertiesBean;

public class AppConfigServletContextListener  implements ServletContextListener {
	
  private static Logger logger = LoggerFactory.getLogger(AppConfigServletContextListener.class);

  private String contextProperty = "ctx";
  
  public void contextDestroyed(ServletContextEvent sce) {
  }

  public void contextInitialized(ServletContextEvent sce) {
      
	  logger.debug("Injecting Application Properties into Servlet Context");
      WebApplicationContext context = WebApplicationContextUtils
              .getRequiredWebApplicationContext(sce.getServletContext());
      ApplicationPropertiesBean applicationPropertiesBean =
          (ApplicationPropertiesBean) context.getBean("applicationPropertiesBean");
      
      if(applicationPropertiesBean!=null){
          sce.getServletContext().setAttribute(contextProperty,applicationPropertiesBean.getProperties());
      }
      else{
    	  logger.error("Could not inject as applicationPropertiesBean not found in spring context");
      }
      
      logger.debug("Injected Application Properties into Servlet Context");
  }
}