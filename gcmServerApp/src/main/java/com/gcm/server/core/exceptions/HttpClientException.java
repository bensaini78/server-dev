package com.gcm.server.core.exceptions;

public class HttpClientException extends RuntimeException {

	private static final long serialVersionUID = -4952658268168026000L;

	private String uiErrMsgCode;

	private String url;

	public HttpClientException(String message, Throwable cause) {
		super(message, cause);
	}

	public HttpClientException(String message) {
		super(message);
	}

	private HttpClientException(Builder builder) {
		super(builder.errMsg, builder.cause);
		uiErrMsgCode = builder.uiErrMsgCode;
		url = builder.url;
	}

	public String getUiErrMsgCode() {
		return uiErrMsgCode;
	}

	public String getUrl() {
		return url;
	}

	@Override
	public String toString() {
		return new StringBuffer().append("HttpClientException [uiErrMsgCode=")
				.append(uiErrMsgCode).append(", url=").append(url).append("]")
				.toString();
	}

	public static class Builder {
		// Required parameters
		private String errMsg = "";
		private String uiErrMsgCode = "";
		private String url = "";

		// Optional parameters
		private Throwable cause = new Exception("PasswordChangeException");

		public Builder() {
		}

		public Builder(String uiErrMsgCode, String errMsg) {
			this.uiErrMsgCode = uiErrMsgCode;
			this.errMsg = errMsg;
		}

		public Builder(String errMsg) {
			this.errMsg = errMsg;
		}

		public Builder url(String val) {
			this.url = val;
			return this;
		}

		public Builder cause(Throwable val) {
			this.cause = val;
			return this;
		}

		public HttpClientException build() {
			return new HttpClientException(this);
		}
	}
}
