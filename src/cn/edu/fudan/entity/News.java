package cn.edu.fudan.entity;

/**
 * class of News contains id, title, content and addtime, contains getter and setter.
 * @author Yong Chen
 *
 */
public class News {

	private int id;
	private String title;
	private String cover;
	private String brief;
	private String content;
	private String addtime;

	public String getBrief() {
		return brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public String getTitle() {
		return title;
	}

	public String getCover() {
		return cover;
	}

	public void setCover(String cover) {
		this.cover = cover;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAddtime() {
		if(addtime!=null)
		    return addtime.substring(0, addtime.length()-2);
		else return null;
	}

	public void setAddtime(String addtime) {
		this.addtime = addtime;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
