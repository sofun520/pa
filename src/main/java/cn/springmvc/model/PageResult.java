package cn.springmvc.model;

import com.alibaba.fastjson.JSONObject;

public class PageResult {

	private String success;
	private String message;

	public static String SUCCESS = "0";
	public static String FAILED = "1";
	public static String DATA = "data";
	public JSONObject data;

	public PageResult(String success, String message, JSONObject data) {
		this.success = success;
		this.message = message;
		this.data = data;
	}

	public JSONObject getData() {
		return data;
	}

	public void setData(JSONObject data) {
		this.data = data;
	}

	public String getSuccess() {
		return success;
	}

	public void setSuccess(String success) {
		this.success = success;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
