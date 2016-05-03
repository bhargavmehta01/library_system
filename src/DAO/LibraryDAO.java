package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import VO.Author;
import VO.Library;

public class LibraryDAO {
	
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/librarysystem";

	static final String USER = "root";
	static final String PASS = "root";

	public void insert(Library l) {

		Connection connection = null;
		Statement statement = null;
		try {

			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(DB_URL, USER, PASS);
			statement = connection.createStatement();
			String query;

			query = "Insert into branch (lname,location) values ('" + l.getName() + "','" + l.getLocation() + "');";
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
	
	public ArrayList<Library> search() {
		
		Connection connection = null;
		Statement statement = null;
		ArrayList<Library> list = new ArrayList<>();
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(DB_URL, USER, PASS);
			statement = connection.createStatement();
			String query = "Select libid, lname from branch";
			ResultSet rs = statement.executeQuery(query);

			while (rs.next()) {
				
				int id = rs.getInt("libid");
				String name = rs.getString("lname");

				Library l = new Library();
				l.setId(id);
				l.setName(name);
				
				list.add(l);

				
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
