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
	
	<%int id=0;CnModifyHorse modifyHorse=new CnModifyHorse();CnHorse horse=null;Map<String,String> lhm=null;
	String url = request.getHeader("Referer"); //获得前一页的URL
	if(request.getParameter("id")!=null)
	    id=Integer.valueOf(request.getParameter("id"));
	if(id==0)
	    response.sendRedirect(url);
	else
	{
	    horse=modifyHorse.getById(id);
	    if(horse==null||horse.getVideo()==null){
	        String tips=URLEncoder.encode("没有视频!","utf-8");
	        response.sendRedirect("Tips.jsp?tips="+tips);
	        return;
	    }
	    lhm=DataTypeConverter.class.newInstance().convertJsonToMap(horse.getProperty());
	}
	%>
		<title><%=horse.getTitle()%></title>
		<base href="<%=basePath%>">
		<%@include file="template/Header.jsp" %>
	</head>
	<body>
	<%@include file="template/LanguageVersion.jsp"%>
		<!-- Header -->
			<header id="header" style="padding:3em 0 0 0;">
				<div class="logo container">
					<div>
						<h1 id="logo"><%=horse.getTitle()%></h1>
					</div>
				</div>
			</header>

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
			
			

			
			
			
		<!-- Main -->
			<div id="main-wrapper">
				<div id="main" class="container">
					<div class="row">
						<div class="12u">
							<div class="content">
							<!-- Content -->
							
							<video class="video-js" src="<%=horse.getVideo()%>" controls preload="auto" width="100%" height="auto" poster="" >
                                </video>
									<article class="box page-content">

										<header>
											<h4 style="font-size:1.2em!important;"><%=horse.getTitle()%></h4>
											<ul class="meta">
												<li class="icon fa-clock-o"><%=horse.getAddtime()%></li>
											</ul>
										</header>

										<section>
											<div style="width:100%;margin:auto;font-size:1.1em!important;">
											<%for(Map.Entry<String,String> propertyItem:lhm.entrySet()){ %>
											<div style="width:100%;margin:auto;border:1px #c2c1c1 thin;clear:both;">
											<div style="width:40%;display:line-block;float:left;"><%=propertyItem.getKey() %></div>
											<div style="width:60%;display:line-block;float:left;"><%=propertyItem.getValue() %></div>
											</div>
											<%} %>
											</div>
											<p><%=horse.getIntro()%>
											</p>
										</section>

									</article>

							</div>
						</div>
					</div>
					
					<div class="row">
											<div class="12u" style="padding:0 0 0 50px;">
												<ul class="actions">
													<li><a href="cn/Horse.jsp?id=<%=horse.getId()%>" class="button big">相册</a></li>
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
