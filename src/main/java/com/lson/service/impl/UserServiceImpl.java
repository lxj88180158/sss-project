package com.lson.service.impl;

import com.lson.model.User;
import com.lson.mapper.UserMapper;
import com.lson.service.UserService;
import com.lson.utils.DataTools;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author lson
 * @since 2017-11-28
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
	@Autowired
	UserMapper userMapper;
	
	@Override
	public List<User> getUsers(String name,String code,String userId){
		EntityWrapper<User> entityWrapper = new EntityWrapper<>();
		if(!DataTools.isNullOrEmpty(name)){
			entityWrapper.like("name", name);
		}
		if(!DataTools.isNullOrEmpty(userId)){
			entityWrapper.eq("user_id", userId);
		}
		if(!DataTools.isNullOrEmpty(code)){
			entityWrapper.like("code", code);
		}
		
		
		List<User> users = userMapper.selectList(entityWrapper);
		return users;
	}
	
}
