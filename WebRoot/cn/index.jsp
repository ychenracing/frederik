<%@ page language="java" import="java.util.*,cn.edu.fudan.entity.cn.*,cn.edu.fudan.model.cn.*,cn.edu.fudan.function.*,javax.xml.parsers.*,org.w3c.dom.*" pageEncoding="utf-8"%>
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
	<base href="<%=basePath%>">
		<title>首页</title>
		<%@include file="template/Header.jsp" %>
	</head>
	<body class="homepage">
<div id="languageVersion" class="languageVersion">
<a href="en/index.jsp" style="text-decoration:none;color:#ffffff;"><img src="cn/images/flag_mini.jpg"/></a>
</div>
		

		<!-- Nav -->
			<nav id="nav" class="skel-layers-fixed">
				<ul>
				    <li class="current"><a href="cn/index.jsp">首页</a></li>
					<li><a href="cn/Family.jsp">关于我们</a></li>
					<li><a href="cn/ListOfHorses.jsp">马匹</a></li>
					<li><a href="cn/ListOfNews.jsp">新闻</a></li>
					<li><a href="cn/SendEmail.jsp">联系我们</a></li>
				</ul>
			</nav>
		
		
		<%
		  DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		  DocumentBuilder builder;
		  builder = dbf.newDocumentBuilder();
		  Document doc = builder.parse(this.getServletContext().getRealPath("/")+"cn/xml/Homepage.xml"); // 获取到xml文件
		  // 下面开始读取
		  Element root = doc.getDocumentElement(); // 获取根元素
		  
		  NodeList bannerNodeList = root.getElementsByTagName("banner");
		  Element bannerElement=(Element)bannerNodeList.item(0);
		  NodeList bannerPathNodeList = bannerElement.getElementsByTagName("path");
		  Element bannerPathElement = (Element) bannerPathNodeList.item(0);
   	  	  Node bannerPathNode = bannerPathElement.getFirstChild();
   	  	  
   	  	  NodeList welcomeTextNodeList = root.getElementsByTagName("welcome-text");
		  Element welcomeTextElement=(Element)welcomeTextNodeList.item(0);
		  NodeList welcomeTextValueNodeList = welcomeTextElement.getElementsByTagName("text");
		  Element welcomeTextValueElement = (Element) welcomeTextValueNodeList.item(0);
   	  	  Node welcomeTextValue = welcomeTextValueElement.getFirstChild();
		 %>

			
			
			
			<!-- Banner -->
			<div id="banner-wrapper" style="text-align:center;">
			<img id="banner-image-desktop" style="max-width:100%;" src="<%=bannerPathNode.getNodeValue()%>" />
			<img id="banner-image-mobile" style="max-width:100%;" src="<%=bannerPathNode.getNodeValue()%>" />
			</div>
			
			
			
			
		<!-- Main -->
			<div id="main-wrapper" class="homepage-mobile-main-wrapper">
			<section id="homepage-nav" class="homepage-nav" class="box feature">
								    <div class="nav-row"><a href="cn/Family.jsp" class="nav-link">关于我们</a></div>
									<div class="nav-row"><a href="cn/ListOfHorses.jsp" class="nav-link">马匹</a></div>
									<div class="nav-row"><a href="cn/ListOfNews.jsp" class="nav-link">新闻</a></div>
									<div class="nav-row"><a href="cn/SendEmail.jsp" class="nav-link">联系我们</a></div>
							    </section>
				<div id="main" class="container mobile-main-margin" >
					<div class="row double">
						<div class="12u">
							
								<!-- Header -->
								<header id="header" style="padding:2em 0 1em 0;">
									<div class="logo container">
										<div>
										<!--<a href="#" class="image featured"><img src="en/images/racing01.jpg" alt="" /></a>-->
											<h1><a href="" id="logo" style="font-weight:bold;">欢迎</a></h1>
										</div>
									</div>
								</header>
								<section class="box feature homepage-brief" style="padding:0 0 1em 0;font-weight:bold;">
								    <p><%=welcomeTextValue.getNodeValue()%></p>
							    </section>
							    
						</div>
					</div>
					
				</div>
				
			</div>
			
			

		<%@include file="template/Footer.jsp"%>

	</body>
</html>
