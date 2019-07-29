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
	<title>账户余额</title>
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
         <a class="data" href="/userInformation/${user.id}">
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
        <header>账户余额</header>

        <div class="user_main">
            <div class="account_now">您的当前账户余额为：
                <c:if test="${account.size()==0}">
                <span>0</span>元<input class="input_button_yes tixian" type="button" value="提现"/></div>
                </c:if>
            <c:if test="${account.size()>0}">
            <span>${balance.get(0).balance}</span>元<input class="input_button_yes tixian" type="button" value="提现"/></div>
            </c:if>


            <table class="account_content">
                <tr>
                    <th>时间</th><th>操作</th><th>金额</th><th>余额</th>
                </tr>
                <c:forEach items="${account}" var="account">
                <tr>
                    <td><time>${account.ctime}</time></td><td>提现</td><td>-${account.paymoney}</td><td>${account.balance}</td>
                </tr>
                </c:forEach>
            </table>

        </div>

    </div>
</div>
<div class="bomb bomb_account_wrapper" style="display:none;">
    <div class="bomb_address clearfix">
        <div class="bomb_title clearfix">
            <p class="fl">添加新地址</p>
            <span class="close fr"></span>
        </div>
        <form action="/withdrawMoney" method="post">
            <input type="hidden"  name="id" id="userId" value="${user.id}"/>
            <P>银行账户：<input type="text"  name="idcard" id="idCard"/></P>
            <p>提现金额：<input type="text"  name="money" id="money"/></p>
            <p>支付密码：<input type="text" name="phone" id="paypwd"/></p>
            <div class="bomb_button fr">
                <input class="input_button_yes" type="button" value="确认" onclick="withdrawMoney()"/>
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
<script>
 	var user="${user.fname}"
    if(user!=null){
      	$(".lr1").hide();
       	$(".zhuxiao").show();
    }
    function withdrawMoney() {
        var users = {
            id: $("#userId").val(),
            paypwd : $("#paypwd").val(),
            idcard : $("#idCard").val(),
            paymoney : $("#money").val(),
        };
        $.ajax({
            url:'/withdrawMoney',
            data: JSON.stringify(users),
            type:'post',
            dataType:'json',
            contentType:"application/json",
            error: function(result){
                console.log(result)
                alert(result.msg)
            },
            success:function(result){
                console.log(result)
                alert(result.msg)
                <%--location.replace("/userAccount/${user.id}")--%>
            },
        });
    }
</script>
</body>
</html>