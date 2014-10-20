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
		<title>Modify gallery of About us</title>
		<base href="<%=basePath%>">
		<% 
String url = request.getHeader("Referer"); //获得前一页的URL
Family family=null;
List<Family> lsf=null;
ModifyFamily modifyFamily=new ModifyFamily();
lsf=modifyFamily.getAll();
family=lsf.get(0);
if(family==null){
response.sendRedirect(url);
return;
}
 %>
		<%@include file="template/Header.jsp" %>
	</head>
	<body>
	<%@include file="template/LanguageVersion.jsp"%>
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
			
			
			
		<!-- Main -->
			<div id="main-wrapper">
				<div id="main" class="container">
					<div class="row">
						<div class="12u">
									<article class="box page-content">
										<section>
										<form name="ModifyFamilyGallery" action="ModifyFamilyGallery" method="post" enctype="multipart/form-data" >
										<input id="familyId" name="familyId" type="text" style="display:none" value="<%=family.getId()%>"/>
    <div style="width:100%;float:left;clear:both;height:auto;margin-top:3%;min-width:1000px">
    
    <div style="width:20%;float:left;min-height:40px;font-weight:bold;">Add new pictures:</div>
    <div style="width:80%;float:left;clear:right;min-height:40px;"><input id="file" type="file" name="image" accept="image/*" style="width:50%;height:100%;" multiple="multiple"/><span style="color:#888888">recommend size: width:</span><span style="color:#cc0000;font-weight:bold;">960px</span>&nbsp;<span style="color:#888888">height:</span><span style="color:#cc0000;font-weight:bold;">539px</span></div>
    
    <div style="width:100%;clear:both;">
    
    
    
    <%
    List<String> imageList=Arrays.asList(family.getGallery().split(";"));
    int imageIterator=1;
    for(String imageItemPath:imageList){
     %>
    
    <!-- item -->
    <div id="imageItemDiv<%=imageIterator%>" style="width:300px;float:left;height:400px;border:#c2c1c1 solid 1px;margin:1px;">
    <div style="width:280px;height:280px;margin:10px;clear:both;">
    <input id="imageItemPath<%=imageIterator%>" name="imageItemPath<%=imageIterator%>" value="<%=imageItemPath%>" style="display:none"/>
    <img src="<%=imageItemPath%>" width="100%" height="100%"/>
    </div>
    <div style="width:100%;height:50px;line-height:50px;vertical-align:middle;padding-left:10px;">
    <span style="display:inline-block;float:left;width:65px;height:50px;line-height:50px;">replace:</span><input id="imageItem<%=imageIterator%>" type="file" name="imageItem<%=imageIterator%>" accept="image/*" style="width:220px;height:50px;line-height:50px;vertical-align:middle;display:inline-block;float:left;margin:auto;"/>
    </div>
    <div style="width:100%;height:50px;line-height:50px;padding-left:10px;">
    <button type="button" class="button" onclick="removePic(this.parentNode.parentNode.id)" style="height:48px;">delete</button>
    </div>
    </div>
    <!-- END item -->
    
    
    <%imageIterator++;} %>
    
    
    </div>
    
    <div style="width:20%;float:left;min-height:40px;clear:left;"></div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"></div>
    
    <div style="width:20%;float:left;min-height:40px;clear:left;"></div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><input type="submit" value="submit" class="button glow button-rounded button-flat-primary" style="width:20%"/></div>
    
    </div>
    </form>
										</section>

									</article>
						</div>
					</div>
				</div>
			</div>
        <script src="en/js/jquery-2.1.1.min.js"></script>
		<%@include file="template/Footer.jsp"%>
		<%@include file="template/LoginCheck.jsp"%>
	</body>
</html>
