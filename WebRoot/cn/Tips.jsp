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
		<title><%if(request.getParameter("tips")!=null)out.println(new String(URLDecoder.decode(request.getParameter("tips"),"utf-8").getBytes("iso-8859-1"), "utf-8"));%></title>
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
					<li><a href="cn/ListOfNews.jsp">新闻</a></li>
					<li><a href="cn/SendEmail.jsp">联系我们</a></li>
				</ul>
			</nav>
			
			<!-- Header -->
			<header id="header" style="padding:3em 0 0 0;">
				<div class="logo container">
					<div>
						<h1><a href="" id="logo"><%if(request.getParameter("tips")!=null)out.println(new String(URLDecoder.decode(request.getParameter("tips"),"utf-8").getBytes("iso-8859-1"), "utf-8"));%></a>
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
									<%if(request.getParameter("tips")!=null)out.println(new String(URLDecoder.decode(request.getParameter("tips"),"utf-8").getBytes("iso-8859-1"), "utf-8"));%>
									</div>
								</section>
						</div>
					</div>
				</div>
			</div>

		<%@include file="template/Footer.jsp"%>
	</body>
</html>
