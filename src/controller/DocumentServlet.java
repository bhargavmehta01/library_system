package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DocumentDAO;
import VO.Document;

public class DocumentServlet extends HttpServlet{

protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ops=request.getParameter("operation");
		
		if(ops.equals("insert")){
			
			Document d1 = new Document();
			d1.setPubaddrs(request.getParameter("pubaddrs"));
			d1.setPubname(request.getParameter("pubname"));
			
			new PublisherDAO().insert(p1);
			
		}
		
	}
}
