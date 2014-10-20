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
		<title>修改马匹信息</title>
		<% 
String url = request.getHeader("Referer"); //获得前一页的URL
CnHorse horse=null;
CnModifyHorse modifyHorse=new CnModifyHorse();
int horseId=0;
if(request.getParameter("id")!=null)horseId=Integer.valueOf(request.getParameter("id").trim());
horse=modifyHorse.getById(horseId);
if(horse==null)response.sendRedirect(url);
 %>
		<base href="<%=basePath%>">
		<%@include file="template/Header.jsp" %>
	</head>
	<body>
	<%@include file="template/LanguageVersion.jsp"%>
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
			
			

			<div id="hiddenIntro" style="display:none">
			<%=horse.getIntro()%>
			</div>
			
			
		<!-- Main -->
			<div id="main-wrapper">
				<div id="main" class="container">
					<div class="row">
						<div class="12u">
									<article class="box page-content">
										<section>
										<form name="CnModifyAHorse" action="CnModifyAHorse" method="post" enctype="multipart/form-data" >
										<input id="horseId" name="horseId" type="text" style="display:none" value="<%=horse.getId()%>"/>
    <div style="width:100%;float:left;clear:both;height:auto;margin-top:3%;">
    
    <div style="width:20%;float:left;min-height:40px;">修改标题:</div>
    <div style="width:80%;float:left;clear:right;min-height:40px;"><input id="title" type="text" name="title" style="width:100%;height:100%;" value="<%=horse.getTitle()%>"/></div>
    
    <div style="width:20%;float:left;min-height:40px;">修改简介:</div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><textarea id="brief" name="brief" style="width:100%;min-height:100px;resize:none"><%=horse.getBrief()%></textarea></div>
    
    <div style="width:20%;float:left;min-height:40px;">修改封面:</div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><input id="cover" type="file" name="cover" accept="image/*" style="width:50%;height:100%;"/><span style="color:#888888">recommend size: width:</span><span style="color:#cc0000;font-weight:bold;">130px</span>&nbsp;<span style="color:#888888">height:</span><span style="color:#cc0000;font-weight:bold;">130px</span><label id="imagemsg" style="color:#cc0000;"></label></div>
    
    <div style="width:20%;float:left;min-height:40px;">修改相册:</div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><a href="cn/ModifyHorseGallery.jsp?id=<%=horse.getId()%>" class="button">去修改相册</a></div>
    
    <div style="width:20%;float:left;min-height:40px;">修改内容</div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><script id="container" name="intro" type="text/plain"></script></div>
    
    <div style="width:20%;float:left;min-height:40px;"></div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"></div>
    
    <div style="width:20%;float:left;min-height:40px;">修改视频:</div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><input id="file" type="file" name="video" accept="video/*" style="width:50%;height:100%;"/><span style="color:#888888">only support </span><span style="color:#cc0000;font-weight:bold;">mp4</span><span style="color:#888888"> format</span></div>
    <%
    Map<String,String> propertyMap=DataTypeConverter.class.newInstance().convertJsonToMap(horse.getProperty());
    int iteratorI=1;
     %>
    <div style="width:20%;float:left;min-height:40px;">修改属性:</div><input id="propertychildnode" name="propertychildnode" style="display:none" value="<%=propertyMap.keySet().size()%>"/>
    <div id="propertydiv" style="width:80%;float:left;min-height:40px;clear:right;">
    <i class="icon-plus" onmousedown="addproperty()"></i>
    
    
    
    <%for(Map.Entry<String,String> entry:propertyMap.entrySet()){%>
    <div id="propertydiv<%=iteratorI%>" style="width:100%;clear:both;float:left;">
    <input id="propertykey<%=iteratorI%>" type="text" name="propertykey<%=iteratorI%>" style="width:20%;display:line-block;float:left;" value="<%=entry.getKey()%>"/>
    <label style="display:line-block;float:left;vertical-align:middle;padding:auto!important;width:1%;text-align:center;font-size:2em;">:</label>
    <input id="propertyvalue<%=iteratorI%>" type="text" name="propertyvalue<%=iteratorI%>" style="width:20%;display:line-block;float:left;" value="<%=entry.getValue()%>"/>
    <div style="width:2%;float:left;display:line-block;padding:auto;vertical-align:middle;text-align:center;">
    <i class="icon-minus" onmousedown="minusproperty(this.parentNode.parentNode.id)"></i>
    </div>
    
    </div>
    <%iteratorI++;} %>
    
    </div>
    
    <div style="width:20%;float:left;min-height:40px;display:none">sport horse or young horse:</div>
    <div style="width:80%;float:left;min-height:40px;clear:right;display:none"> <input id="sporthorse" checked="true" type="radio" name="sporthorse" value="1"/> sport horse&nbsp;<input id="younghorse" type="radio" name="sporthorse" value="2"/> young horse</div>
    
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
        <script src="cn/js/jquery-2.1.1.min.js"></script>
		<%@include file="template/Footer.jsp"%>
		<%@include file="template/LoginCheck.jsp"%>
	</body>
</html>
