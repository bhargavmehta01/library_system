package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;

import VO.Reserves;


public class ReservesDAO {

	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/librarysystem";

	static final String USER = "root";
	static final String PASS = "root";

	public void insert(Reserves r1) {

		Connection connection = null;
		Statement statement = null;
		try {

			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(DB_URL, USER, PASS);
			statement = connection.createStatement();
			String query;

			query = "Insert into reserves (reserveid,readerid,docid,copyno,libid,dtime) values ('" + r1.getReserveid() + "','" + r1.getReaderid() + "','" + r1.getDocid() + "','" + r1.getCopyno() + "','" + r1.getLibid() + "','" + r1.getDtime() + "');";
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

			query = "Delete from reserves where reserveid=" + id + ";";
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
	
	public ArrayList<Reserves> search(int id) {

		Connection connection = null;
		Statement statement = null;
		ArrayList<Reserves> list = new ArrayList<>();
		try {

			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(DB_URL, USER, PASS);
			statement = connection.createStatement();
			String query = "Select reserveid, docid, copyno, libid, dtime from reserves where readerid="+id+";";
			ResultSet rs = statement.executeQuery(query);

			while (rs.next()) {

				int resid = rs.getInt("reserveid");
				int docid = rs.getInt("docid");
				int libid = rs.getInt("libid");
				int copno = rs.getInt("copyno");
				Timestamp dt = rs.getTimestamp("dtime");

				Reserves r = new Reserves();
				
				r.setReserveid(resid);
				r.setDocid(docid);
				r.setLibid(libid);
				r.setCopyno(copno);
				r.setDtime(dt);
				
				list.add(r);

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
