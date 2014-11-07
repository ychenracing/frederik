<%@ page language="java" import="java.util.*,cn.edu.fudan.entity.*,cn.edu.fudan.model.*,cn.edu.fudan.function.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<!--
	TXT by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>修改密码</title>
		<base href="<%=basePath%>">
		<%@include file="template/Header.jsp" %>
	</head>
	<body>
	<%@include file="template/LanguageVersion.jsp"%>
		<!-- Nav -->
			<nav id="nav" class="skel-layers-fixed">
				<ul>
				    <li class="current"><a href="cn/index.jsp">首页</a></li>
					<li><a href="cn/Family.jsp">关于我们</a></li>
					<li><a href="cn/ListOfHorses.jsp">马匹</a></li>
					<li><a href="cn/ListOfNews.jsp">新闻</a></li>
					<li><a href="cn/SendEmail.jsp">联系我们</a></li>
				</ul>
			</nav>
			
		<!-- Main -->
			<div id="main-wrapper" style="margin-top:4%;">
				<div id="main" class="container">
					<div class="row">
						<div class="12u">
									<article class="box page-content">
										<section>
										
										<form name="CnModifyPassword" action="CnModifyPassword" method="post" onsubmit="return modifyPasswordCheck();">
    <div style="width:100%;float:left;clear:both;height:auto;">
    
    <div style="width:20%;float:left;min-height:40px;">旧密码:</div>
    <div style="width:80%;float:left;clear:right;min-height:40px;"><input id="oldpassword" type="password" name="oldpassword" style="width:100%;height:100%;"/> <label id="passworderror" style="color:#cc0000;"><%if(session.getAttribute("passworderror")!=null)out.print(session.getAttribute("passworderror"));session.removeAttribute("passworderror"); %></label></div>
    
    <div style="width:20%;float:left;min-height:40px;">新密码:</div>
    <div style="width:80%;float:left;clear:right;min-height:40px;"><input id="newpassword" type="password" name="newpassword" style="width:100%;height:100%;"/></div>
    
    <div style="width:20%;float:left;min-height:40px;">确认新密码:</div>
    <div style="width:80%;float:left;clear:right;min-height:40px;"><input id="confirmpassword" type="password" name="confirmpassword" style="width:100%;height:100%;" onkeyup="confirmPassword()"/><label id="confirmerrormsg" style="color:#cc0000;"></label></div>
    
    <div style="width:20%;float:left;min-height:40px;"></div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><label id="errormsg" style="color:#cc0000;"></label></div>
    
    <div style="width:20%;float:left;min-height:40px;"></div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><input type="submit" value="提交" class="button glow button-rounded button-flat-primary" style="width:20%"/></div>
    
    </div>
   </form>
    
    
    
    
										</section>

									</article>
						</div>
					</div>
				</div>
			</div>
<script type="text/javascript">
    var ue = UE.getEditor('container', {
    autoHeight: true
});
    </script>
            <script src="cn/js/jquery-2.1.1.min.js"></script>
		<%@include file="template/Footer.jsp"%>
		<%@include file="template/LoginCheck.jsp"%>
	</body>
</html>
