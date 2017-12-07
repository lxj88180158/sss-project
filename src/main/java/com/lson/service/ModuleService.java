package com.lson.service;

import com.lson.model.Module;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author lson
 * @since 2017-11-28
 */
public interface ModuleService extends IService<Module> {

	List<Module> getModule(Map<String, Object> map);

	List<Module> getModuleTree();
	
}
