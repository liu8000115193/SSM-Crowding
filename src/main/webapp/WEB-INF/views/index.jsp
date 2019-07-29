<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<title>首页</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/public.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/index.css"/>
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
<!--banner开始-->
<c:forEach items="${map['image']}" var="list">
    <div class="carousel">
            <ul class="carousel_ul">

                <li>
                  <a href="/detailProject?id=${list.id}"><img class="carousel_img" src="<%=basePath%>/images/${list.image}" width="760" height="600"/></a>
                </li>

			</ul>
      <div class="carousel_left_right">
          <p class="carousel_left"></p>
          <p class="carousel_right"></p>
      </div>
      <div class="carousel_span"><span class="carousel_span_one"></span><span></span><span></span></div>
     </div>
</c:forEach>
<!--主体-->
<div class="main">
<!--免费试用-->
    <div class="free">
        <p class="main_header_bg"></p>
        <p class="main_header free_header">公&nbsp;益&nbsp;项&nbsp;目&nbsp;&nbsp;<span>Free&nbsp;&nbsp;Trial</span></p>
        <ul class="clearfix">
            <c:forEach items="${map['free']}" var="f">
            <li class="free_four fl"><a href="/detailProject?id=${f.id}">
                <p class="free_title">${f.name}</p>
                <p class="free_summary">${f.introduce}</p>
                <img class="free_img" src="<%=basePath%>/images/${f.image}" alt="${f.name}"/></a>
                <div class="free_hover"><input class="button_apply" type="button" value="立即申请" /></div>
            </li>
            </c:forEach>
        </ul>
    </div>
<!--热门推荐-->
    <div class="hot">
        <p class="main_header_bg"></p>
        <p class="main_header hot_header">热&nbsp;门&nbsp;推&nbsp;荐&nbsp;&nbsp;<span>Popular&nbsp;&nbsp;Recommendation</span></p>
        <c:forEach items="${map['host']}" var="project">
        <ul>
            <li class="hot_list">
                <img class="hot_img" src="<%=basePath%>/images/${project.image}" alt="迪奥（Dior）幽蓝魅惑五色眼影"/>
                <div class="hot_content clearfix">
                    <span class="tag_conduct hot_tag fr"></span>
                    <p class="hot_title">${project.name}</p>
                    <p class="hot_summary">${project.introduce}</p>
                    <ul class="clearfix">
                        <li class="hot_money fl">已筹集<br /><span>${project.supmoney}</span></li>
                        <li class="hot_people fl">已支持<br /><span>${project.numsup}人</span></li>
                        <li class="hot_time fl">剩余时间<br /><span>${project.dateTime}天</span></li></ul>
                    <div class="hot_bar_wrapper" id="6"><img style="width:${project.supmoney/project.needmoney*100}%;" class="hot_bar" src="<%=basePath%>/images/hot_bar.jpg"/></div>
                    <span class="hot_rate_wrapper fl"><span class="hot_rate"></span></span>
                    <span class="hot_rate_wrapper fl">达成率：<span class="hot_rate">${project.process}%</span></span>
                    <a href="/detailProject?id=${project.id}" class="hot_support fr"></a>
                </div>
            </li>
        </ul>
        </c:forEach>
    </div>
</div>

<!--尾部start-->
<div class="footer">
    <jsp:include page="/WEB-INF/views/page/footer.jsp"></jsp:include>
</div>
<!--尾部end-->
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/index.js"></script>
<script>
 var user="${user.fname}"
 <%--$(document).ready(function(){--%>
         <%--$.ajax({--%>
             <%--url:'/hostProject',--%>
             <%--type:'post',--%>
             <%--dataType:'json',--%>
         <%--error: function(result){--%>
             <%--console.log(result)--%>
             <%--alert(result.msg)--%>
         <%--},--%>
         <%--success:function(result){--%>
             <%--var jsons = result.data;--%>
             <%--console.log(result.data)--%>
             <%--for (var i=0;i<jsons.length;i++) {--%>
                 <%--var b='<img class="hot_img" src="<%=basePath%>/images/'+jsons[i].imagelist+'" alt="${project.name}"/>'--%>
                 <%--var c='<a href="detailProject?id='+jsons[i].id+'" class="hot_support fr"></a>'--%>
                 <%--// $(".hot_list").append('<div class="hot_content clearfix"><span class="tag_conduct hot_tag fr"></span>')--%>
                 <%--// $(".hot_title").append(a[i].name+"</p>")--%>
                 <%--// $(".hot_summary").append(a[i].introduce+"</p>")--%>
                 <%--// $(".clearfix").append('')--%>
                 <%--$(".hot_list").append(b+c);--%>
             <%--}--%>
         <%--},--%>
     <%--});--%>
 <%--});--%>
</script>
</body>

</html>