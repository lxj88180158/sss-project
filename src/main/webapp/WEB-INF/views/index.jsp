<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Dashboard</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
 

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
<!--   <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"> -->
</head>

<script type="text/javascript">
$(function(){
	new Vue({
		el:"#index",
		data:{
			modules:[],//模块数组
			currentMenu:"",//选中菜单
			currentModule:"",//选中模块
			url:"",//中间主内容链接
			
		},
		created:function(){
			this.getModule(); 
		},  
		methods:{
			//加载模块
			getModule:function(){ 
				var _this = this;
				$.ajax({
					url:basePath+"/module/getModule",
					dataType:"json",
					success:function(json){
						var list = json.data.list;
						_this.modules = list;
					}
				})
				
			},
			//选择菜单，加载主内容
			selectMenu:function(item){  
				this.currentMenu = item.moduleId;
				this.url =basePath +"/"+ item.url+"?time="+new Date().getTime();
			},
			//选择模块，展现模块下菜单
			selectModule:function(item){
				this.currentModule = item.moduleId;
			}
		},
	})
})

</script>

<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper" id="index">
  <header class="main-header">
    <!-- Logo -->
    <a href="index2.html" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>A</b>LT</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Admin</b>LTE</span>
    </a>
    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>

      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          <li class="dropdown messages-menu" >
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-envelope-o"></i> 
              <span class="label label-success">4</span>
            </a>
            
            <ul class="dropdown-menu">
              <li class="header">You have 4 messages</li>
              <li>   
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  <li><!-- start message -->
                    <a href="#">
                      <div class="pull-left">
                        <img src="${staticPath }/static/lte/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        Support Team
                        <small><i class="fa fa-clock-o"></i> 5 mins</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <!-- end message -->
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="${staticPath }/static/lte/dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        AdminLTE Design Team
                        <small><i class="fa fa-clock-o"></i> 2 hours</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="${staticPath }/static/lte/dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        Developers
                        <small><i class="fa fa-clock-o"></i> Today</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="${staticPath }/static/lte/dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        Sales Department
                        <small><i class="fa fa-clock-o"></i> Yesterday</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="${staticPath }/static/lte/dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        Reviewers
                        <small><i class="fa fa-clock-o"></i> 2 days</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="footer"><a href="#">See All Messages</a></li>
            </ul>
          </li>
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="${staticPath }/static/lte/dist/img/user2-160x160.jpg" class="user-image" alt="User Image">
              <span class="hidden-xs">Alexander Pierce</span>
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="${staticPath }/static/lte/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                <p>
                  Alexander Pierce - Web Developer
                  <small>Member since Nov. 2012</small>
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#">Followers</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Sales</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Friends</a>
                  </div>
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="#" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
        </ul>
      </div>
    </nav>
  </header>
  <!-- 左侧菜单栏开始 -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
  	   <li class="treeview"  v-for="module in modules" @click="selectModule(module)" :class="{active:currentModule==module.moduleId}">
         <a  v-if="module.fatherId==null">
           <i class="fa fa-dashboard"></i> <span>{{module.name}}</span>
           <span class="pull-right-container">
             <i class="fa fa-angle-left pull-right"></i>
           </span>
         </a>    
         <ul class="treeview-menu">
           <li v-for="child in module.children" :class="{active:currentMenu==child.moduleId}" @click="selectMenu(child)"><a><i class="fa fa-circle-o"></i>{{child.name}}</a></li>
         </ul>
       </li>
     	
      	
      	
      
      
<!--         <li class="active treeview" > -->
<!--           <a href="#"> -->
<!--             <i class="fa fa-dashboard"></i> <span>Dashboard</span> -->
<!--             <span class="pull-right-container"> -->
<!--               <i class="fa fa-angle-left pull-right"></i> -->
<!--             </span> -->
<!--           </a> -->
<!--           <ul class="treeview-menu"> -->
<!--             <li class="active"><a href="index.html"><i class="fa fa-circle-o"></i> Dashboard v1</a></li> -->
<!--             <li><a href="index2.html"><i class="fa fa-circle-o"></i> Dashboard v2</a></li> -->
<!--           </ul> -->
<!--         </li> -->
<!--         <li class=" treeview"> -->
<!--           <a href="#"> -->
<!--             <i class="fa fa-files-o"></i> -->
<!--             <span>Layout Options</span> -->
<!--             <span class="pull-right-container">   -->
<!--               <span class="label label-primary pull-right">4</span> -->
<!--             </span> -->
<!--           </a> -->
<!--           <ul class="treeview-menu"> -->
<!--             <li><a href="pages/layout/top-nav.html"><i class="fa fa-circle-o"></i> Top Navigation</a></li> -->
<!--             <li><a href="pages/layout/boxed.html"><i class="fa fa-circle-o"></i> Boxed</a></li> -->
<!--             <li><a href="pages/layout/fixed.html"><i class="fa fa-circle-o"></i> Fixed</a></li> -->
<!--             <li><a href="pages/layout/collapsed-sidebar.html"><i class="fa fa-circle-o"></i> Collapsed Sidebar</a></li> -->
          
<!--           </ul>  -->
<!--         </li> -->
      </ul>
    </section>
    <!-- /.sidebar -->
  </aside>
  <!-- 左侧菜单栏结束 -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" style="height: 86%">     
	<iframe width="100%" height="100%" :src="url" id="iframe"></iframe>
  </div>
  <!-- /.content-wrapper -->
  
<!--   <footer class="main-footer"> -->
<!--     <div class="pull-right hidden-xs"> -->
<!--       <b>Version</b> 2.4.0 -->
<!--     </div> -->
<!--     <strong>Copyright &copy; 2014-2016 <a href="https://adminlte.io">Almsaeed Studio</a>.</strong> All rights -->
<!--     reserved. -->
<!--   </footer> -->
  
</div>


</body>
</html>

