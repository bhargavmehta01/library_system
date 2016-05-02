package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

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

			query = "Insert into author (aname) values ('" + a1.getAuthname() + "');";
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
	
	public ArrayList<Author> search() {
		
		Connection connection = null;
		Statement statement = null;
		ArrayList<Author> list = new ArrayList<>();
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(DB_URL, USER, PASS);
			statement = connection.createStatement();
			String query = "Select authorid, aname from author";
			ResultSet rs = statement.executeQuery(query);

			while (rs.next()) {
				
				int id = rs.getInt("authorid");
				String name = rs.getString("aname");

				Author a = new Author();
				a.setAuthid(id);
				a.setAuthname(name);
				
				list.add(a);

				
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
		return list;
	}

}
