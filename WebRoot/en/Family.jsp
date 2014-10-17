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
	
	
		<title>About us</title>
		<base href="<%=basePath%>">
		<%int id=0;List<Family> lsf=null;
	cn.edu.fudan.model.ModifyFamily modifyFamily=new cn.edu.fudan.model.ModifyFamily();Family family=null;
	lsf=modifyFamily.getAll();
	if(lsf==null)
	{response.sendRedirect("Tips.jsp?tips=no_family_information_available!");
	return;
	}
	family=lsf.get(0);
	%>
		<%@include file="template/Header.jsp" %>
	</head>
	<body>
	
	
	
	
	
	
	
	
	
		<!-- Header -->
			<header id="header" style="padding:3em 0 0 0;">
				<div class="logo container">
					<div>
						<h1><a href="" id="logo"><%=family.getTitle()%></a></h1>
					</div>
				</div>
			</header>

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
							<div class="content">
							<!-- Content -->
							
							<!-- SlidesJS Required: Start Slides -->
  <!-- The container is used to define the width of the slideshow -->
  <div class="container">
    <div id="slides">
    
    <%List<String> lsg=Arrays.asList(family.getGallery().split(";"));
    for(String gallery:lsg){
     %>
      <a href="<%=gallery%>" style="display:block;text-align:center;vertical-align:middle;"><img style="max-width:100%;width:auto;height:auto;max-height:100%;" src="<%=gallery%>" alt=""/></a>
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
										
										<%if(family.getIntro()!=null){%>
										<section>
											<p>
											<%out.println(family.getIntro());%>
											</p>
										</section>
										<%} %>

									</article>

							</div>
						</div>
					</div>
					
					<div class="row">
											<div class="12u" style="padding:0 0 0 50px;">
												<ul class="actions">
													<li><a href="en/FamilyVideo.jsp" class="button big">Video</a></li>
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
