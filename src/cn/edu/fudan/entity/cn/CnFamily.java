package cn.edu.fudan.entity.cn;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import cn.edu.fudan.function.DataTypeConverter;

public class CnFamily {
	private int id;
	private String title;
	private String intro;
	private String gallery;// a string of type of json
	private String video;
	private String addtime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getGallery() {
		return gallery;
	}
	public void setGallery(String gallery) {
		this.gallery = gallery;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	public String getAddtime() {
		if(addtime!=null)
		    return addtime.substring(0,addtime.length()-2);
		else return null;
	}
	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}
	public List<String> getImageList(){
		List<String> imageList=new ArrayList<String>();
		DataTypeConverter dtc=new DataTypeConverter();
		Map<String,String> galleryMap=dtc.convertJsonToMap(this.gallery);
		for(Map.Entry<String,String> galleryItem:galleryMap.entrySet()){
			if(!galleryItem.getKey().isEmpty())imageList.add(galleryItem.getKey());
		}
		return imageList;
	}
	
}
