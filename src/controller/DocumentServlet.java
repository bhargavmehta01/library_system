package controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.DocumentDAO;
import DAO.PublisherDAO;
import VO.Document;
import VO.Publisher;

public class DocumentServlet extends HttpServlet{

protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ops=request.getParameter("operation");
		
		if(ops.equals("insert")){
			
			SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
	        java.util.Date parsed=null;
			try {
				parsed = format.parse(request.getParameter("pubdate"));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Date d =new Date(parsed.getTime());
	        
			Document d1 = new Document();
			d1.setPubdate(d);
			d1.setPubid(Integer.parseInt(request.getParameter("pubid")));
			d1.setTitle(request.getParameter("title"));
			
			new DocumentDAO().insert(d1);
			
			response.sendRedirect("Selector.jsp");
			
		}else if(ops.equals("load")){
			
			ArrayList<Publisher>  arr = new PublisherDAO().search();
			
			request.getSession().setAttribute("pubData", arr);
			
			response.sendRedirect("insertDocument.jsp");
		}
		
		
	}
}
