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
	    <title>浏览项目</title>
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
          <span class="nav_r1 fl"><a href="/toContractProject">发起项目</a></span>
          <span class="nav_r2 fl"><a href="/to_helpUtil">新手帮助</a></span>
        </span>
    </nav>
</div>
<!--头部 结束-->
<!--浏览项目主体start-->
    <div class="s-p-content">
        <div class="s-p-auto auto clearfix" >
            <!--左侧目录start-->
            <form action="project/sortByInforProject" method="post" id="formScan">
            <div class="s-p-side fl" style="height:1027px">
                <dl>
                    <dt class="sort-com">排序&nbsp;|&nbsp;compositor</dt>
                    <dd>
                    	<input type="radio" id="sort1" checked="checked" name="sort" value="byAll" />
                    	<label name="sort" class="checked" for="sort1">综合排序</label>
                    </dd>
                    <dd>
                    	<input type="radio" id="sort2" name="sort" value="byTime" />
                    	<label class="label-sort" name="sort" for="sort2">最新上线</label>
                    </dd>
                    <dd>
                    	<input type="radio" id="sort3" name="sort" value="byMoney" />
                    	<label class="label-sort" name="sort" for="sort3">最高金额</label>
                    </dd>
                    <dd>
                    	<input type="radio" id="sort4" name="sort" value="bySup" />
                    	<label class="label-sort" name="sort" for="sort4">最多支持</label>
                    </dd>
                    <dd>
                    	<input type="radio" id="sort5" name="sort" value="byCol" />
                    	<label class="label-sort" name="sort" for="sort5">最多收藏</label>
                    </dd> 
                    <dt class="sort-con">状态&nbsp;|&nbsp;condition</dt>
                    <dd>
                    	<input type="radio" id="state1" checked="checked" name="state" value="byAllState"/>
                    	<label name="state" class="checked" for="state1">全部</label>
                    </dd>
                    <dd>
                    	<input type="radio" id="state2" name="state" value="byIngState"/>
                    	<label name="state" for="state2">众筹中</label>
                    </dd>
                    <dd>
                    	<input type="radio" id="state3" name="state" value="byStartSate"/>
                    	<label name="state" for="state3">即将开始</label>
                    </dd>
                    <dd>
                    	<input type="radio" id="state4" name="state" value="byOKSate"/>
                   		<label name="state" for="state4">众筹成功</label>
                    </dd>
                 </dl>
            </div>
            </form>
            <!--左侧目录end-->
            <!--主体start-->
 			<div class="s-p-main fl">
 				<h3>暂时没有项目</h3>
 			</div>
			<!--主体end-->
            <div style="width:700px;margin: 0px auto;">
                  <ul class="s-p-index clearfix" style="display:block;margin-left:200px">
                     <li>
                        <label class="s-p-btn s-p-indexall" for="pageBtnFirst">首页</label>
                        <input id="pageBtnFirst" type="hidden" value="1">
                     </li>
                     <li>
                        <label class="s-p-btn s-p-indexall" for="pageBtnPre">上一页</label>
                        <input id="pageBtnPre" type="hidden" value="2">
                     </li>
                     <li>
                        <label class="s-p-btn s-p-indexall" for="pageBtnNext">下一页</label>
                        <input id="pageBtnNext" type="hidden" value="3">
                      </li>
                     <li>
                        <label class="s-p-btn s-p-indexall" for="pageBtnLast">尾页</label>
                        <input id="pageBtnLast" type="hidden" value="4"></li>
                      <%--<li>--%>
                          <%--<input id="pageSize" type="text" name="pageSize" ></li>--%>
                      <%--</li>--%>
                     <li>第<span class="curPage"></span>页/共<span class="totalPage"></span>页</li>
                  </ul>
             </div>   
        </div>  
    </div>
    <!--浏览项目主体end-->
    
<!--尾部start-->
<div class="footer">
    <jsp:include page="/WEB-INF/views/page/footer.jsp"></jsp:include>
</div>
<!--尾部end-->

<script type="text/javascript" src="<%=basePath%>/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/scanproj.js"></script>
<script>
	var user = "${user.fname}"
	if (user != null) {
		$(".lr1").hide()
		$(".zhuxiao").show();
	}
</script>
</body>
</html>
