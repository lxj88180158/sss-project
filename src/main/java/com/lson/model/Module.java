package com.lson.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.activerecord.Model;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 
 * </p>
 *
 * @author lson
 * @since 2017-11-28
 */
public class Module extends Model<Module> {

    private static final long serialVersionUID = 1L;

    @TableId("module_id")
	private String moduleId;
	private String name;
	private String url;
	@TableField("father_id")
	private String fatherId;
	private Integer order;
	
	/**
	 * 子模块
	 */
	private List<Module> children = new ArrayList<>();


	
	public List<Module> getChildren() {
		return children;
	}

	public void setChildren(List<Module> children) {
		this.children = children;
	}

	public String getModuleId() {
		return moduleId;
	}

	public void setModuleId(String moduleId) {
		this.moduleId = moduleId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getFatherId() {
		return fatherId;
	}

	public void setFatherId(String fatherId) {
		this.fatherId = fatherId;
	}

	public Integer getOrder() {
		return order;
	}

	public void setOrder(Integer order) {
		this.order = order;
	}

	@Override
	protected Serializable pkVal() {
		return this.moduleId;
	}

}
