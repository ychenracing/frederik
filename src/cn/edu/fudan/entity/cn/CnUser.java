package cn.edu.fudan.entity.cn;

import cn.edu.fudan.entity.User;

public class CnUser {
	private String username;
	private String password;
	private User user;
	public CnUser(User user)
	{
		this.user=user;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
