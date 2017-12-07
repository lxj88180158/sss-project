package com.lson.service;

import com.lson.model.UserRole;

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
public interface UserRoleService extends IService<UserRole> {

	List<UserRole> getRelationRole(String userId);


	void saveUserRole(String userIds, String roleIds);
	
}
