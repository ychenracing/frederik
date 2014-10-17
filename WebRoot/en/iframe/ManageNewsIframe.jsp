<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Manage News</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<link rel="stylesheet" href="en/css/frederik.css" />
  </head>
  
  <body>
   <div style="min-height:180px;width:100%">
   <div class="managePageDivItem" onmouseover="this.className='managePageDivItemHover'" onmouseout="this.className='managePageDivItem'">
   <a href="en/PublishAnArticle.jsp" target="_blank" class="managePageDivLinkItem">Publish New News</a>
   </div>
   <div class="managePageDivItem" onmouseover="this.className='managePageDivItemHover'" onmouseout="this.className='managePageDivItem'">
   <a href="en/ManageNews.jsp" target="_blank" class="managePageDivLinkItem">Manage News(delete and modify)</a>
   </div>
   </div>
  </body>
</html>
