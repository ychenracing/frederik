<%@ page language="java" import="java.util.*,cn.edu.fudan.entity.*,cn.edu.fudan.model.*,cn.edu.fudan.function.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Delete A Horse</title>
    
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
    delete a horse.
    <%
    String url=request.getHeader("Referer");
    try{
    int horseId=0;
    ModifyHorse modifyHorse=new ModifyHorse();
    if(request.getParameter("id")!=null)
    horseId=Integer.valueOf(request.getParameter("id"));
    if(request.getParameter("delete")!=null&&request.getParameter("delete").equals("true"))modifyHorse.deleteById(horseId);
    }catch(Exception e){
    }
    finally{
    response.sendRedirect(url);
    
    }
     %>
  </body>
</html>
