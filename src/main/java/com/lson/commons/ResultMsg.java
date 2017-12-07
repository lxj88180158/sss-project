package com.lson.commons;

import java.util.HashMap;
import java.util.Map;

public class ResultMsg {
	private Map<String, Object> data = new HashMap<>();
	private String code;
	
	public static ResultMsg success(){
		ResultMsg resultMsg = new ResultMsg();
		resultMsg.setCode("200");
		return resultMsg;
	}
	
	public static ResultMsg fail(){
		ResultMsg resultMsg = new ResultMsg();
		resultMsg.setCode("300");
		return resultMsg;
	}
	
	public ResultMsg add(String key,Object value){
		this.data.put(key, value);
		return this;
	}
	
	public Map<String, Object> getData() {
		return data;
	}

	public void setData(Map<String, Object> data) {
		this.data = data;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	
}
