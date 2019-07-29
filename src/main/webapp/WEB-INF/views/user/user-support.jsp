<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<title>我的支持</title>
<link type="text/css" rel="stylesheet" href="<%=basePath%>/css/user.css">
<link type="text/css" rel="stylesheet" href="<%=basePath%>/css/public.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/xc-s-p.css" />
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
			<span class="nav_r fr"> <span class="nav_r1 fl"><a
					href="/toContractProject">发起项目</a></span> <span class="nav_r2 fl"><a
					href="/to_helpUtil">新手帮助</a></span>
			</span>
		</nav>
	</div>
	<!--头部 结束-->
	<!--主体部分-->
	<div class="main clearfix">
		<!--我的众筹导航-->
		<div class="user_nav fl">
			<a class="data" href="user.html"> <img width="100" height="100"
				src="<%=basePath%>/images/${sessionScope.user.getHeadimg()}" /> <span>${user.getFname()}</span>
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
		<!-- 导航结束 -->
		<!-- 支持页面开始 -->
		<div class="user_content fr">
			<header>我的支持</header>
			<div class="user_main">
				<ul class="project_nav clearfix">
					<li class="user_project_one project_all">我的购买</li>
					<li class="project_lose">公益众筹</li>
				</ul>
			
				<!--我的购买-->
				<ul class="project_content" style="display: block;">
					<li class="project_content_nav">
						<ul class="clearfix">
							<li style="width: 40%;">项目信息</li>
							<li>邀请码</li>
							<li>单价</li>
							<li>当前状态</li>
							<li>操作</li>
						</ul>
					</li>
					<c:forEach items="${support}" var="pay">
						<li class="project_list">
							<ul class="clearfix">
								<li class="project_list_xinxi"><img src="<%=basePath%>/images/${pay.imagelist}" alt="图片"/></li>
								<li class="project_list_xinxi">
									<p class="project_list_xinxi_name">${pay.name }</p>
									<p>达成率${pay.process}%</p>
									<p>剩余时间<time>${pay.dateTime }</time></p>
								</li>
								<li class="project_list_text">${pay.shareCode }</li>
								<li class="project_list_text price">${pay.money }￥</li>
								<li class="project_list_text">${pay.statue }</li>
								<li class="project_list_text support_caozuo">
									<a href="/detailProject?id=${pay.projectid }">查看项目</a>
									<%--<p class="ogistics1">查看物流</p>--%>
									<%--<div class="view_ogistics1" style="display: none;">--%>
										<%--<div class="view_ogistics_nav">--%>
											<%--承运来源：XX速递<br>快递单号：<span>00000000000</span>--%>
										<%--</div>--%>
										<%--<ul>--%>
											<%--<li class="ogistics_new"><span></span>--%>
											<%--<time>2016-05-03&nbsp;&nbsp;21：21:21</time><br>由【福建中转部】发往【福建厦门集美公司】</li>--%>
											<%--<li><span></span>--%>
											<%--<time>2016-05-03&nbsp;&nbsp;21：21:21</time><br>由【福建中转部】发往【福建厦门集美公司】</li>--%>
											<%--<li><span></span>--%>
											<%--<time>2016-05-03&nbsp;&nbsp;21：21:21</time><br>由【福建中转部】发往【福建厦门集美公司】</li>--%>
											<%--<li><span></span>--%>
											<%--<time>2016-05-03&nbsp;&nbsp;21：21:21</time><br>由【福建中转部】发往【福建厦门集美公司】</li>--%>
										<%--</ul>--%>
									<%--</div>--%>
									<p class="comment_add"><input type="hidden" value="${pay.projectid }"/>评价</p>
								</li>
							</ul>
						</li>
					</c:forEach>
				</ul>
				<!--免费试用-->
				<ul class="project_content" style="display: none;">
					<li class="project_content_nav">
						<ul class="clearfix">
							<li style="width: 40%;">项目信息</li>
							<li class="w20">价值</li>
							<li class="w20">当前状态</li>
							<li class="w20">操作</li>
						</ul>
					</li>
					<c:forEach items="${trysupportlist }" var="trylist">
					<li class="project_list">
						<ul class="clearfix">
							<li class="project_list_xinxi"><img src="<%=basePath%>/upload/project/${trylist.project.image}" alt="图片"/></li>
							<li class="project_list_xinxi">
								<p class="project_list_xinxi_name">${trylist.project.name }</p>
								<p>剩余时间<time>${trylist.project.deadline }</time></p>
							</li>
							<li class="project_list_text price w20">${trylist.project.backmoney }￥</li>
							<c:if test="${trylist.iswin ==true }"><li class="project_list_text w20">已抽中</li></c:if>
							<c:if test="${trylist.iswin ==false }"><li class="project_list_text w20">未抽中</li></c:if>
							<c:if test="${trylist.iswin !=true && trylist.iswin !=false}"><li class="project_list_text w20">等待结果</li></c:if>
							<li class="project_list_text support_caozuo">
								<a href="project/todetailProject?id=${trylist.project.id }">查看项目</a>
								<%--<c:if test="${trylist.iswin ==true }">--%>
									<%--&lt;%&ndash;<p class="ogistics2">查看物流</p>&ndash;%&gt;--%>
									<%--&lt;%&ndash;<div class="view_ogistics2" style="display: none;">&ndash;%&gt;--%>
										<%--&lt;%&ndash;<div class="view_ogistics_nav">&ndash;%&gt;--%>
											<%--&lt;%&ndash;承运来源：XX速递<br>快递单号：<span>00000000000</span>&ndash;%&gt;--%>
										<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
										<%--&lt;%&ndash;<ul>&ndash;%&gt;--%>
											<%--&lt;%&ndash;<li class="ogistics_new"><span></span>&ndash;%&gt;--%>
												<%--&lt;%&ndash;<time>2016-05-03&nbsp;&nbsp;21：21:21</time><br>由【福建中转部】发往【福建厦门集美公司】&ndash;%&gt;--%>
											<%--&lt;%&ndash;</li>&ndash;%&gt;--%>
											<%--&lt;%&ndash;<li><span></span>&ndash;%&gt;--%>
												<%--&lt;%&ndash;<time>2016-05-03&nbsp;&nbsp;21：21:21</time><br>由【福建中转部】发往【福建厦门集美公司】&ndash;%&gt;--%>
											<%--&lt;%&ndash;</li>&ndash;%&gt;--%>
											<%--&lt;%&ndash;<li><span></span>&ndash;%&gt;--%>
												<%--&lt;%&ndash;<time>2016-05-03&nbsp;&nbsp;21：21:21</time><br>由【福建中转部】发往【福建厦门集美公司】&ndash;%&gt;--%>
											<%--&lt;%&ndash;</li>&ndash;%&gt;--%>
											<%--&lt;%&ndash;<li><span></span>&ndash;%&gt;--%>
												<%--&lt;%&ndash;<time>2016-05-03&nbsp;&nbsp;21：21:21</time><br>由【福建中转部】发往【福建厦门集美公司】&ndash;%&gt;--%>
											<%--&lt;%&ndash;</li>&ndash;%&gt;--%>
										<%--&lt;%&ndash;</ul>&ndash;%&gt;--%>
									<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
									<%--&lt;%&ndash;<p class="paper_add"><input type="hidden" value="${trylist.project.id }"/>填写试用报告</p>&ndash;%&gt;--%>
								<%--</c:if>--%>
							</li>
						</ul>
					</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>

	<!--项目评价-->
	<div class="bomb_comment_wrapper" id="comment_wrapper" style="display: none;">
		<div class="bomb_comment clearfix">
			<div class="bomb_title clearfix">
				<p class="fl">项目评论</p>
				<span class="close fr"></span>
			</div>
			<form action="" id="commentform" method="post" enctype="multipart/form-data">
				<input type="hidden" value="" id="comment_projectid" name="projectid">
				<input type="hidden" value="${user.id}" id="comment_userid" name="userid">
				<textarea class="comment_input" name="content"></textarea><br/>
				<div class="uploadfile">
	               	<p><span class="uploadbut">上传照片</span>
	                    <input class="uploadpic" type="file" value="" name="commentImage" />
	                    <span class="file_quo">支持jpg、png、gif格式，大小不超过1M，建议尺寸：280*220px</span>           
	                </p>
	                <p class="scanpic"><span>+添加图片</span><img src="" alt="" ></p>
                </div>
			</form>
			<div class="bomb_button fr">
				<input class="input_button_yes" id="commentform_button_yes" type="button" value="确认" />
				<input class="input_button_no" id="commentform_button_no" type="button" value="取消" />
			</div>
		</div>
	</div>

	<!--试用报告-->
	<%--<div class="bomb_paper" id="bomb_paper" style="display: none;">--%>
		<%--<div class="bomb_comment clearfix">--%>
			<%--<div class="bomb_title clearfix">--%>
				<%--<p class="fl">试用报告</p>--%>
				<%--<span class="close fr"></span>--%>
			<%--</div>--%>
			<%--<form action="mysupport/trypaperUpload" id="trypaperform" method="post" enctype="multipart/form-data">--%>
				<%--<input type="hidden" value="" id="trypaper_projectid" name="projectid">--%>
				<%--<textarea class="comment_input" name="commenttext"></textarea><br/>--%>
				<%--<div class="uploadfile">--%>
	               	<%--<p><span class="uploadbut">上传照片</span>--%>
	                    <%--<input class="uploadpic" id="file1" type="file" value="" name="uploadimg" />--%>
	                    <%--<span class="file_quo">支持jpg、png、gif格式，大小不超过1M，建议尺寸：280*220px</span>           --%>
	                <%--</p>--%>
	                <%--<p class="scanpic"><span>+添加图片</span><img src="" alt="" ></p>--%>
                <%--</div>--%>
			<%--</form>--%>
			<%--<div class="bomb_button fr">--%>
				<%--<input class="input_button_yes" id="trypaperform_button_yes" type="button" value="确认" />--%>
				<%--<input class="input_button_no" id="trypaperform_button_no" type="button" value="取消" />--%>
			<%--</div>--%>
		<%--</div>--%>
	<%--</div>--%>

	<!--尾部start-->
	<div class="footer">
		<jsp:include page="/WEB-INF/views/page/footer.jsp"></jsp:include>
	</div>
	<!--尾部end-->
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript">
//项目评价
$(document).ready(function(){
    $(".comment_add").click(function() {
    	var obj=$(this);
    	var id=obj.children("input").val();
        $("#comment_wrapper").show();
        $("#comment_projectid").val(id);
        //alert(id);
        $("#commentform_button_yes").click(function(){
    		var form=new FormData(document.getElementById("commentform"));
   	   	 	$.ajax({
   				type : "post", //使用post方法访问后台
   				url : "/commentUpload", //要访问的后台地址
   				cache:false,	//上传文件不需缓存
   				processData :false,//需设置为false。因为data值是FormData对象，不需要对数据做处理
   				contentType : false,//需设置为false。因为是FormData对象，且已经声明了属性enctype="multipart/form-data"
   				data : form,//要发送的数据  
   				success : function(result) { //data为返回的数据，在这里做数据绑定
   					if (result.code==0){
   						alert(result.msg)
   						$("#comment_wrapper").hide();
   					}else{
   					    console.log(result.code)
   						alert(result.msg)
   					}
   				},
   				error : function() {
   					alert("连接服务器失败！");
   				}
   			});
        })
       
    })
	$(".close").click(function() {
		$("#commentform input").empty();
        $(".scanpic").children("img").empty();
        $("#comment_wrapper").hide();
    })
	$(".input_button_no").click(function() {
        $("#comment_wrapper").hide();
    })
})

