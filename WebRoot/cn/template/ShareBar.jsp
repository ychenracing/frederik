<%@ page language="java" import="java.util.*,cn.edu.fudan.entity.cn.*,cn.edu.fudan.model.cn.*,cn.edu.fudan.function.*" pageEncoding="utf-8"%>
<script type="text/javascript">
$("#Share").click(function(){
	$("#sharebar").fadeIn("slow");
});
</script>
<div id="sharebar" class="bshare-custom icon-medium-plus" style="margin-top:1%;display:none;">
	<a title="分享到微信" class="bshare-weixin"></a> 
	<a title="分享到微博" class="bshare-sinaminiblog"></a>
	 <a title="分享到脸书" class="bshare-facebook"></a>
	  <a title="分享到推特" class="bshare-twitter"></a>
		 <a title="分享到QQ" class="bshare-qqim"></a>
	<a title="分享到人人" class="bshare-renren"></a>
</div>
<script type="text/javascript" charset="utf-8"
	src="http://static.bshare.cn/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh"></script>
<script type="text/javascript" charset="utf-8"
	src="http://static.bshare.cn/b/bshareC0.js"></script>