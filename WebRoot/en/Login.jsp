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
		<title>Login</title>
		<base href="<%=basePath%>">
		<%@include file="template/Header.jsp" %>
	</head>
	<body>
	<%@include file="template/LanguageVersion.jsp"%>
		<!-- Nav -->
			<nav id="nav" class="skel-layers-fixed">
				<ul>
				    <li><a href="en/index.jsp">Home</a></li>
					<li><a href="en/Family.jsp">About us</a></li>
					<li><a href="en/ListOfHorses.jsp">Horses</a></li>
					<li><a href="en/ListOfNews.jsp">News</a></li>
					<li><a href="en/SendEmail.jsp">Contact us</a></li>
				</ul>
			</nav>
			
		<!-- Main -->
			<div id="main-wrapper" style="margin-top:4%;">
				<div id="main" class="container">
					<div class="row">
						<div class="12u">
									<article class="box page-content">
										<section>
										
										<form name="Login" action="Login" method="post" onsubmit="return loginCheck();">
    <div style="width:100%;float:left;clear:both;height:auto;">
    
    <div class="sendemailTitle1">username:</div>
    <div class="sendemailInput1"><input id="username" type="text" name="username" style="width:98%;height:100%;"/><label id="usernamemsg" style="color:#cc0000;"></label></div>
    
    <div class="sendemailTitle1">password:</div>
    <div class="sendemailInput1"><input id="password" type="password" name="password" style="width:98%;height:100%;"/><label id="passwordmsg" style="color:#cc0000;"></label></div>
    
    <div class="sendemailTitle1"></div>
    <div class="sendemailInput1"><label id="tipsmsg" style="color:#cc0000;"><%if(session.getAttribute("loginerror")!=null){out.println(session.getAttribute("loginerror"));session.removeAttribute("loginerror"); }%></label></div>
    
    <div class="sendemailTitle1 sendemailTitleNone"></div>
    <div class="sendemailInput1"><input type="submit" value="login" class="button glow button-rounded button-flat-primary" style="width:20%"/></div>
    
    </div>
   </form>
    
    
    
    
										</section>

									</article>
						</div>
					</div>
				</div>
			</div>
        <script src="en/js/jquery-2.1.1.min.js"></script>
		<%@include file="template/Footer.jsp"%>
	</body>
</html>
