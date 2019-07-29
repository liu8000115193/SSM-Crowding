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
	<title>我的项目</title>
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
        <header>我的项目</header>
        <div class="user_main">
            <ul class="project_nav clearfix">
                <li class="user_project_one project_all">全部</li>
                <li>众筹中</li>
                <li>众筹成功</li>
                <li class="project_lose">众筹失败</li>
            </ul>
            
            <ul class="project_content" style="display:block;">
                <li class="project_content_nav">
                    <ul class="clearfix"><li style="width:40%;">项目信息</li>
                    <li>目标金额</li>
                    <li>已筹金额</li>
                    <li>当前状态</li>
                    <li>操作</li>
                    </ul>
                </li>
               
                   <li class="project_list">
                   <c:forEach items="${listProject}" var="p" varStatus="status">
                       <ul class="clearfix">
                       <li class="project_list_xinxi">
                       <img src="<%=basePath%>/images/${p.image}"/></li>
                       <li class="project_list_xinxi">
                       <p class="project_list_xinxi_name">${p.name}</p>
                       <p>达成率 ${p.supmoney/p.needmoney}</p>
                       <p>结束时间<time>${p.deadline}</time></p>
                       </li><li class="project_list_text">￥${p.needmoney}</li>
                       <li class="project_list_text">￥${p.supmoney}</li>
                       <li class="project_list_text">${p.statue}</li>
                       <li class="project_list_text">
                       <a href="/detailProject?id=${p.id}">查看项目</a></li></ul>
                   </c:forEach>
                   </li>
                <center>
                    <p>当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
                        页,总 ${pageInfo.total } 条记录</p>
                    <a href="/userProject/${user.id}?pageNo=${pageInfo.firstPage}">第一页</a>
                    <c:if test="${pageInfo.hasPreviousPage }">
                        <a href="/userProject/${user.id}?pageNo=${pageInfo.pageNum-1}">上一页</a>
                    </c:if>

                    <c:if test="${pageInfo.hasNextPage }">
                        <a href="/userProject/${user.id}?pageNo=${pageInfo.pageNum+1}">下一页</a>
                    </c:if>

                    <a href="/userProject/${user.id}?pageNo=${pageInfo.lastPage}">最后页</a>
                </center>
            </ul>
            
            <ul class="project_content" style="display:none;">
                <li class="project_content_nav">
                    <ul class="clearfix"><li style="width:40%;">项目信息</li><li>目标金额</li><li>已筹金额</li><li>当前状态</li><li>操作</li></ul>
                </li>
                <li class="project_list">
                    <c:forEach items="${listProject}" var="p" varStatus="status">
                        <c:if test="${p.statue.equals('众筹中')}">
                        <ul class="clearfix">
                            <li class="project_list_xinxi">
                                <img src="<%=basePath%>/images/${p.image}"/></li>
                            <li class="project_list_xinxi">
                                <p class="project_list_xinxi_name">${p.name}</p>
                                <p>达成率 ${p.supmoney/p.needmoney}</p>
                                <p>结束时间<time>${p.deadline}</time></p>
                            </li><li class="project_list_text">￥${p.needmoney}</li>
                            <li class="project_list_text">￥${p.supmoney}</li>
                            <li class="project_list_text">${p.statue}</li>
                            <li class="project_list_text">
                                <a href="/detailProject?id=${p.id}">查看项目</a></li></ul>
                        </c:if>
                    </c:forEach>
                </li>
                <center>
                    <p>当前 ${pageInfo1.pageNum }页,总${pageInfo1.pages }
                        页,总 ${pageInfo1.total } 条记录</p>
                    <a href="/userProject/${user.id}?pageNo=${pageInfo1.firstPage}">第一页</a>
                    <c:if test="${pageInfo1.hasPreviousPage }">
                        <a href="/userProject/${user.id}?pageNo=${pageInfo1.pageNum-1}">上一页</a>
                    </c:if>

                    <c:if test="${pageInfo1.hasNextPage }">
                        <a href="/userProject/${user.id}?pageNo=${pageInfo1.pageNum+1}">下一页</a>
                    </c:if>

                    <a href="/userProject/${user.id}?pageNo=${pageInfo1.lastPage}">最后页</a>
                </center>
            </ul>
            <ul class="project_content" style="display:none;">
                <li class="project_content_nav">
                    <ul class="clearfix"><li style="width:40%;">项目信息</li><li>目标金额</li><li>已筹金额</li><li>当前状态</li><li>操作</li></ul>
                </li>
                <li class="project_list">
                    <c:forEach items="${listProject}" var="p" varStatus="status">
                        <c:if test="${p.statue.equals('众筹成功')}">
                            <ul class="clearfix">
                                <li class="project_list_xinxi">
                                    <img src="<%=basePath%>/images/${p.image}"/></li>
                                <li class="project_list_xinxi">
                                    <p class="project_list_xinxi_name">${p.name}</p>
                                    <p>达成率 ${p.supmoney/p.needmoney}</p>
                                    <p>结束时间<time>${p.deadline}</time></p>
                                </li><li class="project_list_text">￥${p.needmoney}</li>
                                <li class="project_list_text">￥${p.supmoney}</li>
                                <li class="project_list_text">${p.statue}</li>
                                <li class="project_list_text">
                                    <a href="/detailProject?id=${p.id}">查看项目</a></li></ul>
                        </c:if>
                    </c:forEach>
                </li>
                <center>
                    <p>当前 ${pageInfo2.pageNum }页,总${pageInfo2.pages }
                        页,总 ${pageInfo2.total } 条记录</p>
                    <a href="/userProject/${user.id}?pageNo=${pageInfo2.firstPage}">第一页</a>
                    <c:if test="${pageInfo2.hasPreviousPage }">
                        <a href="/userProject/${user.id}?pageNo=${pageInfo2.pageNum-1}">上一页</a>
                    </c:if>

                    <c:if test="${pageInfo2.hasNextPage }">
                        <a href="/userProject/${user.id}?pageNo=${pageInfo2.pageNum+1}">下一页</a>
                    </c:if>

                    <a href="/userProject/${user.id}?pageNo=${pageInfo2.lastPage}">最后页</a>
                </center>
            </ul>
            <ul class="project_content" style="display:none;">
                <li class="project_content_nav">
                    <ul class="clearfix"><li style="width:40%;">项目信息</li><li>目标金额</li><li>已筹金额</li><li>当前状态</li><li>操作</li></ul>
                </li>
                <li class="project_list">
                    <c:forEach items="${listProject}" var="p" varStatus="status">
                        <c:if test="${p.statue.equals('众筹失败')}">
                            <ul class="clearfix">
                                <li class="project_list_xinxi">
                                    <img src="<%=basePath%>/images/${p.image}"/></li>
                                <li class="project_list_xinxi">
                                    <p class="project_list_xinxi_name">${p.name}</p>
                                    <p>达成率 ${p.process}</p>
                                    <p>结束时间<time>${p.deadline}</time></p>
                                </li><li class="project_list_text">￥${p.needmoney}</li>
                                <li class="project_list_text">￥${p.supmoney}</li>
                                <li class="project_list_text">${p.statue}</li>
                                <li class="project_list_text">
                                    <a href="/detailProject?id=${p.id}">查看项目</a></li></ul>
                        </c:if>
                    </c:forEach>
                </li>
                <center>
                    <p>当前 ${pageInfo3.pageNum }页,总${pageInfo3.pages }
                        页,总 ${pageInfo3.total } 条记录</p>
                    <a href="/userProject/${user.id}?pageNo=${pageInfo3.firstPage}">第一页</a>
                    <c:if test="${pageInfo3.hasPreviousPage }">
                        <a href="/userProject/${user.id}?pageNo=${pageInfo3.pageNum-1}">上一页</a>
                    </c:if>

                    <c:if test="${pageInfo3.hasNextPage }">
                        <a href="/userProject/${user.id}?pageNo=${pageInfo3.pageNum+1}">下一页</a>
                    </c:if>

                    <a href="/userProject/${user.id}?pageNo=${pageInfo3.lastPage}">最后页</a>
                </center>
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
<script>
	var user = "${sessionScope.user.getFname()}"
	if (user != null) {
		$(".lr1").hide()
		$(".zhuxiao").show();
	}
</script>
</body>
</html>F