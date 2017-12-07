<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">  
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Modal title</h4>
      </div>
      <div class="modal-body" id="myModalMessage">
        <p>One fine body&hellip;</p>
      </div>   
      <div class="modal-footer">
       <button id="confrimBtn" type="button" class="btn btn-success" data-dismiss="modal" onclick="confrimBtn()">确定</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

  
<script type="text/javascript">
	var alertMsg = {
		show:function(message){
			$("#myModal").modal('show');
			$("#myModalMessage").html(message);
			$("#confrimBtn").hide();
		},
		success : function(message) {
			$("#myModalLabel").html('<font color="#3D763D">提示<font>');
			this.show(message);
		},
		error : function(message){
			$("#myModalLabel").html('<font color="red">提示<font>');
			this.show(message);
		},
		confirm : function(message,method){
			this.callback = method;
			$("#myModalLabel").html('<font color="red">确认提示<font>');
			this.show(message);
			$("#confrimBtn").show();
		},
		callback:"",
	}
	
	function confrimBtn(){
		alertMsg.callback();
		alertMsg.callback="";
	}
	
</script>