package cn.edu.fudan.controller.cn;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import cn.edu.fudan.entity.cn.CnFamily;

public class CnModifyFamilyGallery extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CnModifyFamilyGallery() {
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
			response.setCharacterEncoding("utf-8");
			request.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
			String validPath = getServletContext().getRealPath("/");
			String relativePath = "en/upload/",filePath = validPath + "en/upload/", fileName = null;
			LinkedHashMap<String,String> imageItemPathMap=new LinkedHashMap<String,String>();
			LinkedHashMap<String,String> imageItemMap=new LinkedHashMap<String,String>();
			StringBuilder imageStringBuilder = new StringBuilder();
			StringBuilder newImageStringBuilder = new StringBuilder();
			int iteratorI=1,familyId=0;
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
					if (item.getFieldName().equals("image")) {//判断是否是add new pictures的input的输入
						if(item.getName().length()>3){
						    fileName = item.getName().substring(item.getName().lastIndexOf("."),item.getName().length());
						    fileName = String.valueOf(System.currentTimeMillis()+ random.nextInt(10000))+ fileName;
						    newImageStringBuilder.append(relativePath + "image/"+ fileName + ";");
						    File uploadedFile = new File(filePath + "image/",fileName);
						    item.write(uploadedFile);
						    uploadedFile = null;
						}
					}
					if(item.getFieldName().length()>9){//判断是否是每个图片下面的上传图片的input的输入
						if(item.getFieldName().substring(0, 9).equals("imageItem")){
							if(item.getName().length()>3){
							    fileName = item.getName().substring(item.getName().lastIndexOf("."),item.getName().length());
							    fileName = String.valueOf(System.currentTimeMillis()+ random.nextInt(10000))+ fileName;
							    imageItemMap.put(item.getFieldName(), relativePath + "image/"+ fileName);
							    File uploadedFile = new File(filePath + "image/",fileName);
							    item.write(uploadedFile);
							    uploadedFile = null;
							}
						}
					}
				} else { // 取得普通的对象[对于像文本框这种类型的使用]
					if(item.getFieldName().length()>13){
						if(item.getFieldName().substring(0, 13).equals("imageItemPath")){
							imageItemPathMap.put(item.getFieldName(), item.getString());
						}
					}
					if ("familyId".equals(item.getFieldName()))
						familyId = Integer.valueOf(item.getString());
				}
			}
			if(newImageStringBuilder.length()>1)newImageStringBuilder.deleteCharAt(newImageStringBuilder.length() - 1);
			for(iteratorI=1;iteratorI<=20;iteratorI++){
				if(imageItemMap.get("imageItem"+iteratorI)!=null)
					imageItemPathMap.put("imageItemPath"+iteratorI,"false");
			}
			for(iteratorI=1;iteratorI<=20;iteratorI++){
				if(imageItemMap.get("imageItem"+iteratorI)!=null)
					imageStringBuilder.append(imageItemMap.get("imageItem"+iteratorI)+";");
				else if(imageItemPathMap.get("imageItemPath"+iteratorI)!=null){
					if(!imageItemPathMap.get("imageItemPath"+iteratorI).equals("false")){
						imageStringBuilder.append(imageItemPathMap.get("imageItemPath"+iteratorI)+";");
					}
				}
			}
			if(imageStringBuilder.length()>1){
				if(newImageStringBuilder.length()>1)
					imageStringBuilder.append(newImageStringBuilder);
				else imageStringBuilder.deleteCharAt(imageStringBuilder.length() - 1);
			}
			else{
				if(newImageStringBuilder.length()>1)
					imageStringBuilder.append(newImageStringBuilder);
				else response.sendRedirect("index.jsp");
			}
				    
			//System.out.println(imageStringBuilder.toString());
			cn.edu.fudan.model.cn.CnModifyFamily modifyFamily=new cn.edu.fudan.model.cn.CnModifyFamily();
			CnFamily family=new CnFamily();
			family.setId(familyId);
			family.setGallery(imageStringBuilder.toString());
			if (modifyFamily.updateById(family)) {
				response.sendRedirect("cn/Family.jsp");
			} else
				response.sendRedirect("cn/Tips.jsp?tips=update_failed!");
		} catch (Exception e) {
			//e.printStackTrace();
			response.sendRedirect("cn/Tips.jsp?tips=error!");
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
