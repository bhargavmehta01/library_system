package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import VO.Author;

public class AuthorDAO {


	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/librarysystem";

	static final String USER = "root";
	static final String PASS = "root";
	
	public void insert(Author a1) {
		
		Connection connection = null;
		Statement statement = null;
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(DB_URL, USER, PASS);
			statement = connection.createStatement();
		String query;
		
		
		query = "Insert into author (aname) values ('" + a1.getAuthname()  +"');";
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
