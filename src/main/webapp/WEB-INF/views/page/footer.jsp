<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>尾部</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/public.css" />
</head>
<body>
     <div class="footer_auto auto clearfix">
       <div class="footer_a1 fl">
         <div class="footer_p pt50">
           <span class="footer_process1 w150br30">发起人创建项目</span>
           <span class="footer_process">></span>
           <span class="footer_process2 w150br30">项目获得支持</span>
           <span class="footer_process">></span>
           <span class="footer_process3 w150br30">发起人发放回报</span>
           <span class="footer_process">></span>
           <span class="footer_process4 w150br30">用户得到回报</span>
         </div>
         <ul>
           <li><a href="util/to_helpUtil">关于我们</a></li>
           <li><a href="util/to_help_serviceUtil">服务条款</a></li>
           <li><a href="util/to_help_courseUtil">项目教程</a></li>
           <li><a href="util/to_helpUtil">新手帮助</a></li>
           <li><a href="util/to_help_problemUtil">常见问题</a></li>
           <li class="border_none"><a href="util/to_help_ruleUtil">意见反馈</a></li>
         </ul>
       </div>
       <div class="footer_a2 fl">
         <p class="footer_ewm">微信公众号</p>
         <img src="<%=basePath%>/images/foot_ewm_05.png" alt="">
       </div>
       <div class="footer_a3 fr">
         <p class="footer_inform0"><span>联系我们（9:00 － 18:00）</span></p>
         <p class="footer_inform1">400-000-0000</p>
         <p class="footer_inform2">wuxiandao@zhongchou.com</p>
         <p class="footer_inform0">qq群：123456789</p>
       </div>
    </div>
    <div class="footer_bottom">©版权所有</div>
</body>
</html>