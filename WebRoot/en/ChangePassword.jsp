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
		<title>Change your password</title>
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
										
										<form name="ModifyPassword" action="ModifyPassword" method="post" onsubmit="return modifyPasswordCheck();">
    <div style="width:100%;float:left;clear:both;height:auto;">
    
    <div style="width:20%;float:left;min-height:40px;">old password:</div>
    <div style="width:80%;float:left;clear:right;min-height:40px;"><input id="oldpassword" type="password" name="oldpassword" style="width:100%;height:100%;"/> <label id="passworderror" style="color:#cc0000;"><%if(session.getAttribute("passworderror")!=null)out.print(session.getAttribute("passworderror"));session.removeAttribute("passworderror"); %></label></div>
    
    <div style="width:20%;float:left;min-height:40px;">new password:</div>
    <div style="width:80%;float:left;clear:right;min-height:40px;"><input id="newpassword" type="password" name="newpassword" style="width:100%;height:100%;"/></div>
    
    <div style="width:20%;float:left;min-height:40px;">confirm new password:</div>
    <div style="width:80%;float:left;clear:right;min-height:40px;"><input id="confirmpassword" type="password" name="confirmpassword" style="width:100%;height:100%;" onkeyup="confirmPassword()"/><label id="confirmerrormsg" style="color:#cc0000;"></label></div>
    
    <div style="width:20%;float:left;min-height:40px;"></div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><label id="errormsg" style="color:#cc0000;"></label></div>
    
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
            <script src="en/js/jquery-2.1.1.min.js"></script>
		<%@include file="template/Footer.jsp"%>
		<%@include file="template/LoginCheck.jsp"%>
	</body>
</html>
