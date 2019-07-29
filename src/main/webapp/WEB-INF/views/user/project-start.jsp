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
	<title>发起项目</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/public.css" />
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
        <span class="nav_r fr">
          <span class="nav_r1 fl active"><a href="/toContractProject">发起项目</a></span>
          <span class="nav_r2 fl"><a href="/to_helpUtil">新手帮助</a></span>
        </span>
    </nav>
</div>
<!--头部 结束-->
    <!--主体start-->
    <form action="project/addProject" method="post" id="projectForm" enctype="multipart/form-data">
    <!--第一步-->
    <div class="deproj_ctn step1">
        <!--项目进度条start-->
        <div class="deproj_head">
            <div class="deproj_line"></div>
            <div class="deproj_prcs clearfix">
                <div class="d_prcs"><p><span class="d_prcs1 d_pactive">1</span><span class="d_prcs2">项目及发起人信息</span></p></div>
                <div class="d_prcs"><p><span class="d_prcs1">2</span><span class="d_prcs2">回报设置</span></p></div>
                <div class="d_prcs"><p><span class="d_prcs1">3</span><span class="d_prcs2">确认信息</span></p></div>
            </div>
        </div>
        <!--项目进度条end-->
        <div class="deproj_body">
            <h4>项目发起人联系信息</h4>
            <%--<input type="hidden" name="userid" value= ${user.id} />--%>
            <dl>
                <dt>项目信息</dt>
                <dd class="clearfix">
                    <span class="proj_inf">众筹类型：</span>
                   	<c:forEach items="${types}" var="type">
	                   	<input  id="style${type.id}" class="proj_inf_inp style_normal" type="radio" name="typeid" value= ${type.id} />
	                    <label for="${type.id}">${type.name}</label>
                    </c:forEach>
                </dd>
                <dd class="clearfix">
                    <span class="proj_inf">选择分类：</span>
                    <c:forEach items="${kinds}" var="kind">
                    	<input id="classify${kind.id}" class="proj_inf_inp" type="radio" name="kindid" value="${kind.id}" />
                        <label for="classify${kind.id}">${kind.name}</label>
                    </c:forEach>
                </dd>
                <dd class="clearfix">
                    <span class="proj_inf">项目名称：</span>
                    <input class="proj_name" type="text" name="name" maxlength="40" placeholder="项目名称不超过20个字" />
                </dd>
                <dd class="clearfix">
                    <span class="proj_inf">项目简介：</span>
                    <textarea class="proj_brief" name="introduce" maxlength="100" placeholder="简单介绍一下你的项目，不超过50个字"></textarea>
                </dd>
                <dd class="clearfix">
                    <span class="proj_inf">列表图片：</span>
                    <div class="uploadfile">
                        <p><span class="uploadbut">上传照片</span>
                            <input class="uploadpic" id="file1" type="file" value="上传照片" name="file1" />
                            <span class="file_quo">支持jpg、png、gif格式，大小不超过1M，建议尺寸：280*220px</span>
                            <%--<input class="fileList" type="hidden" name="imagelist" value="" />--%>
                        </p>
                        <p class="scanpic"><span>+Add Image</span><img src="" alt="" ></p>
                    </div>
                </dd>
                <dd class="clearfix">
                    <span class="proj_inf">项目图片：</span>
                    <div class="uploadfile">
                        <p><span class="uploadbut">上传照片</span>
                            <input class="uploadpic" id="file2" type="file" value="上传照片" name="file2" />
                            <span class="file_quo">支持jpg、png、gif格式，建议尺寸：780*400px</span>
                            <%--<input class="fileImage" type="hidden" name="image" value=""/>--%>
                        </p>
                        <p class="scanpic"><span>+Add Image</span><img src="" alt="" ></p>
                    </div>
                </dd>
                <dd class="clearfix">
                    <span class="proj_inf">视频介绍：</span>
                    <input class="proj_url" type="text" name="detailvido" placeholder="填写视频链接" />
                </dd>
                <%--<dd class="clearfix">--%>
                    <%--<span class="proj_inf">项目详情：</span>--%>
                    <%--<div class="uploadfile">--%>
                        <%--<p><span class="uploadbut">上传照片</span>--%>
                            <%--<input class="uploadpic" id="file3" type="file" value="上传照片" name="file" />--%>
                            <%--<span class="file_quo">支持jpg、png、gif格式，建议尺寸：760*不限px</span>--%>
                            <%--<input class="fileDetail" type="hidden" name="project.detail" value=""/>--%>
                        <%--</p>--%>
                        <%--<p class="scanpic"><span>+Add Image</span><img src="" alt="" ></p>--%>
                    <%--</div>--%>
                <%--</dd>--%>
                <dd class="clearfix">
                    <span class="proj_inf">规则说明：</span>
                    <textarea class="rule_rep" name="rule" placeholder="填写规则说明"></textarea>
                </dd>
                <dt>发起人信息</dt>
                <input type="hidden" name="userid" value="${user.id}"/>
                <dd class="clearfix">
                    <span class="proj_inf">个人(团队)名称：</span>
                    <input type="text" class="team_brief" name="user.fname" placeholder="一句简介不超过40个字" maxlength="40" value="${user.fname}" readonly="readonly"/>
                </dd>
                <dd class="clearfix">
                    <span class="proj_inf">详细介绍：</span>
                    <textarea class="team_detail" name="user.introduce" readonly="readonly" >${user.introduce}</textarea>
                </dd>
                <dd class="clearfix">
                    <span class="proj_inf">联系电话：</span>
                    <input type="text" class="team_tel" name="user.phone" value="${user.phone}" readonly="readonly"/>
                </dd>
            </dl>
            <div class="proj_p"><input class="input_button_yes go_step2" type="button" value="下一步"/></div>
        </div>
    </div>
	<!--第二步-->
	<div class="deproj_ctn step2" style="display: none;">
		<!--项目进度条start-->
		<div class="deproj_head">
			<div class="deproj_line"></div>
			<div class="deproj_prcs clearfix">
				<div class="d_prcs"><p><span class="d_prcs1">1</span><span class="d_prcs2">项目及发起人信息</span></p></div>
				<div class="d_prcs"><p><span class="d_prcs1 d_pactive">2</span><span class="d_prcs2">回报设置</span></p></div>
				<div class="d_prcs"><p><span class="d_prcs1">3</span><span class="d_prcs2">确认信息</span></p></div>
			</div>
		</div>
		<!--项目进度条end-->
		<div class="deproj_body">
			<h4>回报设置</h4>
			<dl>
				<dt>回报设置</dt>
				<dd class="clearfix">
					<span class="proj_inf">回报类型：</span> 
					<input id="backType1" class="proj_inf_inp"type="radio" name="backtype" value="实物回报" />
					<label for="backType1">实物回报</label>
					<input id="backType2" class="proj_inf_inp" type="radio" name="backtype" value="虚拟回报" />
					<label for="backType2">虚拟回报</label>
				</dd>
				<dd class="clearfix">
					<span class="proj_inf">筹资金额：</span> 
					<input class="proj_name1" type="text" name="needmoney" placeholder="" /> <label class="pj_unit">元</label>
				</dd>
				<dd class="clearfix">
					<span class="proj_inf">支持金额：</span>
					<input class="proj_name1" type="text" name="backmoney" placeholder="" /><label class="pj_unit">元</label>
				</dd>
				<dd class="clearfix">
					<span class="proj_inf">回报内容：</span>
					<textarea class="proj_brief" name="backcontent" maxlength="200" placeholder="简单介绍一下你的项目，不超过200个字"></textarea>
				</dd>
				<dd class="clearfix">
                    <span class="proj_inf">众筹结束时间：</span>
                    <input class="proj_url" type="date" name="deadline" width="200px"/>
                    <span class="file_quo">1万以下为30天，1万-2万为60天，2万-4万为90天，4万以上为120天</span>
                </dd>
				<dd class="clearfix">
					<span class="proj_inf">说明图片：</span>
					<div class="uploadfile">
						<p>
							<span class="uploadbut">上传照片</span>
							<input class="uploadpic" id="file4" type="file" value="上传照片" name="file3" />
							<span class="file_quo">支持jpg、png、gif格式，大小不超过1M，建议尺寸：280*220px</span>
                            <%--<input class="fileBackImage" type="hidden" name="backimage" value=""/>--%>
						</p>
						<p class="scanpic"><span>+Add Image</span><img src="" alt=""></p>
					</div>
				</dd>
				<dd class="clearfix">
					<span class="proj_inf">运费：</span>
					<input class="proj_name1" type="text" name="sendmoney" value="0"/>
					<label class="pj_unit">元&nbsp;&nbsp;(“0”为包邮)</label>
				</dd>
				<dd class="clearfix">
					<span class="proj_inf">发票：</span>
					<input id="ticketNo" class="proj_inf_inp" type="radio" name="isticket" value="否" />
					<label for="ticketNo">不可开发票</label>
					<input id="ticketYes" class="proj_inf_inp" type="radio" name="isticket" value="是" />
					<label for="ticketYes">可开发票(包括个人发票和自定义抬头发票)</label>
				</dd>
				<dd class="clearfix">
					<span class="proj_inf">回报时间：</span>
					<p class="repay_time">
						项目结束后 <input class="rep_time" type="text" name="backtime" />天，向支持者发送回报
					</p>
				</dd>
			</dl>
			<div class="proj_p clearfix">
				<input class="input_button_yes fl go_step3" type="button" value="下一步" />
				<input class="input_button_no fr go_step1" type="button" value="上一步" />
			</div>
		</div>
	</div>
	<!--第三步-->
    <div class="deproj_ctn step3" style="display:none;">
        <!--项目进度条start-->
        <div class="deproj_head">
            <div class="deproj_line"></div>
            <div class="deproj_prcs clearfix">
                <div class="d_prcs"><p><span class="d_prcs1">1</span><span class="d_prcs2">项目及发起人信息</span></p></div>
                <div class="d_prcs"><p><span class="d_prcs1">2</span><span class="d_prcs2">回报设置</span></p></div>
                <div class="d_prcs"><p><span class="d_prcs1 d_pactive">3</span><span class="d_prcs2">确认信息</span></p></div>
            </div>
        </div>
        <!--项目进度条end-->
        <div class="deproj_body">
            <h4>确认信息</h4>
            <p class="deproj_confirm">请先预览确认信息，提交后不能进行更改了哦</p>
            <div class="proj_p clearfix">
                <!-- <a class="input_button_yes fl" target="_blank" href="projectdetail.html">预览</a> -->
                <%--<input class="input_button_yes fl submitBtn newsee" type="button" value="预览"/>--%>
                <%--<input class="hidinput" type="hidden" name="submitType" value="submit">--%>
                <input class="input_button_yes fl submitBtn OKsubmit" onclick="addProject()" type="button" value="提交"/>
                <input class="input_button_no fr go_step2" type="button" value="上一步"/>
            </div>
        </div>
    </div>
    </form>
    <!--主体end-->
