package com.lson.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lson.commons.ResultMsg;
import com.lson.model.Module;
import com.lson.service.ModuleService;

@Controller
@RequestMapping("/module")
public class ModuleController extends BaseController{
	@Autowired
	ModuleService moduleService;
	
	@RequestMapping("/getModule")
	@ResponseBody
	public ResultMsg getModule(){
		try {
			List<Module> list = moduleService.getModuleTree();
			return ResultMsg.success().add("list", list);
		} catch (Exception e) {
			e.printStackTrace();
			return ResultMsg.fail();
		}
	}
}
