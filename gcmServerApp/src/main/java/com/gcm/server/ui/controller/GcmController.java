package com.gcm.server.ui.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gcm.server.core.KeyValuePairMap;
import com.gcm.server.helper.GcmHelper;

@Controller
@RequestMapping("/gcm")
public class GcmController {

	private static Logger logger = LoggerFactory
			.getLogger(GcmController.class);

	@Autowired
	GcmHelper gcmHelper;
	
	/**
	 * URL:
	 * @return
	 */
	@RequestMapping(value = "/sendMessage", method = {
			RequestMethod.POST, RequestMethod.GET })
	public @ResponseBody KeyValuePairMap sendMessage(
			@RequestParam(value = "regId", required = true) String regId) {
		
		KeyValuePairMap map=new KeyValuePairMap();
		
		String messageJson = "Simple Text Message";
		String response = gcmHelper.sendMessage(regId,messageJson);
		map.put("response", response);
		
		return map;
	}
	
	
}