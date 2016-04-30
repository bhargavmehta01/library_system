package DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import VO.Publisher;



public class PublisherDAO {

	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/librarysystem";

	static final String USER = "root";
	static final String PASS = "root";
	
	public void insert(Publisher p1) {
		
		Connection connection = null;
		Statement statement = null;
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(DB_URL, USER, PASS);
			statement = connection.createStatement();
		String query;
		
		
		query = "Insert into publisher (pubname,address) values ('" + p1.getPubname() + "','" + p1.getPubaddrs() +"');";
		int rsx = statement.executeUpdate(query);

		
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
}
	
}