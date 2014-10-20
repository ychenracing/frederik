<%@ page language="java" import="java.util.*,cn.edu.fudan.entity.cn.*,cn.edu.fudan.model.cn.*,cn.edu.fudan.function.*" pageEncoding="utf-8"%>
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
		<title>马匹列表</title>
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
					<li class="current"><a href="cn/ListOfHorses.jsp">马匹</a></li>
					<li><a href="cn/ListOfNews.jsp">新闻</a></li>
					<li><a href="cn/SendEmail.jsp">联系我们</a></li>
				</ul>
			</nav>
			
			<!-- Header -->
			<header id="header" style="padding:3em 0 0 0;">
				<div class="logo container">
					<div>
						<h1><a href="" id="logo">马匹列表</a>
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
									List<CnHorse> listHorses=null;
									CnModifyHorse modifyHorse=new CnModifyHorse();
									listHorses=modifyHorse.getAll();
									int i=0,j=1;
									for(CnHorse horseItem:listHorses){
									 %>
										<div class="row">
										
											<div class="12u">
												
												<!-- Feature -->
													<section class="box feature">
														
														<div class="horse-list-item-div">
														<div class="horse-list-item-pic">
														<a href="cn/Horse.jsp?id=<%=horseItem.getId()%>">
														<img class="listHorseImage" src="<%if(horseItem.getCover()!=null)out.print(horseItem.getCover());%>" alt="" />
														</a>
														</div>
														<div class="horse-list-item-text">
														<h3 ><a href="cn/Horse.jsp?id=<%=horseItem.getId()%>"><%=horseItem.getTitle()%></a></h3>
														<p><%=horseItem.getBrief()%></p>
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

		<%@include file="template/Footer.jsp"%>
	</body>
</html>
