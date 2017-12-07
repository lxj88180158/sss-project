package com.lson.service;

import com.lson.model.Role;

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
public interface RoleService extends IService<Role> {

	List<Role> getRoles(String roleName);
	
}
