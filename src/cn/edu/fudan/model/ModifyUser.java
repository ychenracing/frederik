package cn.edu.fudan.model;

import java.sql.ResultSet;
import java.sql.SQLException;

import cn.edu.fudan.entity.User;

public class ModifyUser {
	private DAO dao=new DAO();
	private ResultSet rs;
	private StringBuilder sql;
	public User getByUsername(String username){
		User lsu=null;
		sql=new StringBuilder();
		sql.append("select * from user where username='");
		sql.append(username);
		sql.append("'");
		try {
			dao.con();
			rs = dao.stmt.executeQuery(sql.toString());
			if (rs.next()) {
				lsu=new User(null);
				lsu.setUsername(rs.getString(1));
				lsu.setPassword(rs.getString(2));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			try {
				dao.close();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return lsu;
	}
	public boolean setPassword(User user){
		boolean success=false;
		sql=new StringBuilder();
		sql.append("update user set password='");
		sql.append(user.getPassword());
		sql.append("' where username='");
		sql.append(user.getUsername());
		sql.append("'");
		try {
			dao.con();
			if(dao.stmt.executeUpdate(sql.toString())!=0)success=true;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			try {
				dao.close();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return success;
	}
	public boolean insertNewUser(User user){
		boolean success=false;
		sql=new StringBuilder();
		sql.append("insert into user(username,password) values('");
		sql.append(user.getUsername());
		sql.append("','");
		sql.append(user.getPassword());
		sql.append("')");
		try {
			dao.con();
			if(dao.stmt.executeUpdate(sql.toString())!=0)success=true;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			try {
				dao.close();
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InstantiationException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return success;
	}
}
