package cn.edu.fudan.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DAO {
	static Connection cn;
	public static Statement stmt;
	static String sql;
	static ResultSet rs;

	public static void con() throws IllegalAccessException,
			InstantiationException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			//String urls = "jdbc:mysql://127.0.0.1:3306/personalweb";
			String urls = "jdbc:mysql://127.0.0.1:3306/frederik";
			String user = "frederik";
			String password = "frederikroot";
			cn = DriverManager.getConnection(urls, user, password);
			stmt = cn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public static void close() throws IllegalAccessException,
			InstantiationException, SQLException {
		if (stmt != null)
			stmt.close();
		if (cn != null)
			cn.close();
	}
}
