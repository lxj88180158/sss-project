package com.lson.mapper;

import com.lson.model.Module;

import java.util.List;
import java.util.Map;

import com.baomidou.mybatisplus.mapper.BaseMapper;

/**
 * <p>
  *  Mapper 接口
 * </p>
 *
 * @author lson
 * @since 2017-11-28
 */
public interface ModuleMapper extends BaseMapper<Module> {
	List<Module> getModule(Map<String, Object> map);
}