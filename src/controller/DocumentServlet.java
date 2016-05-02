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

import DAO.AuthorDAO;
import DAO.ChiefEditorDAO;
import DAO.DocumentDAO;
import DAO.PublisherDAO;
import VO.Author;
import VO.ChiefEditor;
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
			
			String dtype = request.getParameter("docType");
			
			if(dtype.equals("book")){
				
			}
			else if(dtype.equals("journal")){
				
			}
			else if(dtype.equals("proceeding"))
			{
				
			}
			
			response.sendRedirect("Selector.jsp");
			
		}else if(ops.equals("load")){
			
			ArrayList<Publisher>  arr = new PublisherDAO().search();
			ArrayList<Author>  arr2 = new AuthorDAO().search();
			ArrayList<ChiefEditor>  arr3 = new ChiefEditorDAO().search();
			
			request.getSession().setAttribute("pubData", arr);
			request.getSession().setAttribute("authData", arr2);
			request.getSession().setAttribute("chiefData", arr3);
			
			response.sendRedirect("insertDocument.jsp");
		}
		
		
	}
}
