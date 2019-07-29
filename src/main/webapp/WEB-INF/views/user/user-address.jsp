<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
<title>收货地址</title>
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
        <header>收货地址</header>
        <div class="user_main">
            <ul class="address_content">
              <c:forEach items="${listAddress}" var="a">
                <li class="address2">&nbsp;&nbsp;-
                    &nbsp;${a.province}
                    &nbsp;&nbsp;${a.city}
                    &nbsp;&nbsp;${a.county}
                    &nbsp;&nbsp;${a.telephone}
                    &nbsp;&nbsp;${a.consignee}
                    &nbsp;&nbsp;${a.postcard}
                  <div class="address_setup fr clearfix" style="display:none;">
                  <p class="address_default fl"><a href="/deafultAddress/${user.id}/${a.id}">[设为默认地址]</a></p>
                  <p class="address_modify fl" id="modify">&nbsp;修改<input type="hidden" value="${a.id}"></p>
                  <p class="address_delete fl">&nbsp;<a href="/delAddress/${user.id}/${a.id}">删除</a></p>
                  </div>
                  </li>
              </c:forEach>
            </ul>
            <input class="input_button_yes address_add" type="button" value="+添加新地址"/>
        </div>
    </div>
</div>

<!-- 添加地址 -->
<div class="bomb bomb_address_wrapper" style="display:none;">
    <div class="bomb_address clearfix">
        <div class="bomb_title clearfix">
            <p class="fl">添加新地址</p>
            <span class="close fr"></span>
        </div>
        <form action="/addAddress" method="post">
            <p>&nbsp;收货人：<input type="text" name="consignee"/></p>
            <p><input type="hidden" name="userid" value="${user.id}"/></p>
            <P>手机号码：<input type="tel" maxlength="11" name="telephone"/></P>
            <p>邮政编码：<input type="text" maxlength="6" name="postcard"/></p>
            <p>&nbsp;&nbsp;地区： <select id="s_province" name="province"></select>
                <select id="s_city" name="city" ></select>
                <select id="s_county" name="county"></select>
            <p>详细地址：<input class="bomb_address_more" type="text" name="detailaddress"/></p>
      
        <div class="bomb_button fr">
            <input class="input_button_yes" type="submit" value="确认"/>
            <input class="input_button_no" type="button" value="取消"/>
        </div>
        </form>
    </div>
</div>
<!--修改地址-->
<div class="bomb bom_address_wrapper" style="display:none;">
    <div class="bomb_address clearfix">
        <div class="bomb_title clearfix">
            <p class="fl">修改地址</p>
            <span class="close fr"></span>
        </div>
        <form action="/updateAddress" method="post">
        	<p class="1"><input type="hidden" name="id"/></p>
            <p><input type="hidden" name="userid" value="user.id"/></p>
            <p class="2">&nbsp;收货人：<input type="text" name="consignee"/></p>
            <P class="3">手机号码：<input type="tel" maxlength="11" name="telephone"/></P>
            <p class="4">邮政编码：<input type="text" maxlength="6" name="postcard"/></p>
            <p class="5">&nbsp;&nbsp;地区：<select id="s_province1" name="s_province"></select>
                <select id="s_city1" name="s_city" ></select>
                <select id="s_county1" name="s_county"></select>
            <p class="6">详细地址：<input class="bomb_address_more" type="text" name="detailaddress"/></p>
      
        <div class="bomb_button fr">
            <input class="input_button_yes" type="submit" value="确认"/>
            <input class="input_button_no" type="button" value="取消"/>
        </div>
        </form>
    </div>
</div>


<!--尾部start-->
<div class="footer">
    <jsp:include page="/WEB-INF/views/page/footer.jsp"></jsp:include>
</div>
<!--尾部end-->

<script type="text/javascript" src="<%=basePath%>/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/user.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/area.js"></script>
<script type="text/javascript">_init_area();</script>
<script type="text/javascript">_init_area1();</script>
<script type="text/javascript">
</script>
</body>
</html>

