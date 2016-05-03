package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import VO.Borrows;
import VO.Copy;

public class BorrowsDAO {

	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/librarysystem";

	static final String USER = "root";
	static final String PASS = "root";

	public void insert(Borrows b1) {

		Connection connection = null;
		Statement statement = null;
		try {

			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(DB_URL, USER, PASS);
			statement = connection.createStatement();
			String query;

			query = "Insert into borrows (bornumber,readerid,docid,copyno,libid,bdtime) values ('" + b1.getBornumber()
					+ "','" + b1.getReaderid() + "','" + b1.getDocid() + "','" + b1.getCopyno() + "','" + b1.getLibid()
					+ "','" + b1.getBdtime() + "');";
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

	public void delete(int id) {

		Connection connection = null;
		Statement statement = null;
		try {

			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(DB_URL, USER, PASS);
			statement = connection.createStatement();
			String query;

			query = "Update borrows set rdtime='"+new Timestamp(new Date().getTime())+"' where bornumber=" + id + ";";
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
	
	public ArrayList<Borrows> search(int id) {

		//System.out.println("here");
		Connection connection = null;
		Statement statement = null;
		ArrayList<Borrows> list = new ArrayList<>();
		try {

			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(DB_URL, USER, PASS);
			statement = connection.createStatement();
			String query = "Select bornumber, docid, copyno, libid, bdtime, rdtime from borrows where readerid=" + id
					+ ";";
			ResultSet rs = statement.executeQuery(query);

			while (rs.next()) {

				int borno = rs.getInt("bornumber");
				int docid = rs.getInt("docid");
				int libid = rs.getInt("libid");
				int copno = rs.getInt("copyno");
				Timestamp bt = rs.getTimestamp("bdtime");
				Timestamp rt = rs.getTimestamp("rdtime");

				//System.out.println(rt.getTime());
				
				if (rt.getTime() == 768024000000L) {

					Borrows b = new Borrows();
					b.setBdtime(bt);
					b.setBornumber(borno);
					b.setDocid(docid);
					b.setCopyno(copno);
					b.setLibid(libid);
					// 1462420800000
					list.add(b);
				}

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
