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
		<title>Manage</title>
		<base href="<%=basePath%>">
		<%@include file="template/Header.jsp" %>
	</head>
	<body>
	<%@include file="template/LanguageVersion.jsp"%>
		<!-- Header -->
			<header id="header" style="padding:3em 0 0 0;">
				<div class="logo container">
					<div>
						<h1><a href="" id="logo">Manage</a></h1>
					</div>
				</div>
			</header>

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
			<div id="main-wrapper">
				<div id="main" class="container">
					<div class="row">
						<div class="12u">
							<div class="content">
							<!-- Content -->
							
									<article class="box page-content">
										<section>
										
										<div class="6u" style="float:left;">
										<div class="managePageDivItem" onmouseover="this.className='managePageDivItemHover'" onmouseout="this.className='managePageDivItem'">
										<a href="en/ModifyHomepage.jsp" target="_blank" class="managePageDivLinkItem">Manage homepage(modify the picture and text)</a>
										</div>
										<div class="managePageDivItem" onmouseover="this.className='managePageDivItemHover'" onmouseout="this.className='managePageDivItem'">
										<a href="en/iframe/ManageFamilyIframe.jsp" target="iframe_family" class="managePageDivLinkItem">Manage About us information</a>
										</div>
										<div class="managePageDivItem" onmouseover="this.className='managePageDivItemHover'" onmouseout="this.className='managePageDivItem'">
										<a href="en/iframe/ManageHorseIframe.jsp" target="iframe_family" class="managePageDivLinkItem">Manage All Horses</a>
										</div>
										<div class="managePageDivItem" onmouseover="this.className='managePageDivItemHover'" onmouseout="this.className='managePageDivItem'">
										<a href="en/iframe/ManageNewsIframe.jsp" target="iframe_family" class="managePageDivLinkItem">Manage All News</a>
										</div>
										<div class="managePageDivItem" onmouseover="this.className='managePageDivItemHover'" onmouseout="this.className='managePageDivItem'">
										<a href="en/ChangePassword.jsp" target="_blank" class="managePageDivLinkItem">Change password</a>
										</div>
										</div>
										<iframe src="en/iframe/ManageHomepageIframe.jsp" name="iframe_family" style="float:right;min-height:200px;" class="6u"></iframe>
										
										
										
										</section>
									</article>

							</div>
						</div>
					</div>
				</div>
			</div>
			        <script src="en/js/jquery-2.1.1.min.js"></script>
<%@include file="template/Footer.jsp"%>
<%@include file="template/LoginCheck.jsp"%>

	</body>
</html>
