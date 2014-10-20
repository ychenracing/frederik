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
		<title>News</title>
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
					<li class="current"><a href="en/ListOfNews.jsp">News</a></li>
					<li><a href="en/SendEmail.jsp">Contact us</a></li>
				</ul>
			</nav>
			
			
			<!-- Header -->
			<header id="header" style="padding:3em 0 0 0;">
				<div class="logo container">
					<div>
						<h1><a href="" id="logo">News</a>
                        </h1>
					</div>
				</div>
			</header>
			
			
			
		<!-- Main -->
			<div id="main-wrapper">
				<div id="main" class="container">
					<div class="row double">
						<div class="12u">
									<!-- Features -->
								<section class="box features" >
									<div>
									<%
									List<News> listNews=null;
									ModifyNews modifyNews=new ModifyNews();
									listNews=modifyNews.getAll();
									int i=0,j=1;
									for(News newsItem:listNews){
									 %>
										<div class="row">
										
											<div class="12u">
												
												<!-- Feature -->
													<section class="box feature">
														
														<div class="horse-list-item-div">
														<div class="horse-list-item-pic">
														<a href="en/News&Events.jsp?id=<%=newsItem.getId()%>">
														<img class="listHorseImage" src="<%=newsItem.getCover()%>" alt="" />
														</a>
														</div>
														<div class="horse-list-item-text">
														<h3 ><a href="en/News&Events.jsp?id=<%=newsItem.getId()%>"><%=newsItem.getTitle()%></a></h3>
														<p><%=newsItem.getBrief()%></p>
														</div>
														
														
														</div>
														
														
														
													</section>
										
											</div>
											
										</div>
										<div class="horse-list-item-row"></div>
										<%}%>
										
									</div>
								</section>
						</div>
					</div>
				</div>
			</div>
        <script src="en/js/jquery-2.1.1.min.js"></script>
		<%@include file="template/Footer.jsp"%>
	</body>
</html>
