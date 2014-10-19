<%@ page language="java" import="java.util.*,java.io.*,cn.edu.fudan.entity.cn.*,cn.edu.fudan.model.cn.*,cn.edu.fudan.function.*,javax.xml.parsers.*,javax.xml.transform.*,javax.xml.transform.dom.*,javax.xml.transform.stream.*,org.w3c.dom.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ModifyHomepageAction</title>
    
	<%@include file="template/Header.jsp" %>

  </head>
  
  <body>
  <%@include file="template/LanguageVersion.jsp"%>
  <% 
            Document document =null; 
            DocumentBuilderFactory   factory = DocumentBuilderFactory.newInstance();      
            DocumentBuilder builder=factory.newDocumentBuilder();      
            document=builder.parse(this.getServletContext().getRealPath("/")+"cn/xml/Homepage.xml");      
            document.normalize();   
   
   //out.println(this.getServletContext().getRealPath("/")+"en/xml/Homepage.xml");
       Node root=document.getDocumentElement();   
      /** 如果root有子元素 */   
      if(root.hasChildNodes())   
       {   
         /** ftpnodes */   
          NodeList ftpnodes = root.getChildNodes();   
         /** 循环取得ftp所有节点 */   
         for (int i=0;i<ftpnodes.getLength();i++)   
          {                         
             NodeList ftplist = ftpnodes.item(i).getChildNodes();   
            for (int k=0;k<ftplist.getLength();k++)   
             {   
               Node subnode = ftplist.item(k);   
              /** 修改path的值为传过来的image值*/   
              if (subnode.getNodeType()==Node.ELEMENT_NODE&&subnode.getNodeName()=="path")   
               {
                   if(session.getAttribute("image")!=null&&!String.valueOf(session.getAttribute("image")).trim().equals(""))
                   {
                   subnode.getFirstChild().setNodeValue(String.valueOf(session.getAttribute("image")));  
                   }
                      
               }  
               if (subnode.getNodeType()==Node.ELEMENT_NODE&&subnode.getNodeName()=="text")   
               {     
                  if(session.getAttribute("title")!=null&&!String.valueOf(session.getAttribute("title")).trim().equals(""))
                  {               
                  subnode.getFirstChild().setNodeValue(String.valueOf(session.getAttribute("title")));
                  }
               } 
             }   
               
          }   
       }
       if(session.getAttribute("image")!=null&&!String.valueOf(session.getAttribute("image")).trim().equals(""))
       {
           session.removeAttribute("image");
       }
       if(session.getAttribute("title")!=null&&!String.valueOf(session.getAttribute("title")).trim().equals(""))
       {               
           session.removeAttribute("title");
       }
       
       /** 将document中的内容写入文件中   */
             TransformerFactory tFactory = TransformerFactory.newInstance();      
             Transformer transformer = tFactory.newTransformer();    
            /** 编码 */   
             transformer.setOutputProperty(OutputKeys.ENCODING, "utf-8");   
             DOMSource source = new DOMSource(document);    
             StreamResult result = new StreamResult(new File(this.getServletContext().getRealPath("/")+"cn/xml/Homepage.xml"));      
             transformer.transform(source, result);
             response.sendRedirect("index.jsp");
   %>
   <%@include file="template/LoginCheck.jsp"%>
  </body>
</html>
