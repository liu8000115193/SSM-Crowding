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
<title>我的收益</title>
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
<!--导航-->
    <div class="user_nav fl">
         <a class="data" href="myraise/informationRaise">
            <img class="head_img" width="100" height="100" src='<%=basePath%>/images/${user.headimg}'/>
            <span> ${user.fname} </span>
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
        <header>我的收益</header>
        <div class="user_main">
            <ul class="project_content" style="display:block;">
                <li class="project_content_nav">
                    <ul class="clearfix"><li style="width:40%;">项目信息</li><li>单价</li><li>当前状态</li><li>我的收益</li><li>操作</li></ul>
                </li>
                <c:forEach items="${Profit}" var="p">
                        <li class="project_list">
                            <ul class="clearfix">
                                <li class="project_list_xinxi"><img src="<%=basePath%>/images/${p.imagelist}"/></li>
                                <li class="project_list_xinxi"><p class="project_list_xinxi_name">${p.name}</p>
                                    <p>达成率${p.process}%</p>
                                    <p>剩余时间
                                        <time>${p.dateTime}天</time>
                                    </p>
                                </li>
                                <li class="project_list_text">￥${p.money}</li>
                                <li class="project_list_text">${p.statue}</li>
                                <li class="project_list_text">￥${p.oneMoney*0.05+p.secondMoney*0.03}</li>
                                <li class="project_list_text profit_caozuo"><a href="/detailProject">查看项目</a><p class="profit_details">收益详情</p></li>
                            </ul>
                            <table class="profit_details1_see" style="display:none">
                                <tr>
                                    <th>级数</th>
                                    <th>收益百分比</th>
                                    <th>单价收益</th>
                                    <th>支持人数</th>
                                    <th>单级总收益</th>
                                </tr>
                                <tr>
                                    <td>一级收益</td>
                                    <td>5%</td>
                                    <td>￥${p.money*0.05}</td>
                                    <td>${p.supportPeople}</td>
                                    <td>￥${p.oneMoney*0.05}</td>
                                </tr>
                                <tr>
                                <td>二级收益</td>
                                <td>3%</td>
                                <td>￥${p.money*0.03}</td>
                                <td>${p.secondPeople}</td>
                                <td>￥${p.secondMoney*0.03}</td>
                            </tr>
                            </table>
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

<%--<script type="text/javascript" src="<%=basePath%>/js/jquery-1.8.0.min.js"></script>--%>
<script type="text/javascript" src="<%=basePath%>/js/user.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.1.js"></script>
<script>
    $(".profit_details").click(function(){
        console.log(this)
        var a=$(this).parent('li').parent('ul').parent('li').children('table');
        if(a.is(":visible")){
            a.hide();
        }else{
            a.show();
        }
    });
    <%--function userProfit() {--%>
        <%--$.ajax({--%>
            <%--url: '/userProfit/${user.id}',--%>
            <%--type: 'post',--%>
            <%--dataType: 'json',--%>
            <%--success: function () {--%>
                <%--alert('成功');--%>
            <%--},--%>
            <%--error:function (data) {--%>
                <%--alert(data.msg)--%>
            <%--}--%>
        <%--})--%>
    <%--}--%>
	var user = "${sessionScope.user.getFname()}"
	if (user != null) {
		$(".lr1").hide()
		$(".zhuxiao").show();
	}
</script>
</body>
</html>