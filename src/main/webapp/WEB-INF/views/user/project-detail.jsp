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
<title>项目详情</title>
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/public.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/projectdetail.css" />

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
<!--adtop-->
<div class="adtop wrapcenter clearfix relative">
  <div class="adtop_l fl">
    <p> <img src="<%=basePath%>/images/${map['project'].image}" width="777px" height="399px"/></p>
  </div>
  <div class="adtop_r fl">
    <p class="projectname">${map['project'].name}</p>
    <p class="projectad">${map['project'].introduce}</p>
    <p><span  class="already">已筹到</span><span class="moneymark">￥</span><span class="money">${map['project'].supmoney}</span></p>
    <p class="progressbar relative"><span class="progressbar_t absolute" style="width:${map['project'].supmoney/map['project'].needmoney*100}%"><img src="<%=basePath%>/images/progress_08.png" class="absolute"/></span></p>
    <p class="clearfix"><span class="progressnow fl">当前进度${map['project'].process}%</span><span class="support fr">${map['project'].numsup}名支持者</span></p>
    <p class="progresstip">此项目必须在 <span>${map['project'].deadline}</span>前得到 <span>￥${map['project'].needmoney}</span> 的支持才可成功！</p>
    <p class="clearfix">

		    <a href="/project/OrderProject?pid=${map['project'].id}&uid=${sessionScope.user.getId()}">
		   		<span class="fl btn_l">立即支持</span>
		    </a>

				<span class="fr btn_r" id="collectpro">收藏<input type="hidden" value="${map['project'].id}"/></span>

			<%--<c:otherwise>--%>
				<%--<span class="fr btn_r">已收藏</span>--%>
			<%--</c:otherwise>--%>
    </p>
    <p class="share">分享到 <a href="javascript:void(0)"><span class="webo"></span></a> <a href="javascript:void(0)"><span class="qzone"></span></a> <a href="javascript:void(0)"><span class="wechat"></span></a><a href="javascript:void(0)"><span class="qq"></span></a> </p>
  </div>
  <div class="absolute mark_ing"><img src="<%=basePath%>/images/mark_ing_06.png"/></div>
