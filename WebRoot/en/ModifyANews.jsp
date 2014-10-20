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
		<title>Modify A Horse</title>
		<base href="<%=basePath%>">
		<% 
String url = request.getHeader("Referer"); //获得前一页的URL
News news=null;
ModifyNews modifyNews=new ModifyNews();
int newsId=0;
if(request.getParameter("id")!=null)newsId=Integer.valueOf(request.getParameter("id").trim());
news=modifyNews.getById(newsId);
if(news==null)response.sendRedirect(url);
 %>
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
			
			

			<div id="hiddenIntro" style="display:none">
			<%=news.getContent()%>
			</div>
			
			
		<!-- Main -->
			<div id="main-wrapper">
				<div id="main" class="container">
					<div class="row">
						<div class="12u">
									<article class="box page-content">
										<section>
										<form name="ModifyANews" action="ModifyANews" method="post" enctype="multipart/form-data" >
										<input id="newsId" name="newsId" type="text" style="display:none" value="<%=news.getId()%>"/>
    <div style="width:100%;float:left;clear:both;height:auto;margin-top:3%;">
    
    <div style="width:20%;float:left;min-height:40px;">update title:</div>
    <div style="width:80%;float:left;clear:right;min-height:40px;"><input id="title" type="text" name="title" style="width:100%;height:100%;" value="<%=news.getTitle()%>"/></div>
    
    <div style="width:20%;float:left;min-height:40px;">update cover:</div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><input id="file" type="file" name="image" accept="image/*" style="width:50%;height:100%;"/></div>
    
    <div style="width:20%;float:left;min-height:40px;">update brief:</div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><textarea id="brief" name="brief" style="width:100%;min-height:100px;resize:none"><%=news.getBrief()%></textarea></div>
    
    <div style="width:20%;float:left;min-height:40px;">update content:</div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><script id="container" name="content" type="text/plain"></script></div>
    
    <div style="width:20%;float:left;min-height:40px;"></div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"></div>
    
    <div style="width:20%;float:left;min-height:40px;"></div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><input type="submit" value="submit" class="button glow button-rounded button-flat-primary" style="width:20%"/></div>
    
    </div>
    </form>
										</section>

									</article>
						</div>
					</div>
				</div>
			</div>
<script type="text/javascript">

    var ue = UE.getEditor('container', {
    autoHeight: true
});
ue.ready(function() {
    ue.setContent(document.getElementById("hiddenIntro").innerHTML);
});
    </script>
            <script src="en/js/jquery-2.1.1.min.js"></script>
		<%@include file="template/Footer.jsp"%>
		<%@include file="template/LoginCheck.jsp"%>
	</body>
</html>
