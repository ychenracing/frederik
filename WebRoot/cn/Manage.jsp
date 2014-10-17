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
		<title>后台管理</title>
		<base href="<%=basePath%>">
		<%@include file="template/Header.jsp" %>
	</head>
	<body>
	
		<!-- Header -->
			<header id="header" style="padding:3em 0 0 0;">
				<div class="logo container">
					<div>
						<h1><a href="" id="logo">后台管理</a></h1>
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
					<li><a href="cn/SendEmail.jsp">联系我们</a></li>
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
										<a href="cn/ModifyHomepage.jsp" target="_blank" class="managePageDivLinkItem">管理首页信息</a>
										</div>
										<div class="managePageDivItem" onmouseover="this.className='managePageDivItemHover'" onmouseout="this.className='managePageDivItem'">
										<a href="cn/iframe/ManageFamilyIframe.jsp" target="iframe_family" class="managePageDivLinkItem">管理关于我们</a>
										</div>
										<div class="managePageDivItem" onmouseover="this.className='managePageDivItemHover'" onmouseout="this.className='managePageDivItem'">
										<a href="cn/iframe/ManageHorseIframe.jsp" target="iframe_family" class="managePageDivLinkItem">管理所有马匹</a>
										</div>
										<div class="managePageDivItem" onmouseover="this.className='managePageDivItemHover'" onmouseout="this.className='managePageDivItem'">
										<a href="cn/iframe/ManageNewsIframe.jsp" target="iframe_family" class="managePageDivLinkItem">管理所有新闻</a>
										</div>
										</div>
										<iframe src="cn/iframe/ManageHomepageIframe.jsp" name="iframe_family" style="float:right;min-height:200px;" class="6u"></iframe>
										
										
										
										</section>
									</article>

							</div>
						</div>
					</div>
				</div>
			</div>
<%@include file="template/Footer.jsp"%>

	</body>
</html>
