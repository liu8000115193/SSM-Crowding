<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link type="text/css" rel="stylesheet" href="<%=basePath%>/css/public.css">
</head>
<body>
<!--top start-->
  	<div class="top">
       <div class="topauto auto clearfix">
           <span class="top_l fl">
             <span class="mark_tl1"><a href="javascript:void(0)">无限道生态</a></span>
             <span class="mark_tl2"><a href="javascript:void(0)">添加到桌面</a></span>
           </span>
           <span class="top_r fr">
           	 <c:if test="${user.getFname() !=null}">
           	 <span class="lrall"><a href="javascript:void(0)" class="username">${user.getFname()} </a>，欢迎您</span>
             <span class="zhuxiao"><a href="loginRegister/logoutLogin">注销</a></span>
             </c:if>
             <c:if test="${user.getFname() ==null}">
<!--              <span class="pagelogin lr1"> -->
             <span class="zhuxiao"><a href="returnLogin">登陆</a></span>
             <span class="zhuxiao">
             <a href="loginRegister/register">注册</a></span>
             </c:if>
           </span>
        </div>
  	</div>
<!--top end-->
<!--logo start-->
  	<div class="logo auto clearfix">
        <span class="logoo fl mt20"><img src="<%=basePath%>/images/logo_08.png" alt="logo"></span>
        <div class="search fl mt30">
          <form action="/project/sortByInforProject" method="post" id="formScan">
           		<input id="keyword" type="text" name="keyword" placeholder="输入关键字">
           		<a href="javascript:void(0)" class="asubmitBtn"><img src="<%=basePath%>/images/mark_search_05.png" alt="搜索" /></a>
           	</form>
        </div>
        <div class="mark_group fr clearfix">
           <span class="mark_logo1 fl"><span class="mlogo_1">新品尝鲜</span><span class="mlogo_2">海量商品第一手尝鲜</span></span>
           <span class="mark_logo2 fl"><span class="mlogo_1">全额退款</span><span class="mlogo_2">未达成目标全额退款</span></span>
           <span class="mark_logo3 fl"><span class="mlogo_1">全国包邮</span><span class="mlogo_2">部分产品港澳台除外</span></span>
        </div>
    </div>
<!--logo end-->

<script type="text/javascript" src="<%=basePath%>/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/user.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/scanproj.js"></script>
<script type="text/javascript">
</script>
</body>
</html>