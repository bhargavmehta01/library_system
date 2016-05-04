package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import VO.Document;

public class FrequencyControler extends HttpServlet{
	
	static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	static final String DB_URL = "jdbc:mysql://localhost/librarysystem";

	static final String USER = "root";
	static final String PASS = "root";
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ops = request.getParameter("operation");

		if (ops.equals("load")) {
			
			
			Connection connection = null;
			Statement statement = null;
			ArrayList<String> ob = new ArrayList<String>();
			try {

				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection(DB_URL, USER, PASS);
				statement = connection.createStatement();
				String query = "SELECT b2.lname,r.rname,count(b.readerid) from borrows b,reader r,branch b2 where b.libid=b2.libid and b.readerid=r.readerid group by lname,rname order by count(b.readerid) desc limit 10;";
				ResultSet rs = statement.executeQuery(query);

				
				
				
				while (rs.next()) {

				ob.add(rs.getString("lname"));
				ob.add(rs.getString("rname"));
				Integer i = rs.getInt("count(b.readerid)");
				ob.add(i.toString());
				
				System.out.println(rs.getString("lname")+ " "+rs.getString("rname") +" "+rs.getInt("count(b.readerid)"));
					
					
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
		
			request.getSession().setAttribute("freqData", ob);
			response.sendRedirect("frequency.jsp");
		}

		
		
		
	}

}
