package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import VO.Journal;


public class JournalDAO {
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/librarysystem";

	static final String USER = "root";
	static final String PASS = "root";

	public void insert(Journal j1) {

		Connection connection = null;
		Statement statement = null;
		try {

			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(DB_URL, USER, PASS);
			statement = connection.createStatement();
			String query,query1;
			
			query = "Insert into journalissue (docid,issueno,scope) values ('" + j1.getDocid() + "','" + j1.getIssueno() + "','" + j1.getScope() + "');";
			query1 = "Insert into journalvolume (docid,jvolume,editorid) values ('" + j1.getDocid() + "','" + j1.getJvolume() + "','" + j1.getEditorid() + "');";
			int rsx = statement.executeUpdate(query);
			int rsx1 = statement.executeUpdate(query1);
			
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
