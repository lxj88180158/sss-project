package com.lson.model;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.losn.annotation.FieldRemark;
import com.baomidou.mybatisplus.annotations.TableField;
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
public class User extends Model<User> {

    private static final long serialVersionUID = 1L;

    @TableId("user_id")
	private String userId;
	private String name;
	private Integer age;
	private Integer sex;
	@TableField("dept_id")
	private String deptId;
	@TableField("create_time")
	private Date createTime;
	private Integer type;
	
	private String code;
	
	@FieldRemark(value="普通用户",type="type")
	public static int type_normal = 2;
	@FieldRemark(value="系统管理员",type="type")
	public static int type_system = 9;
	

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	@Override
	protected Serializable pkVal() {
		return this.userId;
	}

}
