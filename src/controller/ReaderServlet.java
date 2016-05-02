package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ReaderDAO;
import VO.Reader;

public class ReaderServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ops=request.getParameter("operation");
		
		if(ops.equals("insert")){
			
			Reader r1 = new Reader();
			r1.setAddrs(request.getParameter("addrs"));
			r1.setFname(request.getParameter("fname"));
			r1.setRtype(request.getParameter("rtype"));
			
			new ReaderDAO().insert(r1);
			
			response.sendRedirect("Selector.jsp");
		}
		
	}
	
}
