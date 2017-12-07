package com.lson.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.lson.model.Module;
import com.lson.model.Role;
import com.lson.model.User;
import com.lson.model.UserRole;
import com.lson.service.ModuleService;
import com.lson.service.RoleService;
import com.lson.service.UserRoleService;
import com.lson.service.UserService;

public class UserTest extends BaseTest {
	@Autowired
	UserService userService;
	@Test
	public void test(){
		User user = new User();
		user.setName(UUID.randomUUID().toString());
		userService.insert(user);
		String string = null;
//		string.equals("");
	}
	
	@Autowired
	ModuleService moduleService;
	@Test
	public void test3(){
		System.out.println();
		Map<String, Object> map = new HashMap<>();
		map.put("name", "基础模块");
		List<Module> list = moduleService.getModule(map);
		for (Module module : list) {
			System.out.println(module.getName());
		}
	}
	
	@Autowired
	RoleService roleService;
	@Test
	public void test2(){
		Role role = new Role();
		role.setName("普通用户");
		roleService.insert(role);
	}
	
	@Autowired
	UserRoleService userRoleService;
	@Test
	public void test4(){
		Role role = roleService.selectById("45f5fb2b9e16454786b601ad015ed2cb");
		User user = userService.selectById("2121b9a28f4c481982d5d826503d2b9e");
		UserRole userRole = new UserRole();
		userRole.setRoleId(role.getRoleId());
		userRole.setUserId(user.getUserId());
		userRoleService.insert(userRole);
	}
	
}
