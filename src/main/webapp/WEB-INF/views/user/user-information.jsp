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
    <link type="text/css" rel="stylesheet" href="<%=basePath%>/css/dropzone.css">
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
            <img class="head_img" width="100" height="100" src='<%=basePath%>/images/${users.headimg}'/>
            <span>${users.fname}</span>
        </a>
        <ul class="list">
            <li class="my_address"><a href="/userAddress/${user.id}">收货地址</a></li>
            <li class="my_account"><a href="/userAccount/${user.id}">账户余额</a></li>
            <li class="my_project"><a href="/userProject/${user.id}">我的项目</a></li>
            <li class="my_profit"><a href="/userProfit/${user.id}">我的收益</a></li>
            <li class="my_support"><a href="/userSupport/${user.id}">我的支持</a></li>
            <li class="my_collect"><a href="/userCollect/${user.id}">我的收藏</a></li>
        </ul>
        <div class="user_nav_bubai"  style="height:365px"></div>
    </div>
    <div class="user_content fr">
        <header>
            个人资料
        </header>
        <div class="user_main clearfix">
            <form action="/file/upload" method="post" enctype="multipart/form-data" id="uploadfile">
                <div class="user_data_input fl">
                    <input type="hidden" name="id" value="${users.id}" />

                    昵称：    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="input_name" type="text" maxlength="20" name="fname"
                              value="${users.fname}"/>
                    <br>
                    邮箱：    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="input_name" type="text" maxlength="20" name="email"
                                                                      value="${users.email}"/>
                    <br>
                    银行卡号：<input class="input_name" type="text" maxlength="20" name="idcard" value="${users.idcard}"
                              />
                    <br>
                    支付密码：<input class="input_name" type="password" maxlength="20" name="paypwd"
                              value="${users.paypwd}"/>
                    <br>
                    邀请码：&nbsp;&nbsp;&nbsp;<input class="input_name" type="text" maxlength="20" name="shareCode"
                              value="${users.shareCode}" readonly="readonly"/>
                    <br>
                    简介：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea class="input_text" type="textarea" maxlength="100" name="introduce"
                                 placeholder="${users.introduce}" ></textarea>
                    <br>
                    修改头像：<input type="file" name="userImage" />
                    <br>
                    <input style="display:none" class="input_url" type="text" maxlength="100" name="head_img"/>
                    <br>
                    <input class="input_button_yes data_save" type="button" name="changesubmit" value="保存" onclick="test()">
                </div>
            </form>
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
<script type="text/javascript" src="<%=basePath%>/js/user-information.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/dropzone.js"></script>
<script type="text/javascript">
    function test(){
        var form = new FormData(document.getElementById("uploadfile"));
        $.ajax({
            url:"/file/upload",
            type:"post",
            data:form,
            processData:false,
            contentType:false,
            success:function(data){
                alert("update success!")
                location.replace("/userInformation/${user.id}")
            },
            error:function(e){
                alert("update failed!");
            }
        });
    }
    var user = "${sessionScope.user.getName()}"
    if (user != null) {
        $(".lr1").hide()
        $(".zhuxiao").show();
    }
</script>
</body>
</html>

