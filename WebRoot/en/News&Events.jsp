<%@ page language="java" import="java.util.*,cn.edu.fudan.entity.*,cn.edu.fudan.model.*,cn.edu.fudan.function.*,java.net.*" pageEncoding="utf-8"%>
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
	<%int newsId=0;
	ModifyNews modifyNews=new ModifyNews();
	List<News> lsnews=null;
	News news=null;
	News currentNews=null;
	  if(request.getParameter("id")==null){
	     newsId=0;
	  }
	  else{
	      newsId=Integer.valueOf(request.getParameter("id"));
	  }
	  if(newsId!=0){
	      currentNews=modifyNews.getById(newsId);
	  }
	  if(currentNews==null){
	  String tips=URLEncoder.encode("no news choosed!", "utf-8");
	  response.sendRedirect("Tips.jsp?tips=no_news_choosed");
	  return;
	  }
	  %>
		<title><%=currentNews.getTitle()%></title>
		<base href="<%=basePath%>">
		<%@include file="template/Header.jsp" %>
	</head>
	<body>
<%@include file="template/LanguageVersion.jsp"%>
		<!-- Header -->
			<header id="header" style="padding:3em 0 0 0;">
				<div class="logo container">
					<div>
						<h1><a href="" id="logo"><%=currentNews.getTitle()%></a></h1>
					</div>
				</div>
			</header>

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
		
		<!-- Main -->
			<div id="main-wrapper">
				<div id="main" class="container">
					<div class="row">
						<div class="3u">
							<div class="sidebar">
							
								<!-- Sidebar -->
							
									<!-- Recent Posts -->
										<section>
											<h2 class="major"><span>Recent Posts</span></h2>
											<ul class="divided">
											<%
											lsnews=modifyNews.getByLimit(0,2);
											if(lsnews!=null){
											for(News newsItem:lsnews){
											 %>
												<li>
													<article class="box post-summary">
														<h3><a href="en/News&Events.jsp?id=<%=newsItem.getId()%>">
														<%=newsItem.getTitle()%>
														</a></h3>
														<ul class="meta">
															<li class="icon fa-clock-o">
															<%=newsItem.getAddtime()%>
															</li>
														</ul>
													</article>
												</li>
												<%}} %>
											</ul>
											
											<a href="en/ListOfNews.jsp" class="button alt">See More</a>
											
										</section>
										<%lsnews=null;
										lsnews=modifyNews.getByLimit(2,1);
										if(lsnews!=null){
										news=null;
										news=lsnews.get(0);
										 %>
									<!-- Something -->
										<section>
											<h2 class="major"><span>
											<%=news.getTitle()%>
											</span></h2>
											<a href="en/News&Events.jsp?id=<%=news.getId()%>" class="image featured">
											<img src="<%=news.getCover()%>" alt="" />
											</a>
											<p>
											<%=news.getBrief()%>
											</p>
											<a href="en/News&Events.jsp?id=<%=news.getId()%>" class="button alt">Learn more</a>
										</section>
										<%} %>
										
									<%lsnews=null;
										lsnews=modifyNews.getByLimit(3,1);
										if(lsnews!=null){
										news=null;
										news=lsnews.get(0);
										 %>
									<!-- Something -->
										<section>
											<h2 class="major"><span>
											<%=news.getTitle()%>
											</span></h2>
											<p>
											<%=news.getBrief()%>
											</p>
											<a href="en/News&Events.jsp?id=<%=news.getId()%>" class="button alt">Learn more</a>
										</section>
										<%} %>
							</div>
						</div>
						<div class="9u skel-cell-important">
							<div class="content content-right">
							
								<!-- Content -->
						
									<article class="box page-content">

										<header>
											<h3>
											<%=currentNews.getTitle()%>
											</h3>
											
											<ul class="meta">
												<li class="icon fa-clock-o">
												<%=currentNews.getAddtime()%>
												</li>
											</ul>
										</header>
										<section>
											<!-- <div style="width:100%;height:auto;">
											<img src="<%=currentNews.getCover()%>" width="100%" alt="" />
											</div>
											 -->
											<p>
											<%=currentNews.getContent()%>
											</p>
										</section>
									</article>
									<div class="row">
											<div class="12u" style="padding:0 0 0 50px;">
												<ul class="actions">
													<li><input id="Share" type="button" class="button alt big" value="Share" /></li>
													<div class="12u">
													<%@include file="template/ShareBar.jsp" %>
													</div>
												</ul>
											</div>
										</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		<%@include file="template/Footer.jsp"%>

	</body>
</html>
