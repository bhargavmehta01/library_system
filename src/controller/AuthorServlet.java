package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AuthorDAO;
import VO.Author;


public class AuthorServlet extends HttpServlet {

protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ops=request.getParameter("operation");
		
		if(ops.equals("insert")){
			
			Author a1 = new Author();
			a1.setAuthname(request.getParameter("aname"));
			
			
			new AuthorDAO().insert(a1);
			
			response.sendRedirect("Selector.jsp");
			
		}
		
	}
	
}
