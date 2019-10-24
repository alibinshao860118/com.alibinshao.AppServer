<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" >
<title>01</title>
<link href="../css/comon.css" rel="stylesheet" type="text/css" />
<link href="../css/index_green.css" rel="stylesheet" type="text/css" />
<link href="../css/font.css" rel="stylesheet" type="text/css" />
<link href="../css/tab_css.css" rel="stylesheet" type="text/css" />

<SCRIPT language=JavaScript src="../js/jquery.js"></SCRIPT>
<SCRIPT language=JavaScript src="../js/js.js"></SCRIPT>
<script src="../js/Njs.js" type="text/jscript"></script>
<script language=JavaScript >
	$(document).ready(function (){
		if(<%=application.getAttribute("tjzt")%>==1){
			clikcMenu("table01/P07.html","清缴税款");
			<%System.out.println("进入:"+application.getAttribute("tjzt"));%>
		}else{
		<%System.out.println("未进入:"+application.getAttribute("tjzt"));%>
		}
	})
    var index = 1;
	function clikcMenu(url,tabTitle){
		//document.getElementById("workingFrame").src = url;		
		$(this).parent("div").parent("li").parent("li").siblings().children("ul").children("li").children("div").slideUp();
		
		//alert($("#tablis")[0].tagName);
		$("#tablis").children().removeClass("unlike");
		//alert($("#tablis").children("li:last-child").html());
		var liID = "tabli"+index;
		$("#tablis").children("li:last-child").after("<li class='unlike' id="+liID+" ><span class='tabClick' style='cursor:default'>"+tabTitle+"</span><span class='close' >×</span></li>");
		
		$("#divTabs").children().css('display','none');
		var divID = 'divFrame'+index;
		var iframeID = 'workingFrame'+index;
		$("#divTabs").children("div:last-child").after('<div id='+divID+'><table width="100%" border="0" cellspacing="0" cellpadding="0">'
        +'<tr>'
        +'<td>'
        +'<iframe src="'+url+'" frameborder="none" class="iframe1" style="width:100%;" name="workingFrame" id="'+iframeID+'" ></iframe>'
        +'</td>'
        +'</tr>'
        +'</table></div>');
	
		$("#"+iframeID).css({height:$(window).height()-85});
		index++;
		
	}

</script>
</head>
<body class="body2">

<div class="header">
    <div class="head_logo"></div>
    <div class="head_left_btn"><i class="fa fa-bars"></i></div>
    <div class="head_new"><i class="fa fa-bell-o"></i>待办<div class="head_num">5</div></div>
    <div class="head_new"><i class="fa fa-envelope-o"></i>信息</div>
    <div class="head_yong"><span><i></i>青春版</span></div>
    <div class="head_setting">
   	 <i class="fa fa-cogs"></i>
    </div>

    <div class="head_name">广州生物化工科技有限公司</div>
</div>


