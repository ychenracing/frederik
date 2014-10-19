function addproperty(){
	var propertynum=document.getElementById("propertychildnode").value;
	propertynum++;
	$("#propertydiv").append("<div id=\"propertydiv"+propertynum+"\" style=\"width:100%;clear:both;float:left;\"><input id=\"propertykey"+propertynum+"\" type=\"text\" name=\"propertykey"+propertynum+"\" style=\"width:20%;float:left;display:line-block;\"/><label style=\"display:line-block;float:left;vertical-align:middle;padding:auto!important;width:1%;text-align:center;font-size:2em;\">:</label><input id=\"propertyvalue"+propertynum+"\" type=\"text\" name=\"propertyvalue"+propertynum+"\" style=\"width:20%;float:left;display:line-block;\"/><div style=\"width:2%;float:left;display:line-block;padding:auto;vertical-align:middle;text-align:center;\"><i class=\"icon-minus\" onmousedown=\"minusproperty(this.parentNode.parentNode.id)\"></i></div></div>");
	document.getElementById("propertychildnode").value=propertynum;
}
function minusproperty(id){
	var thisObj=document.getElementById(id);
	document.getElementById(id).parentNode.removeChild(thisObj);
	var propertynum=document.getElementById("propertychildnode").value;
	propertynum--;
	document.getElementById("propertychildnode").value=propertynum;
}
function removePic(id){
	var thisObj=document.getElementById(id);
	document.getElementById(id).parentNode.removeChild(thisObj);
}
function publishFamily(){
	var title=document.getElementById("title").value;
	var image=document.getElementById("image").value;
	if(title==""){
		document.getElementById("titlemsg").innerText="*";
		document.getElementById("title").focus();
		return false;
	}
	if(image==""){
		document.getElementById("imagemsg").innerText="*";
		document.getElementById("image").focus();
		return false;
	}
	return true;
}
function publishHorse(){
	var title=document.getElementById("title").value;
	var brief=document.getElementById("brief").value;
	var image=document.getElementById("image").value;
	if(title==""){
		document.getElementById("titlemsg").innerText="*";
		document.getElementById("title").focus();
		return false;
	}
	if(image==""){
		document.getElementById("imagemsg").innerText="*";
		document.getElementById("image").focus();
		return false;
	}
	if(brief==""){
		document.getElementById("briefmsg").innerText="*";
		document.getElementById("brief").focus();
		return false;
	}
	return true;
}
function publishNews(){
	var title=document.getElementById("title").value;
	var brief=document.getElementById("brief").value;
	var image=document.getElementById("image").value;
	if(title==""){
		document.getElementById("titlemsg").innerText="*";
		document.getElementById("title").focus();
		return false;
	}
	if(image==""){
		document.getElementById("imagemsg").innerText="*";
		document.getElementById("image").focus();
		return false;
	}
	if(brief==""){
		document.getElementById("briefmsg").innerText="*";
		document.getElementById("brief").focus();
		return false;
	}
	return true;
}
function sendEmail(){
	var title=document.getElementById("title").value;
	var name=document.getElementById("name").value;
	var email=document.getElementById("email").value;
	var content=document.getElementById("content").value;
	if(title==""){
		document.getElementById("titlemsg").innerText="*";
		document.getElementById("title").focus();
		return false;
	}
	if(name==""){
		document.getElementById("namemsg").innerText="*";
		document.getElementById("name").focus();
		return false;
	}
	if(email==""){
		document.getElementById("emailmsg").innerText="*";
		document.getElementById("email").focus();
		return false;
	}
	if(content==""){
		document.getElementById("contentmsg").innerText="*";
		document.getElementById("content").focus();
		return false;
	}
	return true;
}
function modifyHomepageCheck(){
	var title=document.getElementById("title").value;
	var image=document.getElementById("image").value;
	if(title==""&&image==""){
		document.getElementById("imagemsg").innerText="input text or select a picture please!";
		return false;
	}
	return true;
}
function loginCheck(){
	var username=document.getElementById("username").value;
	var password=document.getElementById("password").value;
	if(username==""){
		document.getElementById("usernamemsg").innerText="*";
		return false;
	}
	if(password==""){
		document.getElementById("passwordmsg").innerText="*";
		return false;
	}
	return true;
}