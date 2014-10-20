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
		<title>Manage Horses</title>
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
					<li class="current"><a href="en/ListOfHorses.jsp">Horses</a></li>
					<li><a href="en/ListOfNews.jsp">News</a></li>
					<li><a href="en/SendEmail.jsp">Contact us</a></li>
				</ul>
			</nav>
			
			<!-- Header -->
			<header id="header" style="padding:3em 0 0 0;">
				<div class="logo container">
					<div>
						<h1><a href="" id="logo">Manage Horses</a>
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
									List<Horse> listHorses=null;
									ModifyHorse modifyHorse=new ModifyHorse();
									listHorses=modifyHorse.getAll();
									int i=0,j=1;
									for(Horse horseItem:listHorses){
									 %>
										<div class="row">
										
											<div class="12u">
												
												<!-- Feature -->
													<section class="box feature">
														
														<div class="horse-list-item-div">
														<div class="horse-list-item-pic">
														<a href="en/Horse.jsp?id=<%=horseItem.getId()%>">
														<img width="100%" height="100%" src="<%if(horseItem.getCover()!=null)out.print(horseItem.getCover());%>" alt="" />
														</a>
														</div>
														<div class="horse-list-item-text">
														<h3 ><a href="en/Horse.jsp?id=<%=horseItem.getId()%>"><%=horseItem.getTitle()%></a></h3>
														<p><%=horseItem.getBrief()%></p>
														</div>
														<div class="managebuttondiv">
														<a href="en/DeleteAHorse.jsp?id=<%=horseItem.getId()%>&delete=true" class="button managebutton alt">delete</a>
														<a href="en/ModifyAHorse.jsp?id=<%=horseItem.getId()%>" class="button managebutton">modify</a>
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
		<%@include file="template/LoginCheck.jsp"%>
	</body>
</html>
