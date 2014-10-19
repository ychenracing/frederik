package cn.edu.fudan.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import cn.edu.fudan.entity.News;
import cn.edu.fudan.function.DataTypeConverter;
import cn.edu.fudan.model.ModifyNews;

public class PublishNews extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public PublishNews() {
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
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
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
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		try {
			PrintWriter out = response.getWriter();
			response.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
			String validPath = getServletContext().getRealPath("/");
			String filePath = validPath + "en/upload/image/", fileName = null, title = null,content=null,brief=null;
			String relativePath = "en/upload/image/";
			int cateid = 0;
			Random random = new Random();
			File f = new File(filePath);
			if (!f.exists()) {
				f.mkdirs();
			}
			// 为文件对象产生工厂对象。
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setSizeThreshold(1024 * 4); // 设置缓冲区的大小，此处为4kb
			factory.setRepository(new File(filePath)); // 设置上传文件的目的地
			// 产生servlet上传对象
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setSizeMax(1000 * 1024 * 1024);
			@SuppressWarnings("unchecked")
			List<FileItem> list = upload.parseRequest(request); // 取得所有的上传文件信息
			Iterator<FileItem> it = list.iterator();
			while (it.hasNext()) {
				FileItem item = it.next();
				if (item.isFormField() == false) { // 不是一个普通的表单对象
					if(item.getFieldName().equals("image")){
						fileName = item.getName().substring(item.getName().lastIndexOf("."),item.getName().length());
						fileName = String.valueOf(System.currentTimeMillis()+ random.nextInt(10000))+ fileName;// 文件名不要使用下划线
						File uploadedFile = new File(filePath, fileName);
						item.write(uploadedFile);
					}
				} else { // 取得普通的对象[对于像文本框这种类型的使用]
					if ("title".equals(item.getFieldName()))
						title = new String(item.getString().trim().getBytes("ISO-8859-1"), "utf-8");
					if ("content".equals(item.getFieldName()))
						content = new String(item.getString().getBytes("ISO-8859-1"), "utf-8");
					if ("brief".equals(item.getFieldName()))
						brief = new String(item.getString().trim().getBytes("ISO-8859-1"), "utf-8");
				}
			}
			News news=new News();
			news.setTitle(title);
			news.setBrief(brief);
			news.setContent(content);
			news.setCover(relativePath + fileName);
			news.setAddtime(DataTypeConverter.class.newInstance().getTimestampNow());
			ModifyNews modifyNews=new ModifyNews();
			if(modifyNews.insertNewNews(news)){
				response.sendRedirect("en/ListOfNews.jsp");
			}
			else {
				String tips=URLEncoder.encode("publish failed!","utf-8");
				response.sendRedirect("en/Tips.jsp?tips="+tips);
			}
		} catch (Exception e) {
			//e.printStackTrace();
			try {
				String tips=URLEncoder.encode("error!","utf-8");
				response.sendRedirect("en/Tips.jsp?tips="+tips);
			} catch (IOException e1) {
				//e1.printStackTrace();
			}
		}
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
