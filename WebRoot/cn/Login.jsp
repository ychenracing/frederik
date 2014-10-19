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
		<title>登录</title>
		<base href="<%=basePath%>">
		<%@include file="template/Header.jsp" %>
	</head>
	<body>
	<%@include file="template/LanguageVersion.jsp"%>
		<!-- Nav -->
			<nav id="nav" class="skel-layers-fixed">
				<ul>
				    <li><a href="cn/index.jsp">首页</a></li>
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
										
										<form name="CnLogin" action="CnLogin" method="post" onsubmit="return loginCheck();">
    <div style="width:100%;float:left;clear:both;height:auto;">
    
    <div class="sendemailTitle1">用户名:</div>
    <div class="sendemailInput1"><input id="username" type="text" name="username" style="width:98%;height:100%;"/><label id="usernamemsg" style="color:#cc0000;"></label></div>
    
    <div class="sendemailTitle1">密码:</div>
    <div class="sendemailInput1"><input id="password" type="password" name="password" style="width:98%;height:100%;"/><label id="passwordmsg" style="color:#cc0000;"></label></div>
    
    <div class="sendemailTitle1 sendemailTitleNone"></div>
    <div class="sendemailInput1"><input type="submit" value="登录" class="button glow button-rounded button-flat-primary" style="width:20%"/></div>
    
    </div>
   </form>
    
    
    
    
										</section>

									</article>
						</div>
					</div>
				</div>
			</div>

		<%@include file="template/Footer.jsp"%>
	</body>
</html>
