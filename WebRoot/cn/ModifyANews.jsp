<%@ page language="java" import="java.util.*,cn.edu.fudan.entity.cn.*,cn.edu.fudan.model.cn.*,cn.edu.fudan.function.*" pageEncoding="utf-8"%>
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
		<title>修改新闻信息</title>
		<base href="<%=basePath%>">
		<% 
String url = request.getHeader("Referer"); //获得前一页的URL
CnNews news=null;
CnModifyNews modifyNews=new CnModifyNews();
int newsId=0;
if(request.getParameter("id")!=null)newsId=Integer.valueOf(request.getParameter("id").trim());
news=modifyNews.getById(newsId);
if(news==null)response.sendRedirect(url);
 %>
		<%@include file="template/Header.jsp" %>
	</head>
	<body>
	
		<!-- Nav -->
			<nav id="nav" class="skel-layers-fixed">
				<ul>
				    <li><a href="cn/index.jsp">首页</a></li>
					<li><a href="cn/Family.jsp">关于我们</a></li>
					<li><a href="cn/ListOfHorses.jsp">马匹</a></li>
					<li class="current"><a href="cn/ListOfNews.jsp">新闻</a></li>
					<li><a href="cn/SendEmail.jsp">联系我们</a></li>
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
										<form name="CnModifyANews" action="CnModifyANews" method="post" enctype="multipart/form-data" >
										<input id="newsId" name="newsId" type="text" style="display:none" value="<%=news.getId()%>"/>
    <div style="width:100%;float:left;clear:both;height:auto;margin-top:3%;">
    
    <div style="width:20%;float:left;min-height:40px;">修改标题:</div>
    <div style="width:80%;float:left;clear:right;min-height:40px;"><input id="title" type="text" name="title" style="width:100%;height:100%;" value="<%=news.getTitle()%>"/></div>
    
    <div style="width:20%;float:left;min-height:40px;">修改封面:</div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><input id="file" type="file" name="image" accept="image/*" style="width:50%;height:100%;"/></div>
    
    <div style="width:20%;float:left;min-height:40px;">修改简介:</div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><textarea id="brief" name="brief" style="width:100%;min-height:100px;resize:none"><%=news.getBrief()%></textarea></div>
    
    <div style="width:20%;float:left;min-height:40px;">修改正文:</div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><script id="container" name="content" type="text/plain"></script></div>
    
    <div style="width:20%;float:left;min-height:40px;"></div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"></div>
    
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
ue.ready(function() {
    ue.setContent(document.getElementById("hiddenIntro").innerHTML);
});
    </script>
		<%@include file="template/Footer.jsp"%>
	</body>
</html>
