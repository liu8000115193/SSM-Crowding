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
   	<title>新手帮助</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/public.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/help.css" />
</head>

<body>
<!--头部start-->
<div class="header">
    <jsp:include page="/WEB-INF/views/page/top.jsp"></jsp:include>
  	<nav class="auto clearfix">
        <span class="nav_l fl">
          <span class="nav_l1 nav_l4 active"><a href="returnIndex">首页</a></span>
          <span class="nav_l2 nav_l4"><a href="scanProject">项目浏览</a></span>
          <span class="nav_l3 nav_l4"><a href="/userInformation/${user.id}">我的众筹</a></span>
        </span>
        <span class="nav_r fr">
          <span class="nav_r1 fl active"><a href="/toContractProject">发起项目</a></span>
          <span class="nav_r2 fl"><a href="/to_helpUtil">新手帮助</a></span>
        </span>
    </nav>
</div>
<!--头部 结束-->

<!--主体start-->
 <div class="main clearfix">
     <ul class="nav_help fl">
         <li class="about_us ">关于我们</li>
         <li class="course">项目教程</li>
         <li class="problem">常见问题</li>
         <li class="service">服务条款</li>
         <li class="rule help_now">项目规则</li>
     </ul>
		<div class="help_content fr" style="display: none;">关于我们</div>
		<div class="help_content fr" style="display: none;">项目教程</div>
		<div class="help_content fr" style="display: none;">常见问题</div>
		<div class="help_content fr" style="display: none;">服务条款</div>
		<div class="help_content fr" style="display: block;">项目规则</div>
</div>
<!--主体end-->
    
<!--尾部start-->
<div class="footer">
    <jsp:include page="/WEB-INF/views/page/footer.jsp"></jsp:include>
</div>
<!--尾部end-->

<script type="text/javascript" src="<%=basePath%>/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/help.js"></script>
<script>
	var user = "${sessionScope.user.getFname()}"
	if (user != null) {
		$(".lr1").hide()
		$(".zhuxiao").show();
	}
</script>
</body>
</html>