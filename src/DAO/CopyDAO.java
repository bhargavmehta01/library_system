package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import VO.Copy;
import VO.Document;


public class CopyDAO {
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/librarysystem";

	static final String USER = "root";
	static final String PASS = "root";

	public void insert(Copy c1) {

		Connection connection = null;
		Statement statement = null;
		try {

			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(DB_URL, USER, PASS);
			statement = connection.createStatement();
			String query;

			query = "Insert into copy (docid,copyno,libid,position) values ('" + c1.getDocid() + "','" + c1.getCopyno() + "','"
					+ c1.getLibid() + "','" + c1.getPosition() + "');";
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
	
	public ArrayList<Copy> search(int id) {

		Connection connection = null;
		Statement statement = null;
		ArrayList<Copy> list = new ArrayList<>();
		try {

			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(DB_URL, USER, PASS);
			statement = connection.createStatement();
			String query = "Select docid, libid, copyno from copy where docid="+id+";";
			ResultSet rs = statement.executeQuery(query);

			while (rs.next()) {

				int docid = rs.getInt("docid");
				int libid = rs.getInt("dolibidcid");
				int copno = rs.getInt("copyno");

				Copy c = new Copy();
				c.setCopyno(copno);
				c.setDocid(docid);
				c.setLibid(libid);
				list.add(c);

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
}
