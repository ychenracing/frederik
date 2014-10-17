package cn.edu.fudan.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
public class ModifyHomepage extends HttpServlet {
	String xmlPath=this.getClass().getResource("/").getPath()+"../../en/xml/";
	/**
	 * Constructor of the object.
	 */
	public ModifyHomepage() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session=request.getSession();
			response.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			String validPath = getServletContext().getRealPath("/");
			String relativePath = "en/upload/",filePath = validPath + "en/upload/", fileName = null, title = null;
			StringBuilder imageStringBuilder = new StringBuilder();
			int iteratorI=1;
			Random random = new Random();
			File f = new File(filePath + "image/");
			if (!f.exists()) {
				f.mkdirs();
			}
			f = new File(filePath + "video/");
			if (!f.exists()) {
				f.mkdirs();
			}
			// 为文件对象产生工厂对象。
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(1024 * 1024); // 设置缓冲区的大小，此处为1mb
			factory.setRepository(new File(filePath + "image/")); // 设置上传文件的目的地
			// 产生servlet上传对象
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setSizeMax(1000 * 1024 * 1024);
			@SuppressWarnings("unchecked")
			List<FileItem> list = upload.parseRequest(request); // 取得所有的上传文件信息
			Iterator<FileItem> it = list.iterator();
			while (it.hasNext()) {
				FileItem item = it.next();
				if (!item.isFormField()) { // 不是一个普通的表单对象
					if (item.getFieldName().equals("image")) {
						if(item.getName()!=null&&!"".equals(item.getName())){
						    fileName = item.getName().substring(item.getName().lastIndexOf("."),item.getName().length());
						    fileName = String.valueOf(System.currentTimeMillis()+ random.nextInt(10000))+ fileName;
						    imageStringBuilder.append(relativePath + "image/"+ fileName + ";");
						    File uploadedFile = new File(filePath + "image/",fileName);
						    item.write(uploadedFile);
						    uploadedFile = null;
						}
					}
				} else { // 取得普通的对象[对于像文本框这种类型的使用]
					if ("title".equals(item.getFieldName()))
						title = new String(item.getString().getBytes("ISO-8859-1"), "utf-8");
				}
			}
			if(imageStringBuilder.length()>1)
			{    
				imageStringBuilder.deleteCharAt(imageStringBuilder.length() - 1);
				session.setAttribute("image",imageStringBuilder.toString());
			}
			if(!title.trim().equals(""))
				session.setAttribute("title",title);
			response.sendRedirect("en/ModifyHomepageAction.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getHomepageBanner(){
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		  DocumentBuilder builder;
		  String bannerPath=null;
		try {
			builder = dbf.newDocumentBuilder();
		
		  Document doc = builder.parse(xmlPath+"Homepage.xml"); // 获取到xml文件
		  // 下面开始读取
		  Element root = doc.getDocumentElement(); // 获取根元素
		  NodeList banner = root.getElementsByTagName("homepage");
		  for (int i = 0; i < banner.getLength(); i++) {
			   // 一次取得每一个学生元素
			   Element ss = (Element) banner.item(i);
			   bannerPath=ss.getAttribute("banner");
			   // 创建一个学生的实例
			  }
		  return xmlPath;
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		  /*
		  students_Vector = new Vector();
		  for (int i = 0; i < students.getLength(); i++) {
		   // 一次取得每一个学生元素
		   Element ss = (Element) students.item(i);
		   // 创建一个学生的实例
		   student stu = new student();
		   stu.setSex(ss.getAttribute("性别"));
		   NodeList names = ss.getElementsByTagName("姓名");
		   Element e = (Element) names.item(0);
		   Node t = e.getFirstChild();
		   stu.setName(t.getNodeValue());
		   NodeList ages = ss.getElementsByTagName("年龄");
		   e = (Element) ages.item(0);
		   t = e.getFirstChild();
		   stu.setAge(Integer.parseInt(t.getNodeValue()));
		   students_Vector.add(stu);
		  }*/
		return null;
	}
	
	public static void main(String[] args){
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
