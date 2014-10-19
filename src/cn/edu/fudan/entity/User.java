package cn.edu.fudan.entity;
/**
 * user class
 * private member: username password
 * @author Yong Chen
 *
 */
public class User {
	private String username;
	private String password;
	private User user=null;
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public User(User user)
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
