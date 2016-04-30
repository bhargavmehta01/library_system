package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.PublisherDAO;
import VO.Publisher;

public class PublisherServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ops=request.getParameter("operation");
		
		if(ops.equals("insert")){
			
			Publisher p1 = new Publisher();
			p1.setPubaddrs(request.getParameter("pubaddrs"));
			p1.setPubname(request.getParameter("pubname"));
			
			new PublisherDAO().insert(p1);
			
		}
		
	}
	
}
