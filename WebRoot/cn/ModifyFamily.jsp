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
		<title>修改“关于我们”的信息</title>
		<base href="<%=basePath%>">
		<%@include file="template/Header.jsp" %>
	</head>
	<body>
	<%@include file="template/LanguageVersion.jsp"%>
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
			
			

			
			<div id="hiddenIntro" style="display:none">
			<%
			CnModifyFamily modifyFamily=new CnModifyFamily();
			List<CnFamily> lsf=null;
			lsf=modifyFamily.getAll();
			if(lsf!=null)out.print(lsf.get(0).getIntro());
			else 
			{
			    String tips=URLEncoder.encode("没有\"关于我们\"的信息!","utf-8");
			    response.sendRedirect("Tips.jsp?tips="+tips);
			    return;
			}
			 %>
			</div>
			
		<!-- Main -->
			<div id="main-wrapper">
				<div id="main" class="container">
					<div class="row">
						<div class="12u">
									<article class="box page-content">
										<section>
										<form name="CnModifyFamily" action="CnModifyFamily" method="post" enctype="multipart/form-data" >
    <div style="width:100%;float:left;clear:both;height:auto;margin-top:3%;">
    
    <div style="width:20%;float:left;min-height:40px;">修改标题:</div>
    <div style="width:80%;float:left;clear:right;min-height:40px;"><input id="title" type="text" name="title" style="width:100%;height:100%;" value="<%if(lsf!=null)out.println(lsf.get(0).getTitle());%>"/></div>
    
    <div style="width:20%;float:left;min-height:40px;">修改相册:</div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><a href="cn/ModifyFamilyGallery.jsp" class="button">去更新相册</a></div>
    
    <div style="width:20%;float:left;min-height:40px;">修改介绍</div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><script id="container" name="intro" type="text/plain"></script></div>
    
    <div style="width:20%;float:left;min-height:40px;"></div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"></div>
    
    <div style="width:20%;float:left;min-height:40px;">修改视频:</div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><input id="file" type="file" name="video" accept="video/*" style="width:50%;height:100%;"/></div>
    
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
		<%@include file="template/LoginCheck.jsp"%>
	</body>
</html>
