$(document).ready(function () {
	$('#tt').datagrid({ 
	    url:ctx+'/pxgl/pxglGnjxgl/query', 
	    queryParams : $("#queryForm").serializeObject(),
	    idField:'id', 
	    rownumbers:true,
		pagination:true
	});
});

function query(){
	$('#tt').datagrid("reload",$("#queryForm").serializeObject());
}

/**
 * 新增
 */
function add(){
	$("#dialog #dialogForm")[0].reset();
	$("#dialog #dialogForm #id").val(null);
	
	layer.open({
		type : 1,
		closeBtn : 1,
		title : "新增",
		maxmin : true,
		area : [ '650px', '310px' ],
		content : $('#dialog'), //这里content是一个DOM
		btn : [ '确定', '取消' ],
		btn1 : function() {
			okFunction();
		}
	});
}

/**
 * 修改
 */
function edit(){
	var rows = $("#tt").datagrid('getSelections');
	if (rows.length == 0) {
		fdp.utils.alertWarn("请选取一条数据进行操作！");
		return;
	}else if (rows.length > 1) {
		fdp.utils.alertWarn("只能选择一条数据进行操作！");
		return;
	}
	
	$("#dialog #dialogForm")[0].reset();
	$('#dialog #dialogForm').form('load',rows[0]);

	layer.open({
		type : 1,
		closeBtn : 1,
		title : "修改",
		maxmin : true,
		area : [ '650px', '310px' ],
		content : $('#dialog'), //这里content是一个DOM
		btn : [ '确定', '取消' ],
		btn1 : function() {
			okFunction();
		}
	});
}

/**
 * 删除按钮触发的事件
 */
function delete_() {
	var rows = $("#tt").datagrid('getSelections');
	if (rows.length == 0) {
		fdp.utils.alertWarn("请选取一条数据进行操作！");
		return;
	}
	
	var ids = [];
	for(var i=0;i<rows.length;i++) {
		ids.push(rows[i].id);
	}
	
	fdp.utils.confirm("确定要删除选中的数据吗?", function(r) {
		if (r) {
			$.post(ctx+"/pxgl/pxglGnjxgl/delete", {ids : ids.join('&') }, function(result) {
				if (result.success) {
					fdp.utils.alertInfo("操作成功！", function(){
						layer.closeAll();
						query();
					});
				} else {
					fdp.utils.alertError("操作失败,请联系系统管理员");
				}
			});
		}
	});		 
}

/**
 * dialog确定按钮
 */
function okFunction(){
	var varUrl = '';
	if($("#dialogForm #id").val() == ''){
		varUrl = ctx+'/pxgl/pxglGnjxgl/insert';
	}else{
		varUrl = ctx+'/pxgl/pxglGnjxgl/update';
	}
	
	var formData = $("#dialogForm").serializeObject();
	
	//表单验证
	if($.trim(formData.xm)==""){
		fdp.utils.alertWarn("【姓名】不能为空，请填写！");
		return false;
	}
	if($.trim(formData.zgbh)==""){
		fdp.utils.alertWarn("【职工编号】不能为空，请填写！");
		return false;
	}
	if($.trim(formData.ywlx)==""){
		fdp.utils.alertWarn("【业务类型】不能为空，请填写！");
		return false;
	}
	if($.trim(formData.bklb)==""){
		fdp.utils.alertWarn("【报考类别】不能为空，请填写！");
		return false;
	}if($.trim(formData.sqrq)==""){
		fdp.utils.alertWarn("【申请日期】不能为空，请填写！");
		return false;
	}
	if($.trim(formData.ksrq)==""){
		fdp.utils.alertWarn("【开始日期】不能为空，请填写！");
		return false;
	}
	if($.trim(formData.jzrq)==""){
		fdp.utils.alertWarn("【截止日期】不能为空，请填写！");
		return false;
	}
	
	$.post(varUrl,formData,function(data){
		if(data.success){
			fdp.utils.alertInfo("操作成功！",function(){
				layer.closeAll();
				query();
			});
		}else{
			fdp.utils.alertError("操作失败,请联系系统管理员！");
		}
	},"json");

}
