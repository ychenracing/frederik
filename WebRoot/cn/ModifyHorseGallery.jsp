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
		<title>修改马匹相册</title>
		<base href="<%=basePath%>">
		<% 
String url = request.getHeader("Referer"); //获得前一页的URL
CnHorse horse=null;
CnModifyHorse modifyHorse=new CnModifyHorse();
int horseId=0;
if(request.getParameter("id")!=null)horseId=Integer.valueOf(request.getParameter("id").trim());
horse=modifyHorse.getById(horseId);
if(horse==null)
{response.sendRedirect(url);
return;}
 %>
		<%@include file="template/Header.jsp" %>
	</head>
	<body>
	

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
			
			
			
		<!-- Main -->
			<div id="main-wrapper">
				<div id="main" class="container">
					<div class="row">
						<div class="12u">
									<article class="box page-content">
										<section>
										<form name="CnModifyHorseGallery" action="CnModifyHorseGallery" method="post" enctype="multipart/form-data" >
										<input id="horseId" name="horseId" type="text" style="display:none" value="<%=horse.getId()%>"/>
    <div style="width:100%;float:left;clear:both;height:auto;margin-top:3%;min-width:1000px">
    
    <div style="width:20%;float:left;min-height:40px;font-weight:bold;">添加新图片:</div>
    <div style="width:80%;float:left;clear:right;min-height:40px;"><input id="file" type="file" name="image" accept="image/*" style="width:50%;height:100%;" multiple="multiple"/><span style="color:#888888">recommend size: width:</span><span style="color:#cc0000;font-weight:bold;">960px</span>&nbsp;<span style="color:#888888">height:</span><span style="color:#cc0000;font-weight:bold;">539px</span></div>
    
    <div style="width:100%;clear:both;">
    
    
    
    <%
    List<String> imageList=Arrays.asList(horse.getGallery().split(";"));
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
    <span style="display:inline-block;float:left;width:65px;height:50px;line-height:50px;">替换:</span><input id="imageItem<%=imageIterator%>" type="file" name="imageItem<%=imageIterator%>" accept="image/*" style="width:220px;height:50px;line-height:50px;vertical-align:middle;display:inline-block;float:left;margin:auto;"/>
    </div>
    <div style="width:100%;height:50px;line-height:50px;padding-left:10px;">
    <button type="button" class="button" onclick="removePic(this.parentNode.parentNode.id)" style="height:48px;">删除</button>
    </div>
    </div>
    <!-- END item -->
    
    
    <%imageIterator++;} %>
    
    
    </div>
    
    <div style="width:20%;float:left;min-height:40px;clear:left;"></div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"></div>
    
    <div style="width:20%;float:left;min-height:40px;clear:left;"></div>
    <div style="width:80%;float:left;min-height:40px;clear:right;"><input type="submit" value="提交" class="button glow button-rounded button-flat-primary" style="width:20%"/></div>
    
    </div>
    </form>
										</section>

									</article>
						</div>
					</div>
				</div>
			</div>

		<%@include file="template/Footer.jsp"%>
	</body>
</html>
