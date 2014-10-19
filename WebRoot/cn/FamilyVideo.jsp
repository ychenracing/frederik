<%@ page language="java" import="java.util.*,cn.edu.fudan.entity.cn.*,cn.edu.fudan.model.cn.*,cn.edu.fudan.function.*,java.net.*" pageEncoding="utf-8"%>
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
	cn.edu.fudan.model.cn.CnModifyFamily modifyFamily=new cn.edu.fudan.model.cn.CnModifyFamily();
	CnFamily family=null;
	List<CnFamily> lsf=null;
	String url = request.getHeader("Referer"); //获得前一页的URL
	lsf=modifyFamily.getAll();
	if(lsf==null)
	    response.sendRedirect(url);
	else
	{
	    family=lsf.get(0);
	    String tips=URLEncoder.encode("没有视频!", "utf-8");
	    if(family.getVideo()==null)response.sendRedirect("Tips.jsp?tips="+tips);
	}
	%>
		<title>关于我们</title>
		<base href="<%=basePath%>">
		<%@include file="template/Header.jsp" %>
	</head>
	<body>
	<%@include file="template/LanguageVersion.jsp"%>
		<!-- Header -->
			<header id="header" style="padding:3em 0 0 0;">
				<div class="logo container">
					<div>
						<h1><a href="" id="logo"><%=family.getTitle()%></a></h1>
					</div>
				</div>
			</header>

		<!-- Nav -->
			<nav id="nav" class="skel-layers-fixed">
				<ul>
				    <li><a href="cn/index.jsp">主页</a></li>
					<li class="current"><a href="en/Family.jsp">关于我们</a></li>
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
									<li><a href="cn/Family.jsp" class="button big">相册</a></li>
									<li><input id="Share" type="button" class="button alt big" value="分享" /></li>
									<%@include file="template/ShareBar.jsp" %>
								</ul>
							</div>
					</div>
				</div>
			</div>

		<%@include file="template/Footer.jsp"%>

	</body>
</html>
