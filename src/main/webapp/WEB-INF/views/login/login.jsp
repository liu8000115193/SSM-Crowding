<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@ taglib prefix="s" uri="/struts-tags" %>--%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<title>登陆</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/public.css" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/login.css" />
    <script type="text/javascript" src="<%=basePath%>/js/jquery-1.8.0.min.js"></script>
   
</head>

<body>
   
    <div class="content_wrap">
        <div class="content_h clearfix">
            <p class="fl content_h_logo"><img src="<%=basePath%>/images/loginlogo.png"/></p>
            <p class="fl content_h_logo_text">二级分销的众筹平台</p>
            <p class="fr content_h_r">
                <span class="content_h_r1">100%质量保证</span>
                <span class="content_h_r2">未达成目标全额退款</span>
                <span class="content_h_r3">全国包邮</span>
            </p>
        </div>
        <div class="clearfix content">
            <div class="content_l fl"><img src="<%=basePath%>/images/loginad_06.png"/></div>
            <div class="content_r fl">
                <p class="content_r_h">登录</p>
                <p class="content_r_tip">没有账号？<a href="loginRegister/register" class="content_r_tip2">立即注册</a></p>
                <form action="loginRegister/login" method="post" class="form1">
                <p>
                    <input type="text" class="acount" placeholder="手机号/用户名/邮箱" name="name" id="u_name"  />
                </p>
                <p>
                    <input type="password" class="pass_word" placeholder="请输入密码" name="password" id="password"/> 
                </p>
                <p><span class="login_btn"><input style=" border:none; color:white;background-color:#13b7e6;width:215px;height:28px; margin-top:3px " type="submit"  value="登录" class="btn_login"/></span>
                	<a href="returnForgetPassword">忘记密码？</a>
                </p>
                </form>
                <p class="content_r_message"><s:property value="message"/></p>
            </div>           
        </div>
    </div>
<!--尾部start-->
<div class="footer">
    <jsp:include page="/WEB-INF/views/page/footer.jsp"></jsp:include>
</div>
<!--尾部end-->
</body>
<script>
        function checkname() {
            var name=$("#u_name").val();
            if(name==""){
                $("#u_name").css("border","1px solid red")
                
                return false
            }
            else {
              $("#u_name").css("border","1px solid black")
                $(".name_msg").html("")
                return true;
            }
        }
        function checkpsw() {
            var pwd=$("#password").val()
            if(pwd==""){
              $("#password").css("border","1px solid red")
                $("#pwd_prompt").html("*请输入密码") .css("color","red")
                return false
            }
            else {
                if(pwd.length<3){
                    $("#pwd_prompt").html("密码长度至少为3个字符").css("color","red")
                    return false
                }
                else {
                     $("#password").css("border","1px solid black")
                    $("#pwd_prompt").html("")
                    return true
                }
            }
        }
        $(function () {
            $("#u_name").blur(checkname)
            $("#password").blur(checkpsw)
            $(".btn_login").click(function () {
                var flag=true;            
                if(!checkname()){flag=false}
                if(!checkpsw()){flag=false}             
                if(flag){            
                    $(".form1").submit()
                }else{
                    return;
                }
            })
        })

    $("input").hover(
        function () {
       /* $(this).css("border","1px solid blue")*/
            $(this).addClass("oninput")
    },
         function () {
        $(this).removeClass("oninput")
       })
</script>
</html>