<!--尾部start-->
<div class="footer">
    <jsp:include page="/WEB-INF/views/page/footer.jsp"></jsp:include>
</div>
<!--尾部end-->

<script type="text/javascript" src="<%=basePath%>/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/startProject.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/dropzone.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/messages_zh.min.js"></script>
<script>
    $(function(){
        $("#projectForm").validate({
            rules: {
                typeid: "required",
                kindid: "required",
                name: {
                    required: true,
                    minlength: 2,
                    maxlength: 20
                },
                introduce: {
                    required: true,
                    minlength: 2,
                    maxlength: 100
                },
                rule: {
                    required: true,
                    minlength: 2,
                    maxlength: 100
                },
                image: "required",
                imagelist: "required",
                needmoney: "required",
                backmoney: "required",
                backcontent: {
                    required: true,
                    minlength: 2,
                    maxlength: 100
                },
                backimage: "required",
                backtime: "required",
                sendmoney: "required",
                deadline: "required",
                isticket: "required",
            },
            messages: {
                typeid: "请选择众筹类型",
                kindid: "请选择众筹类别",
                name: {
                    required: "请输入项目名",
                    minlength: "项目名不能小于两个字符",
                    maxlength: "项目名不能多于20个字符"
                },
                introduce: {
                    required: "请输入项目介绍",
                    minlength: "项目介绍不能小于2个字符",
                    maxlength: "项目介绍不能多于100个字符"
                },
                rule: {
                    required: "请输入项目规则",
                    minlength: "项目规则不能小于两个字符",
                    maxlength: "项目规则不能多于100个字符"
                },
                image: "请选择项目图片",
                imagelist: "请选择列表图片",
                needmoney: "请输入众筹金额",
                backmoney: "请输入支持金额",
                backcontent: {
                    required: "请输入回报内容",
                    minlength: "回报内容不能小于两个字符",
                    maxlength: "回报内容不能多于100个字符"
                },
                backimage: "请选择回报物品图片",
                backtime: "请输入回报时间",
                sendmoney: "请输入运费",
                deadline: "请选择众筹结束时间",
                isticket: "请选择是否可以开发票",
            }
        });
    });
    function addProject(){
        var form = new FormData(document.getElementById("projectForm"));
        $.ajax({
            url:"/project/addProject",
            type:"post",
            data:form,
            processData:false,
            contentType:false,
            success:function(data){
                console.log(data)
                alert(data.msg)
                location.replace("/toContractProject")
            },
            error:function(e){
                alert("add failed!");
                location.replace("/toContractProject")
            }
        });
    }
</script>
</body>
</html>
