package com.lson.service;

import com.lson.model.User;

import java.util.List;

import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author lson
 * @since 2017-11-28
 */
public interface UserService extends IService<User> {

	List<User> getUsers(String name, String code, String userId);
	
}
