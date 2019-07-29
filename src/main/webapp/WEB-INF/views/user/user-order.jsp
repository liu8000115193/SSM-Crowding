<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>立即下单</title>
	<link type="text/css" rel="stylesheet" href="<%=basePath%>/css/user.css">
	<link type="text/css" rel="stylesheet" href="<%=basePath%>/css/public.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/placeorder.css" />
	<%--<meta http-equiv="Refresh" content="10;URL=returnIndex">--%>
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

<div  class="content_wrap">
	<div class="warm_tip">请在下单后15分钟内付款，否则您的订单会被自动关闭。</div>

	<div>
		<p class="address_header">收货地址</p>

		<ul  class="address ">
            <c:forEach items="${map['address']}" var="address">
                <li class="relative write">
					<p class="fl"><input type="radio" name="addressid" value="${address.id}"/>
						<input id="addressId" type="hidden" name="addressid" value="${address.id}"/>
                    <span class="address_province">${address.province}</span>
					<span class="address_city">${address.city}</span>
					<span class="address_area">${address.county}</span>
					<span class="address_zone">${address.telephone}</span>
					<span class="address_name">${address.consignee}</span>
					<span class="address_tel">${address.postcard}</span>
					</p>
					<%--<p class="fr address_r hide">--%>
						<%--<span>[设置默认地址]</span>--%>
						<%--<span>修改</span>--%>
						<%--<span>删除</span>--%>
					<%--</p>--%>
				</li>
            </c:forEach>
		</ul>
    </div>
		<%--<p class="add_btn">添加新地址</p>--%>
	<div>
		<p class="item_header">项目信息</p>
		<table class="item_table" cellspacing="0">
		<tr>
		<th class="t_1">项目名称</th>
		<th class="t_2">发起人</th>
		<th class="t_3">回报内容</th>
		<th class="t_4">支持单价</th>
		<th class="t_5">配送费用</th>
		</tr>
		<tr>
		<td>${map['project'].name}</td>
		<td>${map['user'].name}</td>
		<td>${map['project'].backcontent}</td>
		<td class="item_table_price">￥${map['project'].backmoney}</td>
		<td>${map['project'].sendmoney}</td>
		</tr>
		</table>
	</div>

	<div class="invitemark">
		<p><span class="invitemark_l">邀请码</span><span><input id="invitecode" type="text" name="invitecode" class="invitemark_r" value="111111" /></span></p>
	</div>
	<div class="payway">
		<p class="payway_h">您可以选择以下支付方式：</p>
		<ul class="clearfix choose_way">
			<li class="fl relative">
				<p><span class="absolute"></span><span><input type="radio" checked="checked" name="paytype" value="2"/>账户余额</span></p>
				<p class="available_money">当前可用余额：<span class="available_money_num">${map['user'].paymoney}</span>元</p>
			</li>
			<li class="fl relative">
				<p><span class="absolute"></span><span class="payway_img"><input type="radio" name="paytype" value="1"/><img src="<%=basePath%>/images/paybaby_08.png" /></span></p>
			</li>
		</ul>
	</div>
	<div class="postorder clearfix">
		<div class="fr postorder_wrap">
			<form action="">
				<input id="userid" type="hidden" name="userid" value="${map['user'].id}"/>
				<input id="projectId" type="hidden" name="projectid" value="${map['project'].id}"/>
				<input id="paymoney1" type="hidden" name="payMent" value="${map['project'].backmoney}"/>
			</form>

			<p class="postorder_num clearfix">支持金额：<span class="postorder_price fr">￥${map['project'].backmoney}</span></p>
			<p class="postorder_tra clearfix">+配送费用：<span class="postorder_price fr">￥${map['project'].sendmoney}</span></p>
			<p class="postorder_total clearfix">支付总金额：<span class="postorder_price fr">￥${map['project'].backmoney+map['project'].sendmoney}</span></p>
			<%--<p class="postorder_tip">请在下单后15分钟内付款，否则您的订单会被自动关闭。</p>--%>
			<input class="postorder_btn" type="button"  value="提交订单并付款" onclick="addorder()" />
		</div>
	</div>

	<div class="warm_tip2">
		<p class="warm_tip2_h">风险提示</p>
			<p class="warm_tip2_c">1.无限道众筹是一个开放的众筹平台，公众基于对项目、发起人和回报的认同，通过资助的方式参与和支持创新。</p>
			<p class="warm_tip2_c">2.为了保证项目筹款和制作的顺利进行，您成功付款后不能像往常一样直接申请退款。</p>
			<p class="warm_tip2_c">3.如果筹款失败，支付款项会全部退回，项目取消。</p>
			<p class="warm_tip2_c">4.若您选择无偿支持，项目成功后发起人将不会给您发送回报。</p>
	</div>
</div>
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
<!--尾部start-->
<div class="footer">
	<jsp:include page="/WEB-INF/views/page/footer.jsp"></jsp:include>
</div>
<!--尾部end-->

<script type="text/javascript" src="<%=basePath%>/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/placeorder.js"></script>
<%--<script type="text/javascript" src="<%=basePath%>/js/area.js"></script>--%>
<script type="text/javascript" src="<%=basePath%>/js/order.js"></script>
<script>
</script>
<%--<script type="text/javascript">_init_area();</script>--%>
<%--<script type="text/javascript">_init_area1();</script>--%>
</body>
</html>
