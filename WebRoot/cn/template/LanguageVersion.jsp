<div id="languageVersion" class="languageVersion">
<a href="<%String   languageUrl=request.getScheme()+"://";   
languageUrl+=request.getHeader("host");   
languageUrl+=request.getRequestURI();   
if(request.getQueryString()!=null)   
   languageUrl+="?"+request.getQueryString();
out.println(languageUrl.replaceAll("/cn/", "/en/")); %>" style="text-decoration:none;display:block;color:#ffffff;">
<img src="cn/images/en_flag_mini.jpg"/></a>
</div>
