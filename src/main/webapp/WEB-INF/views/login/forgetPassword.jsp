<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>忘记密码</title>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/public.css" />
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>/css/login.css" />
<script type="text/javascript" src="js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#phone").blur(checkphone)
		$("#password").blur(checkpsw)
		$("#password_c").blur(checkpsw2)
// 		$(".content_r_mark").blur(checkcode)
		$("#backpwd").click(function(){
			var flag = false;
			flag=checkphone();
			flag=checkpsw();
			flag=checkpsw2();
			if(flag)
				checkcode();
		})
	})

	function checkphone() {
		var phone = $("#phone").val();
		if (phone == "") {
			$("#phone").css("border", "1px solid red")
			return false
		} else {
			$("#phone").css("border", "1px solid black")
			return true;
		}
	}
	function checkpsw() {
		var pwd = $("#password").val()
		if (pwd == "") {
			$("#password").css("border", "1px solid red")
			$("#password").html("*请输入密码").css("color", "red")
			return false
		} else {
			if (pwd.length < 3) {
				$("#pwd_prompt").html("密码长度至少为3个字符").css("color", "red")
				return false
			} else {
				$("#password").css("border", "1px solid black")
				return true
			}
		}
	}
	function checkpsw2() {
		var pwd2 = $("#password_c").val();
		var pwd = $("#password").val();
		if (pwd2==""||pwd2 != pwd) {
			$("#password_c").css("border", "1px solid red")
			return false
		} else {
			$("#password_c").css("border", "1px solid black")
			return true;
		}
	}
	// function checkcode() {
	// 	var checkcode = $(".content_r_mark").val();
	// 	var flag=false;
	// 	$.ajax({
	// 		type : "post", //使用post方法访问后台
	// 		dataType : "text", //返回text格式的数据
	// 		url : "loginRegister/checkImageGetBackPwd", //要访问的后台地址
	// 		contentType : "application/x-www-form-urlencoded",
	// 		data : {
	// 			checkcode : "[" + checkcode + "]"
	// 		}, //要发送的数据
	// 		success : function(data) { //data为返回的数据，在这里做数据绑定
	// 			if (data == "true") {
	// 				//成功提交表单
	// 				$("#form_g").submit()
	// 			} else {
	// 				$(".message").html("验证码输入错误!")
	// 			}
	// 		},
	// 		error : function() {
	// 			alert("验证码校验失败！");
	// 		}
	// 	});
	// 	return flag;
	// }
</script>
</head>

<body>
	<div class="content_wrap">
		<div class="content_h clearfix">
			<p class="fl content_h_logo">
				<img src="<%=basePath%>/images/loginlogo.png">
			</p>
			<p class="fl content_h_logo_text">三级分销的众筹平台</p>
			<p class="fr content_h_r">
				<span class="content_h_r1">100%质量保证</span> <span
					class="content_h_r2">未达成目标全额退款</span> <span class="content_h_r3">全国包邮</span>
			</p>
		</div>
		<div class="clearfix content">
			<div class="content_l fl">
				<img src="<%=basePath%>/images/loginad_06.png">
			</div>
			<div class="content_r fl">
				<p class="content_r_h">找回密码</p>
				<p class="content_r_tip">
					已有账号？<a class="content_r_tip2" href="/returnLogin">立即登录</a>
				</p>
				<form action="/loginRegister/forgetPassword" method="post" id="form_g">
					<p class="content_r_l">
						手机号： <input type="text" class="content_r_tel" id="phone"
							name="loginname">
					</p>
					<p class="content_r_l">
						新密码： <input type="password" class="content_r_tel" id="password"
							name="password">
					</p>
					<p class="content_r_l">
						确认密码： <input type="password" class="content_r_tel" id="password_c">
					</p>
					<%--<p class="content_r_l">--%>
						<%--验证码： <input type="text" class="content_r_mark"> <span--%>
							<%--class="freeget"> <img src="loginRegister/LoadImageGetBackPwd"--%>
							<%--width="148px" height="33px" alt="图片加载失败" id="img"--%>
							<%--onclick="this.src='loginRegister/LoadImageGetBackPwd?time'+(new Date()).getTime();" />--%>
						<%--</span>--%>
					<%--</p>				--%>
					<p class="regist_btn">
						<input type="submit" id="backpwd" value="提交" style="border: none; color: white; background-color: #13b7e6;width: 170px; margin-top: 3px; height: 30px" />
					</p>
				</form>
				<div style="color:red ;text-align: center;font-size: 30px" class="message">${message }</div>
			</div>
		</div>
	</div>
	<!--尾部start-->
	<div class="footer">
		<jsp:include page="/WEB-INF/views/page/footer.jsp"></jsp:include>
	</div>
	<!--尾部end-->
</body>

</html>