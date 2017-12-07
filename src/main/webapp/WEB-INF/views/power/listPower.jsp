<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>  
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	$(function() {
		new Vue({
			el : "#listPower",
			data : {
				users:[],
				currentUser:"",
				userName : "",
				roles:[],
				roleName : "",
			},
			created : function() {
				this.listUser();
				this.listRole();
			},
			methods : {
				//清除
				clear : function(elementId,info){
					var $element = $(elementId);
					if(info){
						$element.html(info);
					}else{
						$element.html("");
					}
				},
				//获得用户数据
				listUser : function() {
					var _this = this;  
					$.ajax({
						url : basePath + "/power/listUser",
						dataType : "json",
						data : {
							str1 : _this.userName,
						},
						success : function(json) {
							if (json.code == 200) {
								if(json.data.users.length==0){
									_this.clear("#userTree","没有用户");
									return ;
								};
								var data = [];
								_this.users = data;
								data.push({
									id : 1,
									pId : -1,
									name : "用户",
									nocheck : true,
									open : true,
								});
								$.each(json.data.types, function(index, obj) {
									//如果这个类型下没有子内容，则不显示
									$.each(json.data.users, function(index2, user) {
										if(user.type==obj[0]){
											data.push({
												id : obj[0],
												pId : 1,
												name : obj[1],
												nocheck : true,
												open : true,
											});
											return false;
										}
									});
								});
								$.each(json.data.users, function(index, user) {
									data.push({
										id : user.userId,
										pId : user.type,
										name : user.name,
										user:user
									});
								});
								_this.initUserTree(data);
							} else {
								alert("用户树初始化失败")
							}

						}
					})
				},
				//初始化用户树
				initUserTree : function(data) {
					var _this = this;
					_this.clear("#userTree");
					var setting = {
						check : {
							enable : true
						},
						data : {
							simpleData : {
								enable : true,
							},
						},
						callback : {
							//用户点击事件,获取关联的角色
							onClick : function(event, treeId, treeNode) {
								_this.currentUser = treeNode.user;
								$.ajax({
									url:basePath+"/power/relationRole",
									dataType:"json",
									data:{
										uuid:_this.currentUser.userId,
									},  
									success:function(json){
										if(json.code==200){
											_this.allUnCheck(_this.roles);
											$.each(json.data.list,function(index,userRole){
												$.each(_this.roles,function(index2,role){
													if(userRole.roleId==role.id){
														role.checked = true;
														return true;
													}
												})
											});
											_this.initRoleTree(_this.roles);
										}else{
											alert("获取关联角色失败")
										}
									}
								})
							}
						},
					};
					$.fn.zTree.init($("#userTree"), setting, data);
				},
				//删除用户
				deleteUser : function(){
					if(this.currentUser){
						alertMsg.confirm("确定要删除吗",function(){
							alert("我差了")
						})
					}else{
						alertMsg.error("请选择已个人员");
					}
				},
				//获得角色数据
				listRole : function() {
					var _this = this;
					$.ajax({
						url : basePath + "/power/listRole",
						dataType : "json",
						data : {
							str1 : _this.roleName
						},
						success : function(json) {
							if (json.code == 200) {
								var data = [];
								 _this.roles = data;
								data.push({
									id : 1,
									pId : -1,
									name : "角色",
									open : true,
									nocheck : true
								});
								$.each(json.data.roles, function(index, role) {
									data.push({
										id : role.roleId,
										pId : 1,
										name : role.name,
										role : role,
									})
								});
								_this.initRoleTree(data);
							} else {
								alert("角色列表初始化失败")
							}
						}
					})
				},
				//初始化角色树
				initRoleTree : function(data) {
					var _this = this;
					_this.clear("#roleTree");
					var setting = {
						data : {
							simpleData : {
								enable : true,
							}
						},
						check : {
							enable : true
						},
						callback : {
							onClick : function() {
							}
						},
					};
					$.fn.zTree.init($("#roleTree"), setting, data);
				},
				//保存按钮事件
				save : function(){
					var _this = this;
					//带回勾选的userid
					var userIds=_this.checkedIds("userTree");
					//带回勾选的roleid
					var roleIds=_this.checkedIds("roleTree");
					$.ajax({
						url:basePath+"/power/save",
						dataType:"json",
						data:{
							userIds:userIds,
							roleIds:roleIds,
						},
						success:function(json){
							if(json.code==200){
								alertMsg.success("保存成功");
							}else{
								alertMsg.error("保存失败");
							}
						}
					});
				},
				//获得对应ztree被选中的Id,treeId不需要#号
				checkedIds : function(treeId){
					var checkNodes = $.fn.zTree.getZTreeObj(treeId).getCheckedNodes(true);
					var ids = "";
					$.each(checkNodes,function(index,node){
						if(ids.length>0){
							ids+=",";
						}
						ids+=node.id;
					})
					return ids;
				},
				//搜索
				search : function(){
					this.listUser();
				},
				//去掉所有勾选
				allUnCheck : function(array){
					$.each(array,function(index,item){
						item.checked = false;
					})
				},

			}
		})

	})
</script>
<body >  
<div id="listPower">
		<div class="seachBar row" style="height: 50px; padding-left: 20px;margin-top: 5px;">
			<form class="form-inline">
				<div class="form-group">
				 <input type="str1" class="form-control" placeholder="用户名称" :value="userName" v-model="userName">
				</div>
				<div class="form-group">
					<input type="str2" class="form-control" placeholder="角色名称">
				</div>
				<button type="button" class="btn btn-primary" @click="search()">查询</button>
				<button type="button" class="btn btn-primary" @click="save()">保存</button>
			</form>
		</div>  
	<div class="row">
		<div class="col-xs-3" style="border: solid 1px; height: 100%; padding: 1px 20px;">
			<div class="btn row">
				<button class="btn btn-success" type="button">添加</button>
				<button class="btn btn-info" type="button">修改</button>
				<button class="btn btn-danger" type="button" @click="deleteUser()">删除</button>
			</div>
			<div class="ztree" id="userTree"></div>		
		</div>

		<div class="col-xs-3" style="border: solid 1px; height: 100%">
			<div class="btn row">
				<button class="btn btn-success" type="button">添加</button>
				<button class="btn btn-info" type="button">修改</button>
				<button class="btn btn-danger" type="button">删除</button>
			</div>
			<div class="ztree" id="roleTree"></div>	
		</div>

		<div class="col-xs-3 ztree" id="moduleTree"
			style="border: solid 1px; height: 100%"></div>

		<div class="col-xs-3 ztree" style="border: solid 1px; height: 100%"></div>


	</div></div>
</body>
</html>