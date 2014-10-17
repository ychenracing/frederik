<%@ page language="java" import="java.util.*,cn.edu.fudan.entity.*,cn.edu.fudan.model.*,cn.edu.fudan.function.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Delete A News</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    delete a news.
    <%
    String url=request.getHeader("Referer");
    try{
    int newsId=0;
    ModifyNews modifyNews=new ModifyNews();
    if(request.getParameter("id")!=null)
    newsId=Integer.valueOf(request.getParameter("id"));
    if(request.getParameter("delete")!=null&&request.getParameter("delete").equals("true"))modifyNews.deleteById(newsId);
    }catch(Exception e){
    }
    finally{
    response.sendRedirect(url);
    
    }
     %>
  </body>
</html>
