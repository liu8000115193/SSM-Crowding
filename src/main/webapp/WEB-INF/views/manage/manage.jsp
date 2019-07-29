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
           <li class="my_support normal span_support"><span></span><a href="manage.jsp">个人资料&nbsp;&nbsp;&gt;</a></li>
            <li class="my_account"><a href="displayAllproj">项目审核</a></li>
            <li class="my_project"><a href="displayAlluser">会员管理</a></li>
        </ul>
        <div class="user_nav_bubai"></div>
    </div>
    <div class="user_content fr" style="height: 630px">
        <header>
            个人资料
        </header>
        <div class="user_main clearfix">
            <div class="user_data_input fl">
                昵称：<input class="input_name" type="text"  maxlength="20"/>
                <br>
                简介：<textarea class="input_text"textarea  maxlength="100"></textarea>
                <br>
                <input class="input_button_yes data_save" type="button" value="保存">
            </div>
            <%--<div class="user_data_img user_data_xiugai fr">--%>
                <%--<img src="<%=basePath%>/images/bg_head.jpg"/>--%>
                <%--<p>修改头像</p>--%>
            <%--</div>--%>
        </div>
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
<script>
    $(function () {
        $(".list li").click(function () {
            $(".user_content").hide();
            $(".user_content").eq($(this).index()).show();
        })
    $(".pass").click(function () {

            if(this.checked){
                $(this).parent().siblings(".status").css("color","green").html("审核通过")
            }
            else{
                $(this).parent().siblings(".status").css("color","red").html("未通过")
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
 
 var user="${sessionScope.user.getName()}"
    if(user!=null){
      $(".lr1").hide()
       $(".zhuxiao").show();  
    }
</script>
</body>
</html>