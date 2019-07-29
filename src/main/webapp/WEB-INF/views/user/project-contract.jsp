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
    <div class="deproj_ctn">
        <h2>无限道生态平台项目发起人协议</h2>
        <p class="proj_contract" style="font-size:20px">&nbsp;&nbsp;协议编号：甲方：北京汇金技术培训有限公司乙方：甲、乙双方在平等、
        互惠互利的基础上，本着为企业提供合适的人才，降低企业的招聘成本的目标，达成如下合作协议：甲乙双方约定：<br/>
1、 甲乙双方在进行合作业务时，双方须提供营业执照的复印件。 甲方有权要求乙方，提供企业真实的经济性质，<br/>规模大小，发展前景等情况，以便使乙方正确理解委托招聘岗位的要求和客观负责的向候选人介绍聘方的情况。
2、 乙方授权甲方使用其企业名称、LOGO等，用于招聘宣传（甲方不得利用乙方授权相关信息做其他与招聘无关或是损害企业形象的行为）。
3、 乙方应及时、准确将有效的招聘信息提供给甲方，甲方应及时将符<br/>合乙方需求的相关人员资料提供给乙方。
4、 在甲乙双方协商的时限内，甲方通过自身的培训体系，将培<br/>训合格并且符合乙方要求的学员，免费推荐给乙方，录用权在乙方。
5、 乙方对甲方提供的<br/>人员进行面试后的两个星期内应明确通知甲方是否录用。
6、 其他约定事项_
二、不可抗力甲乙双方如果遇到战争，<br/>洪水，地震等非正常因素，使合同无法履行的，双方免责。
三、合同争议的解决办法本合同项下发生的争议，由双方当事人协商<br/>或申请调解解决。协商或调解解决不成的，可提交北京仲裁委员会仲裁。
四、其它本协议未尽事宜应由甲、乙双方本着友好的原则协商解决。本合<br/>同一式二份在双方签字盖章后生效。合同生效后，双方对合同内容的变更或补充应采取书面形式，作为本合同的附件。附件与本合同具有同等的法律效力</p>
        <div class="proj_p"><a class="proj_p0" href="project/toStartProject">阅读并同意协议</a></div>
    </div>
    <!--主体end-->
    
<!--尾部start-->
<div class="footer">
    <jsp:include page="/WEB-INF/views/page/footer.jsp"></jsp:include>
</div>
<!--尾部end-->

<script type="text/javascript" src="<%=basePath%>/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/startProject.js"></script>
</body>
</html>
