package cn.edu.fudan.controller.cn;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.fudan.entity.User;
import cn.edu.fudan.model.ModifyUser;

public class CnChangePassword extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CnChangePassword() {
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

		String url = request.getHeader("Referer"); // 获得前一页的URL
		HttpSession session = request.getSession();
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		String oldpassword = request.getParameter("oldpassword");
		String newpassword = request.getParameter("newpassword");
		ModifyUser modifyUser = new ModifyUser();
		User user = modifyUser.getByUsername("frederik");
		if (user == null) {
			String tips=URLEncoder.encode("错误!请重新试一次!","utf-8");
			response.sendRedirect("cn/Tips.jsp?tips="+tips);
		} else {
			if (!oldpassword.equals(user.getPassword())) {
				session.setAttribute("passworderror", "旧密码错误!");
				response.sendRedirect(url);
			}
			else{
				if(oldpassword.equals(newpassword)){
					String tips=URLEncoder.encode("密码修改成功!","utf-8");
					response.sendRedirect("cn/Tips.jsp?tips="+tips);
					return;
				}
				user.setPassword(newpassword);
				if(modifyUser.setPassword(user)){
					String tips=URLEncoder.encode("密码修改成功!","utf-8");
					response.sendRedirect("cn/Tips.jsp?tips="+tips);
					return;
				}
			}
			
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
