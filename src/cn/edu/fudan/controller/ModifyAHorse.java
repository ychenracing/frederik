package cn.edu.fudan.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import cn.edu.fudan.entity.Horse;
import cn.edu.fudan.function.DataTypeConverter;
import cn.edu.fudan.model.ModifyHorse;

public class ModifyAHorse extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ModifyAHorse() {
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
			String url = request.getHeader("Referer"); //获得前一页的URL
			response.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			String validPath = getServletContext().getRealPath("/");
			int sportoryoung=0,horseId=0;
			String relativePath = "en/upload/",filePath = validPath + "en/upload/", fileName = null, cover=null, title = null, brief = null, intro = null, videoPath = null, videoRelativePath = null;
			StringBuilder imageStringBuilder = new StringBuilder();
			Map<String,String> propertyMap=new LinkedHashMap<String,String>();
			Map<String,String> propertyKeyMap=new LinkedHashMap<String,String>();
			Map<String,String> propertyValueMap=new LinkedHashMap<String,String>();
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
						fileName = item.getName().substring(item.getName().lastIndexOf("."),item.getName().length());
						fileName = String.valueOf(System.currentTimeMillis()+ random.nextInt(10000))+ fileName;
						imageStringBuilder.append(relativePath + "image/"+ fileName + ";");
						File uploadedFile = new File(filePath + "image/",fileName);
						item.write(uploadedFile);
						uploadedFile = null;
					}
					else if (item.getFieldName().equals("cover")) {
						fileName = item.getName().substring(item.getName().lastIndexOf("."),item.getName().length());
						fileName = String.valueOf(System.currentTimeMillis()+ random.nextInt(10000))+ fileName;
						cover=relativePath + "image/"+ fileName;
						File uploadedFile = new File(filePath + "image/",fileName);
						item.write(uploadedFile);
						uploadedFile = null;
					}
					else if (item.getFieldName().equals("video")) {
						if(item.getName()!=null&&!"".equals(item.getName())){
						fileName = item.getName().substring(item.getName().lastIndexOf("."),item.getName().length());
						fileName = String.valueOf(System.currentTimeMillis()+ random.nextInt(10000))+ fileName;
						videoPath = filePath + "video/" + fileName;
						videoRelativePath = relativePath + "video/" + fileName;
						File uploadedFile = new File(filePath + "video/",fileName);
						item.write(uploadedFile);
						//ConvertVideoTypeThread cvtt=new ConvertVideoTypeThread(videoPath,fileName);
						//videoPath=videoPath.substring(0,videoPath.lastIndexOf("."))+".mp4";
						//videoRelativePath=videoRelativePath.substring(0,videoRelativePath.lastIndexOf("."))+".mp4";
						//cvtt.start();
						uploadedFile = null;
						}
					}
				} else { // 取得普通的对象[对于像文本框这种类型的使用]
					if ("title".equals(item.getFieldName()))
						title = new String(item.getString().trim().getBytes("ISO-8859-1"), "utf-8");
					if ("horseId".equals(item.getFieldName()))
						horseId = Integer.valueOf(item.getString());
					if ("intro".equals(item.getFieldName()))
						intro = new String(item.getString().getBytes("ISO-8859-1"), "utf-8");
					if ("brief".equals(item.getFieldName()))
						brief = new String(item.getString().trim().getBytes("ISO-8859-1"), "utf-8");
					if ("sporthorse".equals(item.getFieldName()))
						sportoryoung=Integer.valueOf(item.getString());
					if ("propertychildnode".equals(item.getFieldName())) {
					}
					for(iteratorI=1;iteratorI<=50;iteratorI++){
						if(("propertykey"+iteratorI).equals(item.getFieldName()))
						    propertyKeyMap.put("propertykey"+iteratorI,new String(item.getString().getBytes("ISO-8859-1"), "utf-8"));
						if(("propertyvalue"+iteratorI).equals(item.getFieldName()))
							propertyValueMap.put("propertyvalue"+iteratorI,new String(item.getString().getBytes("ISO-8859-1"), "utf-8"));
					}
				}
			}
			for(iteratorI=1;iteratorI<=50;iteratorI++){
				if(propertyKeyMap.get("propertykey"+iteratorI)==null)continue;
				propertyMap.put(propertyKeyMap.get("propertykey"+iteratorI), propertyValueMap.get("propertyvalue"+iteratorI));
			}
			String propertyString=DataTypeConverter.class.newInstance().convertMapToJson(propertyMap);
			if(imageStringBuilder.length()>1)imageStringBuilder.deleteCharAt(imageStringBuilder.length() - 1);
			//String dateTimeNow = DataTypeConverter.class.newInstance().getTimestampNow();
			ModifyHorse modifyHorse = new ModifyHorse();
			Horse horse = new Horse();
			horse.setId(horseId);
			if(title!=null)
			    horse.setTitle(title);
			if(brief!=null)
			    horse.setBrief(brief);
			if(intro!=null)
				horse.setIntro(intro);
			if(cover!=null)
				horse.setCover(cover);
			if(propertyString.length()>0)
			    horse.setProperty(propertyString);
			//horse.setGallery(imageStringBuilder.toString());
			if (videoPath != null)
				horse.setVideo(videoRelativePath);
			horse.setSportoryoung(sportoryoung);
			//horse.setAddtime(dateTimeNow);
			if (modifyHorse.updateById(horse)) {
				response.sendRedirect("en/Tips.jsp?tips=update_success!");
			}
			else response.sendRedirect("en/Tips.jsp?tips=update_failed!");
		} catch (Exception e) {
			//e.printStackTrace();
			response.sendRedirect("en/Tips.jsp?tips=error!");
		}
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
