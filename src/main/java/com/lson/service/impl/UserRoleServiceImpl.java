package com.lson.service.impl;

import com.lson.model.UserRole;
import com.lson.mapper.UserRoleMapper;
import com.lson.service.UserRoleService;
import com.lson.utils.DataTools;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import java.util.ArrayList;
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
public class UserRoleServiceImpl extends ServiceImpl<UserRoleMapper, UserRole> implements UserRoleService {
	@Autowired
	UserRoleMapper userRoleMapper;
	/**
	 * 获得用户相关角色
	 * @param userId
	 * @return
	 */
	@Override
	public List<UserRole> getRelationRole(String userId){
		EntityWrapper<UserRole> entityWrapper = new EntityWrapper<>();
		entityWrapper.eq("user_id", userId);
		List<UserRole> list = userRoleMapper.selectList(entityWrapper);
		return list;
	}
	
	@Override
	public void saveUserRole(String userIds,String roleIds){
		if(DataTools.isNullOrEmpty(userIds)){
			return ;
		}
		for (String userId : userIds.split(",")) {
			List<UserRole> saveList = new ArrayList<>();
			List<String> deleteRoleIds = new ArrayList<>();
			List<UserRole> list = userRoleMapper.selectList(new EntityWrapper<UserRole>().eq("user_id", userId));
			if(DataTools.isNullOrEmpty(roleIds)){
//				for (UserRole userRole : list) {
//					deleteRoleIds.add(userRole.getUserRoleId());
//				}
			}else{
				for (String roleId : roleIds.split(",")) {
					UserRole userRole = null;
					EntityWrapper<UserRole> entityWrapper = new EntityWrapper<>();
					entityWrapper.eq("user_id", userId).eq("role_id", roleId);
					List<UserRole> list2 = userRoleMapper.selectList(entityWrapper);
					if(list2.size()>0){
						userRole = list2.get(0);
					}else{
						userRole = new UserRole();
						userRole.setRoleId(roleId);
						userRole.setUserId(userId);
					}
					saveList.add(userRole);
				}
			}
			
			//获得要删除的roleIds
			list.removeAll(saveList);//取差集
			for (UserRole userRole : list) {
				deleteRoleIds.add(userRole.getUserRoleId());
			}
			System.out.println(list.size());
			if(deleteRoleIds.size()>0){
				userRoleMapper.deleteBatchIds(deleteRoleIds);
			}
			
			//保存
			for (UserRole userRole : saveList) {
				if(userRole.getUserRoleId()!=null){
					userRoleMapper.updateById(userRole);
				}else{
					userRoleMapper.insert(userRole);
				}
			}
			
		}
	}
	
	
	
}
