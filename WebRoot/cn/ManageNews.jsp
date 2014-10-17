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
		<title>管理新闻</title>
		<base href="<%=basePath%>">
		<%@include file="template/Header.jsp" %>
	</head>
	<body>
	
		<!-- Nav -->
			<nav id="nav" class="skel-layers-fixed">
				<ul>
				    <li><a href="cn/index.jsp">首页</a></li>
					<li><a href="cn/Family.jsp">关于我们</a></li>
					<li><a href="cn/ListOfHorses.jsp">马匹</a></li>
					<li class="current"><a href="cn/ListOfNews.jsp">新闻</a></li>
					<li><a href="cn/SendEmail.jsp">联系我们</a></li>
				</ul>
			</nav>
			
			

			<!-- Header -->
			<header id="header" style="padding:3em 0 0 0;">
				<div class="logo container">
					<div>
						<h1><a href="" id="logo">管理新闻</a>
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
									List<CnNews> listNews=null;
									CnModifyNews modifyNews=new CnModifyNews();
									listNews=modifyNews.getAll();
									int i=0,j=1;
									for(CnNews newsItem:listNews){
									 %>
										<div class="row">
										
											<div class="12u">
												
												<!-- Feature -->
													<section class="box feature">
														
														<div class="horse-list-item-div">
														<div class="horse-list-item-pic">
														<a href="cn/News&Events.jsp?id=<%=newsItem.getId()%>">
														<img width="100%" height="100%" src="<%=newsItem.getCover()%>" alt="" />
														</a>
														</div>
														<div class="horse-list-item-text">
														<h3 ><a href="cn/News&Events.jsp?id=<%=newsItem.getId()%>"><%=newsItem.getTitle()%></a></h3>
														<p><%=newsItem.getBrief()%></p>
														</div>
														<div class="managebuttondiv">
														<a href="cn/DeleteANews.jsp?id=<%=newsItem.getId()%>&delete=true" class="button managebutton alt">删除</a>
														<a href="cn/ModifyANews.jsp?id=<%=newsItem.getId()%>" class="button managebutton">修改</a>
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
