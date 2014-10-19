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
		<% 
String url = request.getHeader("Referer"); //获得前一页的URL
Horse horse=null;
ModifyHorse modifyHorse=new ModifyHorse();
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
				    <li><a href="en/index.jsp">Home</a></li>
					<li><a href="en/Family.jsp">About us</a></li>
					<li class="current"><a href="en/ListOfHorses.jsp">Horses</a></li>
					<li><a href="en/ListOfNews.jsp">News</a></li>
					<li><a href="en/SendEmail.jsp">Contact us</a></li>
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
										<form name="ModifyAHorse" action="ModifyAHorse" method="post" enctype="multipart/form-data" >
										<input id="horseId" name="horseId" type="text" style="display:none" value="<%=horse.getId()%>"/>
    <div style="width:100%;float:left;clear:both;height:auto;margin-top:3%;">
    
    <div style="width:20%;float:left;min-height:40px;">update title:</div>
    <div style="width:80%;float:left;clear:right;min-height:40px;"><input id="title" type="text" name="title" style="width:100%;height:100%;" value="<%=horse.getTitle()%>"/></div>
    
    <div style="width:20%;float:left;min-height:40px;">update brief:</div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><textarea id="brief" name="brief" style="width:100%;min-height:100px;resize:none"><%=horse.getBrief()%></textarea></div>
    
    <div style="width:20%;float:left;min-height:40px;">update cover:</div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><input id="cover" type="file" name="cover" accept="image/*" style="width:50%;height:100%;"/><span style="color:#888888">recommend size: width:</span><span style="color:#cc0000;font-weight:bold;">130px</span>&nbsp;<span style="color:#888888">height:</span><span style="color:#cc0000;font-weight:bold;">130px</span><label id="imagemsg" style="color:#cc0000;"></label></div>
    
    <div style="width:20%;float:left;min-height:40px;">go to update gallery:</div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><a href="en/ModifyHorseGallery.jsp?id=<%=horse.getId()%>" class="button">go to update gallery</a></div>
    
    <div style="width:20%;float:left;min-height:40px;">update introduction</div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><script id="container" name="intro" type="text/plain"></script></div>
    
    <div style="width:20%;float:left;min-height:40px;"></div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"></div>
    
    <div style="width:20%;float:left;min-height:40px;">update video:</div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><input id="file" type="file" name="video" accept="video/*" style="width:50%;height:100%;"/><span style="color:#888888">only support </span><span style="color:#cc0000;font-weight:bold;">mp4</span><span style="color:#888888"> format</span></div>
    <%
    Map<String,String> propertyMap=DataTypeConverter.class.newInstance().convertJsonToMap(horse.getProperty());
    int iteratorI=1;
     %>
    <div style="width:20%;float:left;min-height:40px;">update property:</div><input id="propertychildnode" name="propertychildnode" style="display:none" value="<%=propertyMap.keySet().size()%>"/>
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
		<%@include file="template/LoginCheck.jsp"%>
	</body>
</html>