</div>
<!--adbot-->
<div class="adbot wrapcenter clearfix">
  <div class="adbot_l fl">
    <ul class="clearfix tab">
      <li class="fl active relative">项目详情
        <p class="absolute whitebg"></p>
      </li>
      <li class="fl relative">项目评论
        <p class="absolute whitebg hide"></p>
      </li>
      <li class="fl relative">试用报告
        <p class="absolute whitebg hide"></p>
      </li>
      <li class="fl relative">规则说明
        <p class="absolute whitebg hide"></p>
      </li>
    </ul>
   
    <div class="table" style="display:block;"><!--项目详情-->
		<%--<div class="video"></div>--%>
		<div class="adpic"><img src="<%=basePath%>/images/${map['project'].image}" width="740" height="600"/></div>
	</div>
    <div class="table" style="display:none;"><!--项目评论-->
    	<%--<:if test="submitType=='preview'">--%>
    		<%--<span>这是预览，暂无评论数据！！</span>--%>
    	<%--</:if>--%>
    	<%--<s:else>--%>
			<c:forEach items="${map['comment']}" var="comment" varStatus="status">
				<div class="projectappraise">
					<p><img src="<%=basePath%>/images/${comment.headimg}" class="absolute projectappraise_head"/></p>
					<p>
						<span class="projectappraise_name">${comment.fname}</span>
						<%--<span class="trialReport_time"><s:property value="comTimes[#status.index]"/></span>--%>
					</p>
					<p class="projectappraise_content">${comment.content}</p>
					<p>
                        <c:if test="${not empty comment.images}">
						<span class="projectappraise_img"><img src="<%=basePath%>/images/${comment.images}"></span>
                        </c:if>
					</p>
				</div>
			</c:forEach>
		<%--</s:else>--%>
	</div>
    <div class="table" style="display:none;"><!--试用报告-->
    	<%--<c:if test="submitType=='preview'">--%>
    		<%--<span>这是预览，暂无试用数据！！</span>--%>
    	<%--</c:if>--%>
    	<%--<c:else>--%>
		    <c:forEach items="${map['comment']}" var="comment" varStatus="status">
				<div class="trialReport">
					<p><img src="<%=basePath%>/upload/user/${comment.headimg}"  class="absolute trialReport_head"/></p>
					<p class="dropdown absolute drop" onClick="drop(this)">查看详情</p>
					<p>
						<span class="trialReport_name">${comment.fname}</span>
						<%--<span class="trialReport_time"><s:property value="testTimes[#status.index]"/></span>--%>
					</p>
					<p class="clearfix  trialsummarize">
						<span class="fl">试用总结：</span>
						<span class="fl trialsummarize_content">${comment.content}</span>
					</p>
					<div class="clearfix  trialprocedure">
						<span class="fl">试用过程：</span>
						<div class="fl trialprocedure_content">
						<p><s:property value="#comment.content"/></p>
							<div class="dropdown_content hide">
								<p><img src="<%=basePath%>/images/${comment.images}"></p>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		<%--</c:else>--%>
	</div>
    <div class="table" style="display:none;"><!--规则说明-->
		<p><s:property value="project.rule"/> </p>
	</div>
  </div>
  <div class="adbot_r fl">
    <div class="adbot_r_t">
      <p class="projectleader">项目发起人</p>
      <div class="projectitem clearfix">
        <div class="projectleader_header fl"><img src="<%=basePath%>/images/${map['user'].headimg}"/>" width="61" height="60"/></div>
        <div class="fl">
          <p class="projectleader_header_t">${map['user'].name}</p>
          <p class="projectleader_header_b">${map['user'].introduce}</p>
        </div>
      </div>
    </div>
    <div class="adbot_r_b">
      <p class="clearfix adbot_r_b_t"><span class="fl">￥${map['project'].backmoney}</span><span class="fr">限额20位，剩余10位</span></p>
      <p class="adbot_r_b_m">为感谢您的支持，您将以众筹专属价获得${map['project'].backcontent}</p>
      <p class="adbot_r_b_img"><img src="<%=basePath%>/images/projectdetail_ad2_08.png"></p>
      <p class="adbot_r_b_grey">配送费用：<span class="adbot_r_b_black">全国包邮</span></p>
      <p class="adbot_r_b_grey">预计发放时间：<span class="adbot_r_b_black">项目筹款成功后的<span class="adbot_r_b_yellow">30</span>天内</span></p>
      <p class="adbot_r_b_btn"><a href="/project/OrderProject?pid=${map['project'].id}&uid=${sessionScope.user.getId()}">立即支持</a></p>
    </div>
  </div>
</div>

<!--尾部start-->
<div class="footer">
	<jsp:include page="/WEB-INF/views/page/footer.jsp"></jsp:include>
</div>
<!--尾部end-->

<script type="text/javascript" src="<%=basePath%>/js/jquery-1.9.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/projectdetail.js"></script>
<script type="text/javascript">
//取消收藏
$(document).ready(function(){
	$("#collectpro").click(function(){
		var obj=$(this);
   	 	var id=obj.children("input").val();
   	 	var userId = ${sessionScope.user.getId()}
   	 	var text=obj.text();
  		if(text=="收藏"){
  			$.ajax({
				type : "post", //使用post方法访问后台  
				dataType : "json", //返回text格式的数据
				url : "project/addCollect", //要访问的后台地址
				// contentType : "application/x-www-form-urlencoded",
				data : {
					projectId:id,
                    userId:userId,
				}, //要发送的数据  
				success : function(data) { //data为返回的数据，在这里做数据绑定
						obj.html("已收藏");
						alert(data.msg)
				},
				error : function() {
					alert("连接服务器失败！");
				}
			});
  		}
    	})
   	
})
var user = "${sessionScope.user.getFname()}"
if (user != null) {
    $(".lr1").hide()
    $(".zhuxiao").show();
}
</script>
</body>
</html>
