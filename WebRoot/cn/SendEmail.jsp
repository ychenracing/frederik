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
		<title>发送邮件</title>
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
					<li class="current"><a href="cn/SendEmail.jsp">联系我们</a></li>
				</ul>
			</nav>
			
			<!-- Header -->
			<header id="header" style="padding:3em 0 0 0;">
				<div class="logo container">
					<div>
						<h1><a href="" id="logo">联系我们-发送邮件</a>
                        </h1>
					</div>
				</div>
			</header>
			
		<!-- Main -->
			<div id="main-wrapper" style="">
				<div id="main" class="container">
					<div class="row">
						<div class="12u">
									<article class="box page-content">
										<section>
										
										<form name="CnSendEmail" action="CnSendEmail" method="post" onsubmit="return sendEmail();">
    <div style="width:100%;float:left;clear:both;height:auto;">
    
    <div class="sendemailTitle1">主题:</div>
    <div class="sendemailInput1"><input id="title" type="text" name="title" style="width:98%;height:100%;"/><label id="titlemsg" style="color:#cc0000;"></label></div>
    
    <div class="sendemailTitle1">你的姓名:</div>
    <div class="sendemailInput1"><input id="name" type="text" name="name" style="width:98%;height:100%;"/><label id="namemsg" style="color:#cc0000;"></label></div>
    
    <div class="sendemailTitle1">你的邮箱或电话:</div>
    <div class="sendemailInput1"><input id="email" type="text" name="email" style="width:98%;height:100%;"/><label id="emailmsg" style="color:#cc0000;"></label></div>
    
    <div class="sendemailTitle1">邮件正文:</div>
    <div class="sendemailInput1"><textarea id="content" name="content" style="width:98%;min-height:200px;resize:none"></textarea><label id="contentmsg" style="color:#cc0000;"></label></div>
    
    <div class="sendemailTitle1 sendemailTitleNone"></div>
    <div class="sendemailInput1"><input type="submit" value="发送" class="button glow button-rounded button-flat-primary" style="width:20%"/></div>
    
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
