<%@ page language="java" import="java.util.*,cn.edu.fudan.entity.cn.*,cn.edu.fudan.model.cn.*,cn.edu.fudan.function.*" pageEncoding="utf-8"%>
<!-- Footer -->
			<footer id="footer" class="container">
				<div class="row double">
					<div class="12u">

						<!-- Contact -->
							<section>
								<h2 id="getintouch" class="major"><span>联系我们</span></h2>
								<ul class="contact">
								    <li><a class="icon fa-wechat" href="cn/MyQRCode.jsp"><span class="label">微信</span></a></li>
									<li><a class="icon fa-envelope" href="cn/SendEmail.jsp"><span class="label">邮件</span></a></li>
								</ul>
							</section>
					
					</div>
				</div>

				<!-- Copyright -->
					<div id="copyright">
						<ul class="menu">
							<li>&copy;ZUCHTHOF STERTHOFF.版权所有.
							<%if(session.getAttribute("frederik")==null){%>
							<a href="cn/Login.jsp" style="text-decoration:none">登录</a>
							<%}else{ %>
							<a href="cn/Logout.jsp" style="text-decoration:none">退出</a>
							<%} %>
							
							</li>
							<!-- <li>Design: <a href="http://www.iipl.fudan.edu.cn/~chen">陈勇</a></li> -->
						</ul>
					</div>

			</footer>
			
<!-- SlidesJS Required: Link to jQuery -->
  <script src="cn/js/jquery-2.1.1.min.js"></script>
  <!-- End SlidesJS Required -->
			<script type="text/javascript">
var languageVersionNode=$("#languageVersion");
$(function(){
	$("#skel-layers-activeWrapper").append(languageVersionNode); 
});
</script>