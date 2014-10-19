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
		<title>Modify Homepage information</title>
		<base href="<%=basePath%>">
		<%@include file="template/Header.jsp" %>
	</head>
	<body>
	<%@include file="template/LanguageVersion.jsp"%>
		<!-- Nav -->
			<nav id="nav" class="skel-layers-fixed">
				<ul>
				    <li class="current"><a href="en/index.jsp">Home</a></li>
					<li><a href="en/Family.jsp">About us</a></li>
					<li><a href="en/ListOfHorses.jsp">Horses</a></li>
					<li><a href="en/ListOfNews.jsp">News</a></li>
					<li><a href="en/SendEmail.jsp">Contact us</a></li>
				</ul>
			</nav>
			
		<!-- Main -->
			<div id="main-wrapper" style="margin-top:4%;">
				<div id="main" class="container">
					<div class="row">
						<div class="12u">
									<article class="box page-content">
										<section>
										
										<form name="ModifyHomepage" action="ModifyHomepage" method="post" enctype="multipart/form-data" onsubmit="return modifyHomepageCheck();">
    <div style="width:100%;float:left;clear:both;height:auto;">
    
    <div style="width:20%;float:left;min-height:40px;">text below welcome:</div>
    <div style="width:80%;float:left;clear:right;min-height:40px;"><input id="title" type="text" name="title" style="width:100%;height:100%;"/></div>
    
    <div style="width:20%;float:left;min-height:40px;">picture in homepage:</div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><input id="image" type="file" name="image" accept="image/*" style="width:50%;height:100%;"/></div>
    
    <div style="width:20%;float:left;min-height:40px;"></div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><label id="imagemsg" style="color:#cc0000;"></label></div>
    
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
    </script>
		<%@include file="template/Footer.jsp"%>
		<%@include file="template/LoginCheck.jsp"%>
	</body>
</html>
