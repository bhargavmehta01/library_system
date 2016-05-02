package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import VO.Document;
import VO.Publisher;

public class DocumentDAO {

	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/librarysystem";

	static final String USER = "root";
	static final String PASS = "root";

	public int insert(Document d1) {

		int id = 0;
		Connection connection = null;
		Statement statement = null;
		try {

			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(DB_URL, USER, PASS);
			statement = connection.createStatement();
			String query;

			query = "Insert into document (title,PDate,publisherid) values ('" + d1.getTitle() + "','" + d1.getPubdate()
					+ "','" + d1.getPubid() + "');";
			int rsx = statement.executeUpdate(query);

			query = "Select max(documentid) from document";
			ResultSet rs = statement.executeQuery(query);

			while (rs.next()) {

				id = rs.getInt("max(documentid)");

			}
			rs.close();
			statement.close();
			connection.close();

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
		return id;
	}

	public ArrayList<Document> searchAll() {

		Connection connection = null;
		Statement statement = null;
		ArrayList<Document> list = new ArrayList<>();
		try {

			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(DB_URL, USER, PASS);
			statement = connection.createStatement();
			String query = "Select documentid, title, PDate, publisherid from document";
			ResultSet rs = statement.executeQuery(query);

			while (rs.next()) {

				int id = rs.getInt("documentid");
				String title = rs.getString("title");
				Date pdate = rs.getDate("PDate");
				int pid = rs.getInt("publisherid");

				Document d = new Document();
				d.setDocid(id);
				d.setPubdate(pdate);
				d.setPubid(pid);
				d.setTitle(title);

				list.add(d);

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

		// TODO Auto-generated method stub
		return list;
	}

	public void delete(int id) {

		Connection connection = null;
		Statement statement = null;
		try {

			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(DB_URL, USER, PASS);
			statement = connection.createStatement();
			String query;

			query = "Delete from document where documentid=" + id + ";";
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

	public void update(Document d) {

		Connection connection = null;
		Statement statement = null;
		try {

			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(DB_URL, USER, PASS);
			statement = connection.createStatement();
			String query;

			query = "Update document set title ='" + d.getTitle() + "', PDate = '"+d.getPubdate()+"', publisherid="+d.getPubid()+" where documentid=" + d.getDocid() + ";";
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
