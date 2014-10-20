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
		<title>我的二维码</title>
		<base href="<%=basePath%>">
		<%@include file="template/Header.jsp" %>
	</head>
	<body>
	<%@include file="template/LanguageVersion.jsp"%>
		<!-- Header -->
			<header id="header" style="padding:3em 0 0 0;">
				<div class="logo container">
					<div>
						<h1 id="logo">我的二维码</h1>
					</div>
				</div>
			</header>

		<!-- Nav -->
			<nav id="nav" class="skel-layers-fixed">
				<ul>
				    <li><a href="cn/index.jsp">首页</a></li>
					<li><a href="cn/Family.jsp">关于我们</a></li>
					<li><a href="cn/ListOfHorses.jsp">马匹</a></li>
					<li><a href="cn/ListOfNews.jsp">新闻</a></li>
					<li class="current"><a href="cn/SendEmail.jsp">联系我们</a></li>
				</ul>
			</nav>
			
		<!-- Main -->
			<div id="main-wrapper">
				<div id="main" class="container">
					<div class="row">
						<div class="12u QRCodeDiv">
						<img class="QRCode" src="cn/images/frederik_QRcode.jpg" />
						</div>
					</div>
				</div>
			</div>

		<%@include file="template/Footer.jsp"%>

	</body>
</html>