</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="left_box" valign="top">
    <div class="left_menu">
        <ul>
            <li>
                    <h3><i class="fa fa-desktop"></i><a href="#">办税桌面</a></h3>
                </li>
           <li>
                <h3><i class="fa fa-envelope-o"></i><a href="#">待办提醒</a></h3>
                <ul>
                <h4><i class="fa fa-caret-left"></i><a href="#">待办提醒</a></h4>
                <li><i class="fa fa-microphone"></i><a href="#">内部通知公告</a></li>
                <li><i class="fa fa-microphone"></i><a href="#">待办提醒</a></li>
                <li><i class="fa fa-microphone"></i><a href="#">涉税审批状态跟踪</a></li>
            </ul>
            </li>
            
            <li>
                <h3><i class="fa fa-file-movie-o"></i><a href="#">业务办理</a><div class="left_dot"></div></h3>
                <ul>
                <h4><i class="fa fa-caret-left"></i><a href="#">业务办理</a></h4>
                <li><i class="fa fa-microphone"></i><a href="#">涉税事项办理</a><span class="left_num">4</span>
                    <div>
                        <a href="#">预约服务</a>
                        <a href="#">预约在线受理</a>
                        <a href="#">涉税办理</a>
                        <a href="#">业务事项审批流转</a>
                        <a href="#">综合事项流转</a>
                        <a href="#">税务百度（税务人端）</a>
                        <a href="#">证明开具</a>
                        <a href="#">备案处理</a>
                    </div>
                </li>
                <li><i class="fa fa-microphone"></i><a href="#">中介及机构管理</a>
                    <div>
                        <a href="#">中介及机构登记</a>
                        <a href="#">中介及机构报备处理</a>
                        <a href="#">中介及机构信用数据</a>
                        <a href="#">中介及机构评估</a>
                    </div>
                </li>
                <li><i class="fa fa-microphone"></i><a href="#">申报征收</a>
                    <div>
                        <a href="#" onClick=clikcMenu("table01/01.jsp","应申报清册")>应申报清册</a>						
						<a href="#" onClick=clikcMenu("table01/01.html","申报表作废")>申报作废</a>
						<a href="#" onClick=clikcMenu("table01/01.html","申报更正")>申报更正</a>
						<a href="#" onClick=clikcMenu("table01/P07.html","清缴税款")>清缴税款</a>
						<a href="#" onClick=clikcMenu("table01/P06.jsp","申报结果查询")>申报结果查询</a>
						<a href="#" onClick=clikcMenu("table01/P10.html","缴税情况查询")>缴税情况查询</a>
                        <a href="#" onClick=clikcMenu("table01/01.html","电子鉴证报告")>电子鉴证报告</a>                       
                    </div>
                </li>
                <li><i class="fa fa-microphone"></i><a href="#">发票管理</a>
                    <div>
                        <a href="#">网络发票 (未达起征点纳税人)</a>
                        <a href="#">发票代开管理</a>
                        <a href="#">发票领用管理</a>
                        <a href="#">发票验旧管理</a>
                        <a href="#">领购方式管理</a>
                        <a href="#">移动开票端管理</a>
                        <a href="#">发票摇奖管理</a>
                    </div>
                </li>
                <li><i class="fa fa-microphone"></i><a href="#">稽查及欠税追讨</a></li>
            </ul>
            </li>
            
            
            <li>
                <h3><i class="fa fa-edit"></i><a href="#">服务管理</a></h3>
                <ul>
                <h4><i class="fa fa-caret-left"></i><a href="#">服务管理</a></h4>
                <li><i class="fa fa-microphone"></i><a href="#">税务学堂管理</a></li>
                <li><i class="fa fa-microphone"></i><a href="#">电子文书验证管理</a></li>
                <li><i class="fa fa-microphone"></i><a href="#">社会协作管理</a>
                <div>
                        <a href="#">众包互助管理</a>
                        <a href="#">创意空间管理</a>
                        <a href="#">应用广场管理</a>
                    </div>
                </li>
                <li><i class="fa fa-microphone"></i><a href="#">电子印章管理</a></li>
                <li><i class="fa fa-microphone"></i><a href="#">智能咨询管理</a></li>
                <li><i class="fa fa-microphone"></i><a href="#">涉税云平台管理</a></li>
                <li><i class="fa fa-microphone"></i><a href="#">信息服务</a>
                <div>
                        <a href="#">通知通告</a>
                        <a href="#">推送设置</a>
                        <a href="#">提醒服务</a>
                        <a href="#">消息订阅</a>
                        <a href="#">涉税业务办理帮助</a>
                        <a href="#">资讯发布</a>
                        <a href="#">宣传及评估处理</a>
                       
                    </div>
                </li>
                <li><i class="fa fa-microphone"></i><a href="#">知识库管理</a></li>
                
            </ul>
            </li>
            
            <li>
                <h3><i class="fa fa-suitcase"></i><a href="#">纳税人关系管理</a></h3>
                <ul>
                <h4><i class="fa fa-caret-left"></i><a href="#">纳税人关系管理</a></h4>
                <li><i class="fa fa-microphone"></i><a href="#">账户管理</a></li>
                <li><i class="fa fa-microphone"></i><a href="#">服务管理</a></li>
                <li><i class="fa fa-microphone"></i><a href="#">接触行为管理</a></li>
                <li><i class="fa fa-microphone"></i><a href="#">信用等级及动态信息</a></li>
                <li><i class="fa fa-microphone"></i><a href="#">互动业务管理</a>
                    <div>
                        <a href="#">即时沟通</a>
                        <a href="#">投诉申诉处理</a>
                        <a href="#">涉税举报跟踪</a>
                        <a href="#">法律救济处理</a>
                        <a href="#">满意度调查及数据处理</a>
                        <a href="#">信用等级管理</a>
                    </div>
                </li>
            </ul>
            </li>
            
            <li>
                <h3><i class="fa fa-pie-chart"></i><a href="#">数据利用</a></h3>
                <ul>
                <h4><i class="fa fa-caret-left"></i><a href="#">数据利用</a></h4>
                <li><i class="fa fa-heart"></i><a href="#">纳税评估数据处理</a></li>
                <li><i class="fa fa-heart"></i><a href="#">涉税大数据利用</a>
                    <div>
                        <a href="#">数据采集</a>
                        <a href="#">情报搜集与分析</a>
                        <a href="#">数据资源整合</a>
                        <a href="#">舆情收集与分析</a>
                    </div>
                </li>
            </ul>
            </li>
            
             <li>
                <h3><i class="fa fa-pie-chart"></i><a href="#">关联系统</a></h3>
                <ul>
                <h4><i class="fa fa-caret-left"></i><a href="#">关联系统</a></h4>
                <li><i class="fa fa-heart"></i><a href="#">电子文档系统</a></li>
              
            </ul>
            </li>
            
              <li>
                <h3><i class="fa fa-pie-chart"></i><a href="#">系统管理</a></h3>
                <ul>
                <h4><i class="fa fa-caret-left"></i><a href="#">系统管理</a></h4>
                <li><i class="fa fa-heart"></i><a href="#">电子文档系统</a></li>
                <li><i class="fa fa-heart"></i><a href="#">系统参数配置</a></li>
                <li><i class="fa fa-heart"></i><a href="#">系统监控</a></li>
                <li><i class="fa fa-heart"></i><a href="#">菜单管理</a></li>
                <li><i class="fa fa-heart"></i><a href="#">安全管理</a></li>
                <li><i class="fa fa-heart"></i><a href="#">日志管理</a></li>
                <li><i class="fa fa-heart"></i><a href="#">监管流程定义及查询</a></li>
                <li><i class="fa fa-heart"></i><a href="#">督办及监控数据处理</a></li>
            </ul>
            </li>
            
        </ul>
