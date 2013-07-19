package com.omartech.tdg.utils;

public class UploadResult {
	
	private int error;
	private String url;
	public UploadResult(int error, String url) {
		super();
		this.error = error;
		this.url = url;
	}
	public int getError() {
		return error;
	}
	public void setError(int error) {
		this.error = error;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
}
