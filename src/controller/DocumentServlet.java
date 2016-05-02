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
import DAO.BookDAO;
import DAO.ChiefEditorDAO;
import DAO.DocumentDAO;
import DAO.JournalDAO;
import DAO.ProceedingDAO;
import DAO.PublisherDAO;
import VO.Author;
import VO.Book;
import VO.ChiefEditor;
import VO.Document;
import VO.Journal;
import VO.Proceeding;
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
			
			int i=new DocumentDAO().insert(d1);
			
			System.out.println(i);
			
			String dtype = request.getParameter("docType");
			
			if(dtype.equals("book")){
				Book d2 = new Book();
				d2.setDocid(i);
				d2.setIsbn(request.getParameter("isbn"));
				
				new BookDAO().insert(d2);
			}
			else if(dtype.equals("journal")){
				Journal d3 = new Journal();
				d3.setDocid(i);
				d3.setEditorid(Integer.parseInt(request.getParameter("editorid")));
				d3.setIssueno(Integer.parseInt(request.getParameter("issueno")));
				d3.setJvolume(Integer.parseInt(request.getParameter("jvolume")));
				d3.setScope(request.getParameter("scope"));
				
				new JournalDAO().insert(d3);
			}
			else if(dtype.equals("proceeding"))
			{
				Proceeding d4 = new Proceeding();
				d4.setDocid(i);
				try {
					parsed = format.parse(request.getParameter("cdate"));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				Date d2 =new Date(parsed.getTime());
				d4.setCdate(d2);
				d4.setCeditor(request.getParameter("chiefid"));
				d4.setClocation(request.getParameter("clocation"));
				
				new ProceedingDAO().insert(d4);
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
			
		}else if(ops.equals("searchAll")){
			
			ArrayList<Document>  arr = new DocumentDAO().searchAll();
			request.getSession().setAttribute("docarr", arr);
			response.sendRedirect("searchDocument.jsp");
			
		}else if(ops.equals("delete")){
			
			new DocumentDAO().delete(Integer.parseInt(request.getParameter("id")));
			response.sendRedirect("document?operation=searchAll");
			
		}else if(ops.equals("update")){
			
			request.getSession().setAttribute("docid", Integer.parseInt(request.getParameter("id")));
			ArrayList<Publisher>  arr = new PublisherDAO().search();
			request.getSession().setAttribute("pubData", arr);
			response.sendRedirect("updateDocument.jsp");
			
		}else if(ops.equals("edit")){
			
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
			d1.setDocid((int)request.getSession().getAttribute("docid"));
			d1.setPubdate(d);
			d1.setPubid(Integer.parseInt(request.getParameter("pubid")));
			d1.setTitle(request.getParameter("title"));
			
			new DocumentDAO().update(d1);
			response.sendRedirect("document?operation=searchAll");
			
		}
		
		
		
		
	}
}
