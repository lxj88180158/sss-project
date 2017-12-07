package com.lson.service.impl;

import com.lson.model.Role;
import com.lson.mapper.RoleMapper;
import com.lson.service.RoleService;
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
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {
	@Autowired
	RoleMapper roleMapper;
	
	@Override
	public List<Role> getRoles(String roleName){
		EntityWrapper<Role> entityWrapper = new EntityWrapper<>();
		if(DataTools.isNullOrEmpty(roleName)){
			entityWrapper.like("name", roleName);
		}
		return roleMapper.selectList(entityWrapper);
	}
}