//试用报告
$(document).ready(function(){
    $(".paper_add").click(function() {
    	var obj=$(this);
    	var id=obj.children("input").val();
        $("#bomb_paper").show();
        $("#trypaper_projectid").val(id);
        //alert(id);
        $("#trypaperform_button_yes").click(function(){
    		var form=new FormData(document.getElementById("trypaperform"));
    		var actionurl=$("#trypaperform").attr("action");
   	   	 	$.ajax({
   				type : "post", //使用post方法访问后台  
   				dataType : "text", //返回text格式的数据  
   				url : actionurl, //要访问的后台地址
   				cache:false,	//上传文件不需缓存
   				processData :false,//需设置为false。因为data值是FormData对象，不需要对数据做处理
   				contentType : false,//需设置为false。因为是FormData对象，且已经声明了属性enctype="multipart/form-data"
   				data : form,//要发送的数据  
   				success : function(data) { //data为返回的数据，在这里做数据绑定
   					if (data == "true"){
   						alert("填写试用报告成功！")
   						$("#bomb_paper").hide();
   					} else if(data=="false_image"){
   						alert("图片上传失败！")
   					}else if(data=="false_comment"){
   						alert("填写试用报告失败！")
   					}
   				},
   				error : function() {
   					alert("连接服务器失败！");
   				}
   			});
        })
    })
	$(".close").click(function() {
        $("#bomb_paper").hide();
    })
	$(".input_button_no").click(function() {
        $("#bomb_paper").hide();
    })
})
//查看物流
$(document).ready(function(){
    $(".ogistics1").click(function() {
        $(".view_ogistics1").toggle();
    })
	$(".ogistics2").click(function() {
        $(".view_ogistics2").toggle();
    })
})
//显示上传图片
$(document).ready(function(){
	$(".uploadpic").change(function(){
     	$(this).parent().siblings().children("img").attr("src",URL.createObjectURL($(this)[0].files[0])).css({"width":"148px","height":"90px"});
     	$(this).parent().siblings().children("span").html("");
	})
})
</script>
</body>
</html>
