package com.lson.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.coyote.http11.filters.VoidInputFilter;
import org.hibernate.validator.internal.util.IgnoreJava6Requirement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lson.model.User;
import com.lson.service.ModuleService;
import com.lson.service.UserService;

@Controller

public class LoginController {
	@Autowired
	UserService userService;
	@RequestMapping("/login")    
	public String login(){
		return "login";
	}
	
	@Autowired
	ModuleService moduleService;
	@RequestMapping("/test")
	public String test(){
		Map<String, Object> map = new HashMap<>();
		moduleService.getModule(map);
		return "test";
	}
	
	@RequestMapping("/index")
	public String index(){
		
		return "index";
	}
	
}
