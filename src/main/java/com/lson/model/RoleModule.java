package com.lson.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author lson
 * @since 2017-11-28
 */
@TableName("role_module")
public class RoleModule extends Model<RoleModule> {

    private static final long serialVersionUID = 1L;

    @TableId("role_module_id")
	private String roleModuleId;
	@TableField("module_id")
	private String moduleId;
	@TableField("role_id")
	private String roleId;


	public String getRoleModuleId() {
		return roleModuleId;
	}

	public void setRoleModuleId(String roleModuleId) {
		this.roleModuleId = roleModuleId;
	}

	public String getModuleId() {
		return moduleId;
	}

	public void setModuleId(String moduleId) {
		this.moduleId = moduleId;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	@Override
	protected Serializable pkVal() {
		return this.roleModuleId;
	}

}
