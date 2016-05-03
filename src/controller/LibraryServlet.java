package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AuthorDAO;
import DAO.LibraryDAO;
import VO.Author;
import VO.Library;

public class LibraryServlet extends HttpServlet{
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ops=request.getParameter("operation");
		
		if(ops.equals("insert")){
			
			Library l = new Library();
			l.setLocation(request.getParameter("location"));
			l.setName(request.getParameter("lname"));
			
			
			new LibraryDAO().insert(l);
			
			response.sendRedirect("Selector.jsp");
			
		}
		
		
	}

}
