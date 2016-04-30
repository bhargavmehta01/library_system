package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;



public class AdminDAO {
	
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/librarysystem";

	static final String USER = "root";
	static final String PASS = "root";
	
	public boolean search(String id, String pass) {
		
		Connection connection = null;
		Statement statement = null;
		boolean flag=false;
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(DB_URL, USER, PASS);
			statement = connection.createStatement();
			String query = "Select * from admin where id ='"+id+"' and pass ='"+pass+"'";
			ResultSet rs = statement.executeQuery(query);

			while (rs.next()) {
				
				String column = rs.getString("id");
				System.out.println(column);
 				flag=true;
				
			}
			rs.close();
			statement.close();
			connection.close();
			
		} catch (SQLException se) {
			se.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				if (statement != null)
					statement.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}

			try {
				if (connection != null)
					connection.close();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}
		return flag;
	}
	

}
