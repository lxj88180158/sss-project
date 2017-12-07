package com.lson.service.impl;

import com.lson.model.Module;
import com.lson.mapper.ModuleMapper;
import com.lson.service.ModuleService;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
public class ModuleServiceImpl extends ServiceImpl<ModuleMapper, Module> implements ModuleService {
	@Autowired
	ModuleMapper moduleMapper;
	
	@Override
	public List<Module> getModule(Map<String, Object> map){
		return moduleMapper.getModule(map);
	}
	/**
	 * 获得树形结构数据
	 */
	@Override
	public List<Module> getModuleTree(){
		Map<String, Object> map = new HashMap<>();
		map.put("top", true);
		List<Module> moduleTrees = moduleMapper.getModule(map);
		for (Module module : moduleTrees) {
			getChildren(module);
		}
		return moduleTrees;
	}
	
	/**
	 * 获得子模块（递归）
	 * @param module
	 */
	public void getChildren(Module module){
		Map<String, Object> map = new HashMap<>();
		map.put("fatherId", module.getModuleId());
		List<Module> children = moduleMapper.getModule(map);
		module.setChildren(children);
		for (Module module2 : children) {
			getChildren(module2);
		}
	}
	
}
