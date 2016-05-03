package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AdminDAO;
import DAO.ReaderDAO;

public class LoginController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String auth=request.getParameter("auth");
		String id=request.getParameter("uname");
		String pass=request.getParameter("pswd");
		if(auth.equals("admin")){
			//System.out.println(new AdminDAO().search(id,pass ));
			if(new AdminDAO().search(id,pass )){
				
				response.sendRedirect("Selector.jsp");
			}
		}
		
		if(auth.equals("reader")){
			//System.out.println(new AdminDAO().search(id,pass ));
			if(new ReaderDAO().search(Integer.parseInt(id))){
				request.getSession().setAttribute("readerId", Integer.parseInt(id));
				response.sendRedirect("readerSelector.jsp");
			}
		}
		//System.out.println(request.getParameter("auth"));
		
		
	}
	
}
