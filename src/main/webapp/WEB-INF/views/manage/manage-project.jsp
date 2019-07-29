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
            <li class="my_support normal span_support"><span></span><a href="displayAllproj">项目管理&nbsp;&nbsp;&gt;</a></li>
            <li class="my_project"><a href="displayAlluser">会员管理</a></li>
        </ul>
        <div class="user_nav_bubai"></div>
    </div>


    <div class="user_content fr user_content_none" style="height: 630px;" >
        <header>
            项目审核
        </header>
        <table>
            <tr style="font-size:20px">
                <th>项目名称</th>
                <th>提交时间</th>
                <th>申请人</th>
                <th>状态</th>
                <th>是否通过</th>
                <th>删除项目</th>
            </tr>
            <c:forEach items="${allproj}" var="ap">
         
              <tr align="center" style="line-height:40px" class="proj_info">
                <td>${ap.name }</td>
                <td>${ap.startdate}</td>
                <td>${ap.user.fname }</td>
                <td class="status">${ap.shenHe }</td>
                <td><form action="projshenhe" method="post"><input type="text" value="${ap.id}" style="display:none" name="pid">
                <input type="checkbox"  class="pass" name="shenHe" value="已通过" > <span>是</span>
                 <input type="checkbox"  class="pass" name="shenHe" value="未通过" ><span>否</span></form></td>
                <td><a href="deleteproj?pid=${ap.id }" class="delete"><span style="border:1px solid black;padding-left:3px;padding-right:3px;background-color:#f8f8ff;color:gray">删除</span></a></td>
              </tr> 
            </c:forEach>
        </table>
        <center>
            <p>当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
                页,总 ${pageInfo.total } 条记录</p>
            <a href="displayAllproj?pageNo=${pageInfo.firstPage}">第一页</a>
            <c:if test="${pageInfo.hasPreviousPage }">
                <a href="displayAllproj?pageNo=${pageInfo.pageNum-1}">上一页</a>
            </c:if>

            <c:if test="${pageInfo.hasNextPage }">
                <a href="displayAllproj?pageNo=${pageInfo.pageNum+1}">下一页</a>
            </c:if>

            <a href="displayAllproj?pageNo=${pageInfo.lastPage}">最后页</a>
        </center>
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
    $(function () {
        $(".list li").click(function () {
            $(".user_content").hide();
            $(".user_content").eq($(this).index()).show();
        })
    $(".pass").click(function () {
            if(this.checked){
                 $(this).parent().submit();
            }
          
    })
        $(".delete").click(function () {
            if(confirm("确认删除？")){
                $(this).parent().parent().remove()
               
            }

        })
        $(".dongjie").click(function () {

            if(this.checked){
                $(this).parent().siblings(".status").css("color","red").html("账户已禁用")
            }
            else{
                $(this).parent().siblings(".status").css("color","green").html("正常")
            }
        })
     
     
    })

   var user="${sessionScope.user.getFname()}"
    if(user!=null){
      $(".lr1").hide()
       $(".zhuxiao").show();  
    }
  $(".proj_info").hover(function(){
     $(this).siblings("tr").css("background-color","white")
     $(this).css("background-color","#f8f8ff")
   
  })
  $(".proj_info").click(function(){
  
    $(this).siblings(".proj_detail").show();
  })
</script>
</body>
</html>
