<%@ page language="java" import="java.util.*,cn.edu.fudan.entity.cn.*,cn.edu.fudan.model.cn.*,cn.edu.fudan.function.*" pageEncoding="utf-8"%>
<!-- Footer -->
			<footer id="footer" class="container">
				<div class="row double">
					<div class="12u">

						<!-- Contact -->
							<section>
								<h2 id="getintouch" class="major"><span>Get in touch</span></h2>
								<ul class="contact">
								    <li><a class="icon fa-wechat" href="en/MyQRCode.jsp"><span class="label">Wechat</span></a></li>
									<li><a class="icon fa-envelope" href="en/SendEmail.jsp"><span class="label">Email</span></a></li>
								</ul>
							</section>
					
					</div>
				</div>

				<!-- Copyright -->
					<div id="copyright">
						<ul class="menu">
							<li>&copy; ZUCHTHOF STERTHOFF. All rights reserved.
							<%if(session.getAttribute("frederik")==null){%>
							<a href="en/Login.jsp" style="text-decoration:none">Login</a>
							<%}else{ %>
							<a href="en/Logout.jsp" style="text-decoration:none">Logout</a>
							<%} %>
							</li>
							<!-- <li>Design: <a href="http://www.iipl.fudan.edu.cn/~chen">Yong Chen</a></li> -->
						</ul>
					</div>

			</footer>