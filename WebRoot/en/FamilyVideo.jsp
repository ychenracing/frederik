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
	
	<%
	cn.edu.fudan.model.ModifyFamily modifyFamily=new cn.edu.fudan.model.ModifyFamily();
	Family family=null;
	List<Family> lsf=null;
	String url = request.getHeader("Referer"); //获得前一页的URL
	lsf=modifyFamily.getAll();
	if(lsf==null)
	    response.sendRedirect(url);
	else
	{
	    family=lsf.get(0);
	    String tips=URLEncoder.encode("no video available!", "utf-8");
	    if(family.getVideo()==null)response.sendRedirect("Tips.jsp?tips="+tips);
	}
	%>
		<title>About us</title>
		<base href="<%=basePath%>">
		<%@include file="template/Header.jsp" %>
	</head>
	<body>
	<%@include file="template/LanguageVersion.jsp"%>
		<!-- Header -->
			<header id="header" style="padding:3em 0 0 0;">
				<div class="logo container">
					<div>
						<h1 id="logo"><%=family.getTitle()%></h1>
					</div>
				</div>
			</header>

		<!-- Nav -->
			<nav id="nav" class="skel-layers-fixed">
				<ul>
				    <li><a href="en/index.jsp">Home</a></li>
					<li class="current"><a href="en/Family.jsp">About us</a></li>
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
							
							<video class="video-js" src="<%=family.getVideo()%>" controls preload="auto" width="100%" height="auto" poster="" >
                                </video>
									<article class="box page-content">

										<%if(family.getIntro()!=null){%>
										<section>
											<p>
											<%out.println(family.getIntro());%>
											</p>
										</section>
										<%} %>

									</article>

							</div>
						</div>
					</div>
					
					<div class="row">
							<div class="12u" style="padding:0 0 0 50px;">
								<ul class="actions">
									<li><a href="en/Family.jsp" class="button big">Gallery</a></li>
									<li><input id="Share" type="button" class="button alt big" value="Share" /></li>
									<%@include file="template/ShareBar.jsp" %>
								</ul>
							</div>
					</div>
				</div>
			</div>

		<%@include file="template/Footer.jsp"%>

	</body>
</html>