</div>
    </td>
    <td class="right_box" valign="top">
   <div class="tabs">
       <ul id="tablis">
       <li id="liID0"><span class="tabClick" style="cursor:default">办税桌面</span><span class="close" >×</span></li>
       <!-- 
       <li ><span onClick="onXtgl();">系统管理</span><span class="close">×</span></li>
       <li>办税桌面<span class="close">×</span></li>
       <li class="unlike">当前样式<span class="close">×</span></li>   
        -->
   </ul>
   </div> 
 <div id="divTabs">
 <div id="divFrame0">
<table width="100%" border="0" cellspacing="12" cellpadding="0">
  <tr>
    <td>
    <iframe src="table01/bszm.html" frameborder="none" class="iframe1" style="width:100%;" name="workingFrame0" id="workingFrame0" ></iframe>
    </td>
  </tr>
</table>
</div>
</div>
    </td>
    
    <td class="right_box2" valign="top" width="100">
    <div class="right_icons">
    <ul>
       <li><a href="#"><img src="../images/icons_01.png"><span>信息反馈</span></a></li>
       <li><a href="#"><img src="../images/icons_02.png"><span>报表报送</span></a></li>
       <li><a href="#"><img src="../images/icons_03.png"><span>简易处罚</span></a></li>
       <li><a href="#"><img src="../images/icons_04.png"><span>满意调查</span></a></li>
       <li><a href="#"><img src="../images/icons_05.png"><span>文书验证</span></a></li>
  
    </ul>
    </div>
    
    </td>
    
    <!--<td class="right_box2" valign="top">
    <div class="right_icons">
    <ul>
       <li><a href="#"><img src="../images/icons_01.png"><span>信息反馈</span></a>
      
       
       </li>
       <li><a href="#"><img src="../images/icons_02.png"><span>报表报送</span></a>
       
       </li>
       <li><a href="#"><img src="../images/icons_03.png"><span>简易处罚</span></a>
       
       </li>
       <li><a href="#"><img src="../images/icons_04.png"><span>满意调查</span></a>
        
       </li>
       <li><a href="#"><img src="../images/icons_05.png"><span>文书验证</span></a>
       
       </li>
  
    </ul>
    </div>
    
    </td>-->
  </tr>
</table>
<!--<div class="foot">
    <ul>
        <li><i class="fa fa-thumbs-down"></i><span>附近办税地点</span></li>
        <li><i class="fa fa-graduation-cap"></i><span>附近办税地点</span></li>
        <li><i class="fa fa-futbol-o"></i><span>附近办税地点</span></li>
        <li><i class="fa fa-fax"></i><span>附近办税地点</span></li>
    </ul>
</div>-->
</body>
</html>