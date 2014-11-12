package com.gcm.server.core;

public interface ApplicationConstants {
	
	public static final String CHANNEL_CHAT="chat";
	public static final String CHANNEL_EMAIL="email";
	
	public static final String OPT_ONLINE_SUFFIX="optonline.net";
	
	public static final String ENV_PREFIX_PROPERTY_NAME="CvChatEnv";	
	
	String PROPERTY_ENV_PREFIX = "com.cablevision.cvchat.env.prefix";
	
	String API_KEY = "com.gcm.server.api.key";
	
	//application.properties keys
	String PROPERTY_SURVEY_URL = "com.cablevision.cvchat.survey.url";
	String HOST_URL = "com.cablevision.cvchat.host.url";
	String RNT_URL = "com.cablevision.cvchat.rnt.url";
	String RESI_MAILBOX = "resi_net.mailbox.email";
	String BIZ_MAILBOX = "biz_net.mailbox.email";
}
