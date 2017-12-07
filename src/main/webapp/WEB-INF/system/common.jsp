<%--标签 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" isELIgnored="false" session="false" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="edge" />
<%--ctxPath--%>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<%--项目路径 --%>
<c:set var="path" value="${ctxPath}" />
<%--静态文件目录 --%>
<c:set var="staticPath" value="${ctxPath}" />

<!-- jQuery 3 -->
<script src="${staticPath }/static/utilJs/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="${staticPath }/static/lte/bower_components/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
//   $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.7 -->
<script src="${staticPath }/static/lte/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- Morris.js charts -->
<script src="${staticPath }/static/lte/bower_components/raphael/raphael.min.js"></script>
<script src="${staticPath }/static/lte/bower_components/morris.js/morris.min.js"></script>
<!-- Sparkline -->
<script src="${staticPath }/static/lte/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="${staticPath }/static/lte/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="${staticPath }/static/lte/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="${staticPath }/static/lte/bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="${staticPath }/static/lte/bower_components/moment/min/moment.min.js"></script>
<script src="${staticPath }/static/lte/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script src="${staticPath }/static/lte/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="${staticPath }/static/lte/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="${staticPath }/static/lte/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="${staticPath }/static/lte/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${staticPath }/static/lte/dist/js/adminlte.min.js"></script>
 <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="${staticPath }/static/lte/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->    
  <link rel="stylesheet" href="${staticPath }/static/lte/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="${staticPath }/static/lte/bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${staticPath }/static/lte/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="${staticPath }/static/lte/dist/css/skins/_all-skins.min.css">
  <!-- Morris chart -->
  <link rel="stylesheet" href="${staticPath }/static/lte/bower_components/morris.js/morris.css">
  <!-- jvectormap -->
  <link rel="stylesheet" href="${staticPath }/static/lte/bower_components/jvectormap/jquery-jvectormap.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="${staticPath }/static/lte/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="${staticPath }/static/lte/bower_components/bootstrap-daterangepicker/daterangepicker.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="${staticPath }/static/lte/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">

<script src="${staticPath }/static/utilJs/vue.js"></script>
<script src="${staticPath }/static/utilJs/vue-resource.js"></script>
<link rel="stylesheet" href="${staticPath }/static/ztree/css/zTreeStyle.css"/>
<script src="${staticPath }/static/ztree/js/jquery.ztree.all.js"></script>

<script type="text/javascript">
    var basePath = "${staticPath }";
</script>
<%@ include file="alert.jsp" %>


