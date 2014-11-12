package com.gcm.server.helper;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gcm.server.common.ApplicationPropertiesBean;
import com.gcm.server.core.ApplicationConstants;
import com.google.android.gcm.server.Message;
import com.google.android.gcm.server.Result;
import com.google.android.gcm.server.Sender;

@Service
public class GcmHelper {
	
	private static Logger logger = LoggerFactory.getLogger(GcmHelper.class);
	
	@Autowired
	ApplicationPropertiesBean applicationPropertiesBean;
	
	public String getApiKey(){
		return applicationPropertiesBean.getProperty(ApplicationConstants.API_KEY);
	}
	
	public String sendMessage(String regId,String messageJson){
		String response = "";
		Sender sender = null;
		try {
			sender = new Sender(getApiKey());
			Message message = new Message.Builder().build();
			Result result = sender.send(message, regId, 5);
	        response = "Sent message to one device: " + result;
			
		} catch (IOException e) {
			response = "Failed to send message to one device";
			logger.error("Email/Chat Server not available",e);			
		}
		return response;
	}	
}
