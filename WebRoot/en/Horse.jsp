<%@ page language="java" import="java.util.*,cn.edu.fudan.entity.*,cn.edu.fudan.model.*,cn.edu.fudan.function.*,java.net.*" pageEncoding="utf-8"%>
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
	
	<%int id=0;ModifyHorse modifyHorse=new ModifyHorse();Horse horse=null;Map<String,String> lhm=null;
	if(request.getParameter("id")!=null){
	    id=Integer.valueOf(request.getParameter("id"));
	}
	if(id==0)
	    return;
	else
	{
	    horse=modifyHorse.getById(id);
	    if(horse==null)
	    {    
	        String tips=URLEncoder.encode("no horse information available!","utf-8");
	        response.sendRedirect("Tips.jsp?tips="+tips);
	        return;
	    }
	    lhm=DataTypeConverter.class.newInstance().convertJsonToMap(horse.getProperty());
	}
	%>
		<title><%=horse.getTitle()%></title>
		<base href="<%=basePath%>">
		<%@include file="template/Header.jsp" %>
	</head>
	<body>
	<%@include file="template/LanguageVersion.jsp"%>
	
	
	
	
	
	
	
	
		<!-- Header -->
			<header id="header" style="padding:3em 0 0 0;">
				<div class="logo container">
					<div>
						<h1 id="logo"><%=horse.getTitle()%></h1>
					</div>
				</div>
			</header>

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
			
			

			
			
			
		<!-- Main -->
			<div id="main-wrapper">
				<div id="main" class="container">
					<div class="row">
						<div class="12u">
							<div class="content">
							<!-- Content -->
							
							<!-- SlidesJS Required: Start Slides -->
  <!-- The container is used to define the width of the slideshow -->
  <div class="container">
    <div id="slides">
    
    <%List<String> lsg=Arrays.asList(horse.getGallery().split(";"));
    for(String gallery:lsg){
     %>
      <a href="<%=gallery%>" style="display:block;height:100%;text-align:center;vertical-align:middle;"><img style="max-width:100%;max-height:100%;" src="<%=gallery%>" alt=""/></a>
      <%} %>
    </div>
  </div>
  <!-- End SlidesJS Required: Start Slides -->

  <!-- SlidesJS Required: Link to jQuery -->
  <script src="en/js/jquery-2.1.1.min.js"></script>
  <!-- End SlidesJS Required -->

  <!-- SlidesJS Required: Link to jquery.slides.js -->
  <script src="en/js/jquery.slides.min.js"></script>
  <!-- End SlidesJS Required -->

  <!-- SlidesJS Required: Initialize SlidesJS with a jQuery doc ready -->
  <script>
    $(function() {
      $('#slides').slidesjs({
        width: 940,
        height: 528,
        navigation: false,
        play: {
            active: false,
            auto: false,
            interval: 4000,
            swap: true
        }
      });
    });
  </script>
  <!-- End SlidesJS Required -->
							
							
							
							
									<article class="box page-content">

										<header>
											<h4 style="font-size:1.2em!important;"><%=horse.getTitle()%></h4>
											<ul class="meta">
												<li class="icon fa-clock-o"><%=horse.getAddtime()%></li>
											</ul>
										</header>

										<section>
											<div style="width:100%;margin:auto;font-size:1.1em!important;">
											<%for(Map.Entry<String,String> propertyItem:lhm.entrySet()){ %>
											<div style="width:100%;margin:auto;border:1px #c2c1c1 thin;clear:both;">
											<div style="width:40%;display:line-block;float:left;"><%=propertyItem.getKey() %></div>
											<div style="width:60%;display:line-block;float:left;"><%=propertyItem.getValue() %></div>
											</div>
											<%} %>
											</div>
											<p><%=horse.getIntro()%>
											</p>
										</section>

									</article>

							</div>
						</div>
					</div>
					
					<div class="row">
											<div class="12u" style="padding:0 0 0 50px;">
												<ul class="actions">
													<li><a href="en/HorseVideo.jsp?id=<%=horse.getId()%>" class="button big">Video</a></li>
													<li><input id="Share" type="button" class="button alt big" value="Share" /></li>
													<div class="12u">
													<%@include file="template/ShareBar.jsp" %>
													</div>
												</ul>
											</div>
										</div>
				</div>
			</div>
<%@include file="template/Footer.jsp"%>

	</body>
</html>
