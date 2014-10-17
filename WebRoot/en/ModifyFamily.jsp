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
		<title>Modify Family & Tradition</title>
		<base href="<%=basePath%>">
		<%@include file="template/Header.jsp" %>
	</head>
	<body>
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
			
			

			
			<div id="hiddenIntro" style="display:none">
			<%
			ModifyFamily modifyFamily=new ModifyFamily();
			List<Family> lsf=null;
			lsf=modifyFamily.getAll();
			if(lsf!=null)out.print(lsf.get(0).getIntro());
			else 
			{response.sendRedirect("Tips.jsp?tips=no_Family_information_available");
			return;}
			 %>
			</div>
			
		<!-- Main -->
			<div id="main-wrapper">
				<div id="main" class="container">
					<div class="row">
						<div class="12u">
									<article class="box page-content">
										<section>
										<form name="ModifyFamily" action="ModifyFamily" method="post" enctype="multipart/form-data" >
    <div style="width:100%;float:left;clear:both;height:auto;margin-top:3%;">
    
    <div style="width:20%;float:left;min-height:40px;">modify title:</div>
    <div style="width:80%;float:left;clear:right;min-height:40px;"><input id="title" type="text" name="title" style="width:100%;height:100%;" value="<%if(lsf!=null)out.println(lsf.get(0).getTitle());%>"/></div>
    
    <div style="width:20%;float:left;min-height:40px;">modify gallery:</div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><a href="en/ModifyFamilyGallery.jsp" class="button">go to update gallery</a></div>
    
    <div style="width:20%;float:left;min-height:40px;">modify introduction</div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><script id="container" name="intro" type="text/plain"></script></div>
    
    <div style="width:20%;float:left;min-height:40px;"></div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"></div>
    
    <div style="width:20%;float:left;min-height:40px;">modify video:</div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><input id="file" type="file" name="video" accept="video/*" style="width:50%;height:100%;"/></div>
    
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
		<%@include file="template/Footer.jsp"%>
	</body>
</html>
