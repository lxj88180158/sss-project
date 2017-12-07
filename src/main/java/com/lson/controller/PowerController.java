package com.lson.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lson.commons.JavaForm;
import com.lson.commons.ResultMsg;
import com.lson.model.Role;
import com.lson.model.User;
import com.lson.model.UserRole;
import com.lson.service.RoleService;
import com.lson.service.UserRoleService;
import com.lson.service.UserService;
import com.lson.utils.DataTools;

@Controller
@RequestMapping("/power")
public class PowerController {
	@Autowired
	UserService userService;
	@Autowired
	RoleService roleService;
	@Autowired
	UserRoleService userRoleService;
	
	@RequestMapping
	public String listPower(){
		return "power/listPower";
	}
	
	@GetMapping("/listUser")
	@ResponseBody
	public ResultMsg listUser(JavaForm javaForm){
		try {
			String name = javaForm.getStr1();
//			String code = javaForm.getStr2();
			List<User> users = userService.getUsers(name, null, null);
			List types = DataTools.getList(User.class, "type");
			return ResultMsg.success().add("users", users).add("types", types);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResultMsg.fail();
	}
	
	@RequestMapping("/listRole")
	@ResponseBody
	public ResultMsg listRole(JavaForm javaForm){
		String name = javaForm.getStr1();
		List<Role> roles = roleService.getRoles(name);
		return ResultMsg.success().add("roles", roles);
		
	}
	
	@RequestMapping("/relationRole")
	@ResponseBody
	public ResultMsg relationRole(JavaForm javaForm){
		String userId = javaForm.getUuid();
		List<UserRole> list = userRoleService.getRelationRole(userId);
		return ResultMsg.success().add("list", list);
	}
	
	@RequestMapping("/save")
	@ResponseBody
	public ResultMsg save(HttpServletRequest request){
		try {
			String userIds = request.getParameter("userIds");
			String roleIds = request.getParameter("roleIds");
			System.out.println(userIds);
			System.out.println(roleIds);
			userRoleService.saveUserRole(userIds, roleIds);
			return ResultMsg.success();
		} catch (Exception e) {
			e.printStackTrace();
			return ResultMsg.fail();
		}
	}
	
}
