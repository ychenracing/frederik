<%@ page language="java" import="java.util.*,cn.edu.fudan.entity.cn.*,cn.edu.fudan.model.cn.*,cn.edu.fudan.function.*,java.net.*" pageEncoding="utf-8"%>
<%
if(session.getAttribute("frederik")==null)
{
String tips=URLEncoder.encode("请先登录!", "utf-8");
response.sendRedirect("Tips.jsp?tips="+tips);
return;
}
else{
}
 %>

