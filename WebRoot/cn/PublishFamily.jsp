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
		<title>发布关于我们的信息</title>
		<base href="<%=basePath%>">
		<%@include file="template/Header.jsp" %>
	</head>
	<body>

		<!-- Nav -->
			<nav id="nav" class="skel-layers-fixed">
				<ul>
				    <li><a href="cn/index.jsp">首页</a></li>
					<li class="current"><a href="cn/Family.jsp">关于我们</a></li>
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
									<article class="box page-content">
										<section>
										<form name="CnPublishFamily" action="CnPublishFamily" method="post" enctype="multipart/form-data" onsubmit="return publishFamily();">
    <div style="width:100%;float:left;clear:both;height:auto;margin-top:3%;">
    
    <div style="width:20%;float:left;min-height:40px;">标题:</div>
    <div style="width:80%;float:left;clear:right;min-height:40px;"><input id="title" type="text" name="title" style="width:100%;height:100%;"/><label id="titlemsg" style="color:#cc0000;"></label></div>
    
    <div style="width:20%;float:left;min-height:40px;">选择图片:</div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><input id="image" type="file" name="image" accept="image/*" style="width:50%;height:100%;" multiple="multiple"/><span style="color:#888888">recommend size: width:</span><span style="color:#cc0000;font-weight:bold;">960px</span>&nbsp;<span style="color:#888888">height:</span><span style="color:#cc0000;font-weight:bold;">539px</span><label id="imagemsg" style="color:#cc0000;"></label></div>
    
    <div style="width:20%;float:left;min-height:40px;">完整介绍</div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><script id="container" name="intro" type="text/plain"></script></div>
    
    <div style="width:20%;float:left;min-height:40px;"></div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"></div>
    
    <div style="width:20%;float:left;min-height:40px;">选择一个视频(可选):</div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><input id="video" type="file" name="video" accept="video/*" style="width:50%;height:100%;"/><span style="color:#888888">only support </span><span style="color:#cc0000;font-weight:bold;">mp4</span><span style="color:#888888"> format</span></div>
    
    <div style="width:20%;float:left;min-height:40px;"></div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><input type="submit" value="提交" class="button glow button-rounded button-flat-primary" style="width:20%"/></div>
    
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
	</body>
</html>
