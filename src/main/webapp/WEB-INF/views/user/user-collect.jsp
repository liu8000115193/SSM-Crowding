<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
<title>我的收藏</title>
<link type="text/css" rel="stylesheet" href="<%=basePath%>/css/user.css">
<link type="text/css" rel="stylesheet" href="<%=basePath%>/css/public.css">
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
          <span class="nav_r1 fl"><a href="/toContractProject">发起项目</a></span>
          <span class="nav_r2 fl"><a href="/to_helpUtil">新手帮助</a></span>
        </span>
    </nav>
  </div>
<!--头部 结束-->
<!--主体部分-->
<div class="main clearfix">
<!--我的众筹导航-->
    <div class="user_nav fl">
        <a class="data" href="user.html">
            <img  width="100" height="100" src="<%=basePath%>/images/${user.headimg}"/>
            <span>${user.fname}</span>
        </a>
        <ul class="list">
            <li class="my_address"><a href="/userAddress/${user.id}">收货地址</a></li>
            <li class="my_account"><a href="/userAccount/${user.id}">账户余额</a></li>
            <li class="my_project"><a href="/userProject/${user.id}">我的项目</a></li>
            <li class="my_profit"><a href="/userProfit/${user.id}">我的收益</a></li>
            <li class="my_support"><a href="/userSupport/${user.id}">我的支持</a></li>
            <li class="my_collect"><a href="/userCollect/${user.id}">我的收藏</a></li>
        </ul>
        <div class="user_nav_bubai"></div>
    </div>
    <div class="user_content fr">
        <header>我的收藏</header>
        <div class="user_main">
        <!--我的收藏--> 
    
            <ul class="project_content" style="display:block;">
                <li class="project_content_nav">
                    <ul class="clearfix">
	                    <li style="width:40%;">项目信息</li>
	                    <li>已筹金额</li>
	                    <li>支持人数</li>
	                    <li>收藏人数</li>
	                    <li>操作</li>
                    </ul>
                </li>
                <c:forEach items="${collect }" var="col">
                <li class="project_list">
                    <ul class="clearfix">
                    	<li class="project_list_xinxi"><img src="<%=basePath%>/images/${col.image}"/></li>
                    	<li class="project_list_xinxi">
	                    	<p class="project_list_xinxi_name">${col.name }</p>
	                    	<p>&nbsp;</p>
	                    	<p>剩余时间<time>${col.deadline }</time></p>
                    	</li>
                    	<li class="project_list_text price">${col.supmoney }<b>￥</b></li>
                    	<li class="project_list_text"><b>${col.numsup }</b>人</li>
                    	<li class="project_list_text"><b>${col.numcol }</b>人</li>
                    	<li class="project_list_text profit_caozuo">
                    		<a href="/detailProject?id=${col.id }">去支持</a>
                    		<p class="procollect">取消收藏<input type="hidden" value="${col.id }"/></p>
                    	</li>
                    </ul>
                </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>    

<!--尾部start-->
<div class="footer">
    <jsp:include page="/WEB-INF/views/page/footer.jsp"></jsp:include>
</div>
<!--尾部end-->

<script type="text/javascript" src="<%=basePath%>/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/user.js"></script>
<script type="text/javascript">
//取消收藏
$(document).ready(function(){
	$(".procollect").click(function(){
		var obj=$(this);
   	 	var id=obj.children("input").val();
   	 	var text=obj.text();
   	 	var num=obj.parent().prev().children().text();
  		if(text=="取消收藏"){
	   	 	$.ajax({
				type : "post", //使用post方法访问后台  
				dataType : "text", //返回text格式的数据  
				url : "/user/disCollect", //要访问的后台地址
				contentType : "application/x-www-form-urlencoded",
				data : {
					id:id
				}, //要发送的数据  
				success : function(data) { //data为返回的数据，在这里做数据绑定
					if (data == "true"){
						num=num-1
						obj.parent().prev().html("<b>"+num+"</b>人")
						obj.html("收藏<input type='hidden' value='"+id+"'/>")
						alert(obj.parent().prev().children().text())
					} else {
						alert("取消收藏失败！")
					}
				},
				error : function() {
					alert("连接服务器失败！");
				}
			});
  		}else if(text=="收藏"){
  			$.ajax({
				type : "post", //使用post方法访问后台  
				dataType : "text", //返回text格式的数据  
				url : "mycollect/addcollectCollect", //要访问的后台地址
				contentType : "application/x-www-form-urlencoded",
				data : {
					id:id
				}, //要发送的数据  
				success : function(data) { //data为返回的数据，在这里做数据绑定
					if (data == "true") {				
						num=num*1+1;
						obj.parent().prev().html("<b>"+num+"</b>人");
						obj.html("取消收藏<input type='hidden' value='"+id+"'/>");
					} else {
						alert("收藏失败！")
					}
				},
				error : function() {
					alert("连接服务器失败！");
				}
			});
  		}
    	})
   	
})
</script>
</body>
</html>
