package com.lson.model;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.activerecord.Model;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author lson
 * @since 2017-11-28
 */
public class Role extends Model<Role> {

    private static final long serialVersionUID = 1L;

    @TableId("role_id")
	private String roleId;
	private String name;


	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	protected Serializable pkVal() {
		return this.roleId;
	}

}
