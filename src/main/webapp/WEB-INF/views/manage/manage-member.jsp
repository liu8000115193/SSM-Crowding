<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>我的众筹</title>
    <link type="text/css" rel="stylesheet" href="<%=basePath%>/css/user.css">
    <link type="text/css" rel="stylesheet" href="<%=basePath%>/css/public.css">

</head>
<body>
<!--头部start-->
<div class="header">
    <jsp:include page="/WEB-INF/views/page/top.jsp"></jsp:include>
    <%--<nav class="auto clearfix">--%>
        <%--<span class="nav_l fl">--%>
          <%--<span class="nav_l1 nav_l4 active"><a href="project/toindexProject">首页</a></span>--%>
          <%--<span class="nav_l2 nav_l4"><a href="project/toScanProject">项目浏览</a></span>--%>
          <%--<span class="nav_l3 nav_l4"><a href="myraise/informationRaise">我的众筹</a></span>--%>
        <%--</span>--%>
        <%--<span class="nav_r fr">--%>
          <%--<span class="nav_r1 fl"><a href="project/toContractProject">发起项目</a></span>--%>
          <%--<span class="nav_r2 fl"><a href="util/to_helpUtil">新手帮助</a></span>--%>
        <%--</span>--%>
    <%--</nav>--%>
    <!--nav end-->
</div>
<!--头部 结束-->
<!--主体部分-->
<div class="main clearfix">
    <!--导航-->
    <div class="user_nav fl">
        <a class="data" href="user.html">
            <img src="<%=basePath%>/images/img_head.jpg"/>
            <p>昵称</p>
        </a>
        <ul class="list">
            <li class="my_address"><a href="manage.jsp">个人资料</a></li>
            <li class="my_account"><a href="displayAllproj">项目审核</a></li>
            <li class="my_support normal span_support"><span></span><a href="displayAlluser">会员管理&nbsp;&nbsp;&gt;</a>
            </li>
        </ul>
        <div class="user_nav_bubai"></div>
    </div>


    <div class="user_content fr" style="height: 630px;">
        <header>
            会员管理
        </header>
        <table class="menmber_manager">
            <tr style="font-size:20px">
                <th>用户名</th>
                <th>手机号</th>
                <th>是否禁用</th>
                <th>能否发起众筹</th>
                <th>冻结账户</th>
                <th>众筹权限</th>
            </tr>
            <c:forEach items="${pageInfo.list}" var="au">

                <tr align="center" style="line-height:40px" class="user_info">
                    <td>${au.name }</td>
                    <td>${au.phone }</td>
                    <td>${au.isforbid }</td>
                    <td>${au.isable }</td>
                    <td>
                        <form action="userForbid" method="post">
                            <input type="text" value="${au.id}" style="display:none" name="uid">
                            <input type="checkbox" class="dongjie" name="forbid" value="是"><span>是</span>
                            <input type="checkbox" class="dongjie" name="forbid" value="否"> <span>否</span>
                                <%--<input type="checkbox" class="pass" name="shenHe" value="未通过"><span>否</span>--%>
                        </form>
                    </td>
                    <td>
                        <form action="ableAddProject" method="post">
                            <input type="text" value="${au.id}" style="display:none" name="uid">
                            <input type="checkbox" class="ableAdd" name="isAble" value="是"><span>是</span>
                            <input type="checkbox" class="ableAdd" name="isAble" value="否"> <span>否</span>
                                <%--<input type="checkbox" class="pass" name="shenHe" value="未通过"><span>否</span>--%>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            <!-- 分页 -->
            <%--<div id="pageNum">--%>
                <%--<c:if test="${essayPage != null && essayPage.getTotal() > 0 }">--%>
                    <%--<nav style="text-align: center">--%>
                        <%--<ul class="pagination pagination-lg">--%>
                            <%--<li><a>共 ${essayPage.total } 条记录</a></li>--%>
                            <%--<li><a>当前第 ${essayPage.pageNum} 页</a></li>--%>
                            <%--<c:if test="${essayPage.pageNum!= 1 }">--%>
                                <%--<li><a href="displayAlluser?pageNo=${essayPage.pageNum - 1}">上一页</a></li>--%>
                            <%--</c:if>--%>
                            <%--<c:if test="${essayPage.pageNum < essayPage.pages }">--%>
                                <%--<li><a href="displayAlluser?pageNo=${essayPage.pageNum + 1}">下一页</a></li>--%>
                            <%--</c:if>--%>
                            <%--<li><a>共 ${essayPage.pages} 页</a></li>--%>
                        <%--</ul>--%>
                    <%--</nav>--%>
                <%--</c:if>--%>
            <%--</div>--%>
        </table>
        <center>
        <p>当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
            页,总 ${pageInfo.total } 条记录</p>
         <a href="displayAlluser?pageNo=${pageInfo.firstPage}">第一页</a>
        <c:if test="${pageInfo.hasPreviousPage }">
           <a href="displayAlluser?pageNo=${pageInfo.pageNum-1}">上一页</a>
         </c:if>

         <c:if test="${pageInfo.hasNextPage }">
             <a href="displayAlluser?pageNo=${pageInfo.pageNum+1}">下一页</a>
          </c:if>

          <a href="displayAlluser?pageNo=${pageInfo.lastPage}">最后页</a>
        </center>
    </div>
</div>
<!--修改头像-->
<div class="bomb bomb_data_wrapper" style="display:none;">
    <div class="bomb_data clearfix">
        <div class="bomb_title clearfix">
            <p class="fl">修改头像</p>
            <span class="close fr"></span>
        </div>
        <div class="clearfix">
            <div class="user_data_img bomb_data_now fl">
                <img src="<%=basePath%>/images/bg_head.jpg"/>
                <p>当前头像</p>
            </div>
            <div class="bomb_data_resive fr">
                <img src="<%=basePath%>/images/bg_head.jpg"/>
                <br>
                <input type="file" accept="image/gif, image/jpeg, image/png"/>
                <p>请选择一张您电脑中的图片，任何点击“保存”。<br>支持JPG、PNG、GIF图片类型，不能大于200KB。</p>
            </div>
        </div>
        <div class="bomb_button fr">
            <input class="input_button_yes" type="button" value="确认"/>
            <input class="input_button_no" type="button" value="取消"/>
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
<script type="text/javascript" src="<%=basePath%>/js/manage.js"></script>
<script>
    $(function () {
        $(".list li").click(function () {
            $(".user_content").hide();
            $(".user_content").eq($(this).index()).show();
        })
        $(".dongjie").click(function () {
            if (this.checked) {
                $(this).parent().submit();
            }
        })
        $(".ableAdd").click(function () {
            if (this.checked) {
                $(this).parent().submit();
            }
        })
    })
    var user = "${sessionScope.user.getFname()}"
    if (user != null) {
        $(".lr1").hide()
        $(".zhuxiao").show();
    }
    $(".user_info").hover(function () {
        $(this).siblings("tr").css("background-color", "white")
        $(this).css("background-color", "#f8f8ff")
    })
</script>
</body>
</html>