$(document).ready(function () {
	$('#tt').datagrid({ 
	    url:ctx+'/rygl/ryZcxx/query', 
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
		title : "新增职称信息",
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
		title : "修改职称信息",
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
			$.post(ctx+"/rygl/ryZcxx/delete", {ids : ids.join('&') }, function(result) {
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
		varUrl = ctx+'/rygl/ryZcxx/insert';
	}else{
		varUrl = ctx+'/rygl/ryZcxx/update';
	}
	
	var formData = $("#dialogForm").serializeObject();
	
	//表单验证
	if($.trim(formData.zc)==""){
		fdp.utils.alertWarn("【职称】不能为空，请填写！");
		return false;
	}
	if($.trim(formData.pzwh)==""){
		fdp.utils.alertWarn("【批准文号】不能为空，请填写！");
		return false;
	}
	if($.trim(formData.kssj)==""){
		fdp.utils.alertWarn("【开始时间】不能为空，请填写！");
		return false;
	}
	
	if($.trim(formData.pzsj)==""){
		fdp.utils.alertWarn("【批准时间】不能为空，请填写！");
		return false;
	}
	if($.trim(formData.jssj)==""){
		fdp.utils.alertWarn("【结束时间】不能为空，请填写！");
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
