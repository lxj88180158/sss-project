package com.lson.utils;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;
import com.losn.annotation.FieldRemark;
import com.lson.model.User;

public class DataTools {
	/**
	 * 判断是否是空
	 * @param object
	 * @return
	 */
	public static boolean isNullOrEmpty(Object object){
		if(object==null){
			return true;
		}
		if(object instanceof String){
			String string = (String)object;
			if(string.equals("")){
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 通过反射获取list
	 * @param classes
	 * @param fiedldName
	 * @return
	 * @throws IllegalArgumentException
	 * @throws IllegalAccessException
	 */
	public static List  getList(Class classes,String fiedldName) throws IllegalArgumentException, IllegalAccessException{
		List list = new ArrayList<>();
		Field[] fields = classes.getFields();
		for (Field field : fields) {
			FieldRemark fieldRemark = field.getAnnotation(FieldRemark.class);
			if(fieldRemark!=null){
				String type = fieldRemark.type();
				if(type.equals(fiedldName)){
					String name = fieldRemark.value();
					Integer value =(Integer)field.get(null);
					list.add(new Object[]{value,name});
				}
				
			}
		}
		return list;
	}
	
	
	public static void main(String[] args) {
		try {
			List list = getList(User.class, "type_");
			Gson gson = new Gson();
			System.out.println(gson.toJson(list));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
