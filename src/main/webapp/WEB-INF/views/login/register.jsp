<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>注册</title>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/public.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/login.css" />
<script type="text/javascript"
	src="<%=basePath%>/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
    function aa(){
        var users = {
            fname : $("#fname").val(),
            phone : $("#phone").val(),
            email : $("#email").val(),
            password : $("#password").val(),
        };
        $.ajax({
            url:'/loginRegister/insertUsers',
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
				location.replace("/returnLogin")
            },
        });
    };
	//确认协议
	function check(obj) {
		var obj = $(obj);
		var yon = obj.hasClass("checked");
		if (yon == false) {
			obj.addClass("checked");
		} else {
			obj.removeClass("checked");
		}
	}
	// function checkfname() {
	// 	var fname = $("#fname").val();
	// 	if (fname == "") {
	// 		$("#fname").css("border", "1px solid red")
	// 		return false
	// 	} else {
	// 		$("#fname").css("border", "1px solid black")
	// 		return true;
	// 	}
	// }
	// function checkphone() {
	// 	var phone = $("#phone").val();
	// 	if (phone == "") {
	// 		$("#phone").css("border", "1px solid red")
	// 		return false
	// 	} else {
	// 		$("#phone").css("border", "1px solid black")
	// 		return true;
	// 	}
	// }
	// function checkemail() {
	// 	var email = $("#email").val();
	// 	if (email == "") {
	// 		$("#email").css("border", "1px solid red")
	// 		return false
	// 	} else {
	// 		$("#email").css("border", "1px solid black")
	// 		return true;
	// 	}
	// }
	// function checkpsw() {
	// 	var pwd = $("#password").val()
	// 	if (pwd == "") {
	// 		$("#password").css("border", "1px solid red")
	// 		$("#password").html("*请输入密码").css("color", "red")
	// 		return false
	// 	} else {
	// 		if (pwd.length < 3) {
	// 			$("#pwd_prompt").html("密码长度至少为3个字符").css("color", "red")
	// 			return false
	// 		} else {
	// 			$("#password").css("border", "1px solid black")
	// 			return true
	// 		}
	// 	}
	// }
	// function checkpsw2() {
	// 	var pwd2 = $("#password_c").val();
	// 	var pwd = $("#password").val();
	// 	if (pwd2 != pwd) {
	// 		$("#password_c").css("border", "1px solid red")
	// 		return false
	// 	} else {
	// 		$("#password_c").css("border", "1px solid black")
	// 		return true;
	// 	}
	// }
	// $(function() {
	// 	$("#fname").blur(checkfname)
	// 	$("#phone").blur(checkphone)
	// 	$("#email").blur(checkemail)
	// 	$("#password").blur(checkpsw)
	// 	$("#password_c").blur(checkpsw2)
	// 	$("#register").click(function() {
	// 		var flag = true;
	// 		if (!checkfname()) {
	// 			flag = false
	// 		}
	// 		if (!checkpsw()) {
	// 			flag = false
	// 		}
	// 		if (!checkphone()) {
	// 			flag = false
	// 		}
	// 		if (!checkemail()) {
	// 			flag = false
	// 		}
	// 		if (!checkpsw2()) {
	// 			flag = false
	// 		}
	// 		// if (flag) {
	// 			// $("#r_form").submit()
	// 		// } else {
	// 		// 	return;
	// 		// }
	// 	})
	// })
</script>
</head>

<body>
	<div class="content_wrap">
		<div class="content_h clearfix">
			<p class="fl content_h_logo">
				<img src="<%=basePath%>/images/loginlogo.png" />
			</p>
			<p class="fl content_h_logo_text">二级分销的众筹平台</p>
			<p class="fr content_h_r">
				<span class="content_h_r1">100%质量保证</span> <span
					class="content_h_r2">未达成目标全额退款</span> <span class="content_h_r3">全国包邮</span>
			</p>
		</div>
		<div class="clearfix content">
			<div class="content_l fl">
				<img src="<%=basePath%>/images/loginad_06.png" />
			</div>
			<div class="content_r fl">
				<p class="content_r_h">注册</p>
				<p class="content_r_tip">
					已有账号？<a class="content_r_tip2" href="returnLogin">立即登录</a>
				</p>
				<form action="" method="post" id="r_form">

					<p class="content_r_l">
						用户名： <input type="text" class="content_r_tel" name="fname" id="fname"/>
					</p>
					<p class="content_r_l">
						手机号： <input type="text" class="content_r_tel" name="phone" id="phone"/>
					</p>
					<p class="content_r_l">
						邮箱： <input type="text" class="content_r_tel" name="email" id="email"/>
					</p>
					<p class="content_r_l">
						密码： <input type="password" class="content_r_tel"
							name="password" id="password"/>
					</p>
					<p class="content_r_l">
						确认密码： <input type="password" class="content_r_tel" id="password_c"/>
					</p>
					<p class="register_">
						<span class="register_check checked" onClick="check(this)"></span>我已经认真阅读并同意<a
							href="javascript:void(0)">《用户注册协议》</a>
					</p>
					<p class="regist_btn">
						<input
							style="border: none; color: white; background-color: #13b7e6; width: 170px; margin-top: 3px; height: 30px"
							type="button" value="立即注册" id="register" onClick="aa();"/>
					</p>
				</form>
			</div>
		</div>
	</div>
	<!--尾部start-->
	<div class="footer">
		<%--<s:action name="toFooter" namespace="/page" executeResult="true"></s:action>--%>
	</div>
	<!--尾部end-->
</body>
</html>