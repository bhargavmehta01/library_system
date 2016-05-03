package controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.BorrowsDAO;
import DAO.CopyDAO;
import DAO.DocumentDAO;
import DAO.LibraryDAO;
import DAO.ReservesDAO;
import VO.Borrows;
import VO.Copy;
import VO.Document;
import VO.Library;
import VO.Reserves;

public class CopyServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String ops = request.getParameter("operation");

		if (ops.equals("load")) {

			ArrayList<Document> arr = new DocumentDAO().searchAll();
			ArrayList<Library> arr2 = new LibraryDAO().search();

			request.getSession().setAttribute("docData", arr);
			request.getSession().setAttribute("libData", arr2);

			response.sendRedirect("insertCopy.jsp");

		}

		if (ops.equals("insert")) {

			Copy c1 = new Copy();

			c1.setCopyno(Integer.parseInt(request.getParameter("copyno")));
			c1.setDocid(Integer.parseInt(request.getParameter("docid")));
			c1.setLibid(Integer.parseInt(request.getParameter("libid")));
			c1.setPosition(request.getParameter("position"));

			new CopyDAO().insert(c1);

			response.sendRedirect("Selector.jsp");

		}
		if (ops.equals("fetch")) {

			String title = request.getParameter("title");
			int id = Integer.parseInt(request.getParameter("id"));

			HttpSession s = request.getSession();
			s.setAttribute("title", title);
			s.setAttribute("docid", id);

			ArrayList<Copy> arr = new CopyDAO().search(id);
			s.setAttribute("copyData", arr);

			response.sendRedirect("searchCopy.jsp");

		}

		if (ops.equals("borrow")) {

			int copyno = Integer.parseInt(request.getParameter("copyno"));
			int libid = Integer.parseInt(request.getParameter("libid"));

			HttpSession s = request.getSession();
			int readerid = (int) s.getAttribute("readerid");
			int docid = (int) s.getAttribute("docid");

			Timestamp t = new Timestamp(new java.util.Date().getTime());

			Borrows b1 = new Borrows();
			b1.setBdtime(t);
			b1.setCopyno(copyno);
			b1.setLibid(libid);
			b1.setReaderid(readerid);
			b1.setDocid(docid);

			new BorrowsDAO().insert(b1);

			//System.out.println(t);

			response.sendRedirect("readerSelector.jsp");

		}

		if (ops.equals("reserve")) {

			int copyno = Integer.parseInt(request.getParameter("copyno"));
			int libid = Integer.parseInt(request.getParameter("libid"));

			HttpSession s = request.getSession();
			int readerid = (int) s.getAttribute("readerid");
			int docid = (int) s.getAttribute("docid");

			Timestamp t = new Timestamp(new java.util.Date().getTime());

			Reserves r1 = new Reserves();
			r1.setDtime(t);
			r1.setCopyno(copyno);
			r1.setLibid(libid);
			r1.setReaderid(readerid);
			r1.setDocid(docid);

			new ReservesDAO().insert(r1);

			//System.out.println(t);

			response.sendRedirect("readerSelector.jsp");

		}
		
		if (ops.equals("return")) {
			new BorrowsDAO().delete(Integer.parseInt(request.getParameter("id")));
			
			response.sendRedirect("readerSelector.jsp");
		
		}

		if (ops.equals("searchB")) {

			ArrayList<Borrows> arr=new BorrowsDAO().search((int)request.getSession().getAttribute("readerid"));
			request.getSession().setAttribute("borData", arr);
			//System.out.println(arr.size());
			response.sendRedirect("searchBorrow.jsp");

		}
		
		if (ops.equals("searchR")) {

			ArrayList<Reserves> arr=new ReservesDAO().search((int)request.getSession().getAttribute("readerid"));
			request.getSession().setAttribute("resData", arr);
			System.out.println(arr.size());
			response.sendRedirect("searchReserve.jsp");

		}
		
		if (ops.equals("cancel")) {
			new ReservesDAO().delete(Integer.parseInt(request.getParameter("id")));
			
			response.sendRedirect("readerSelector.jsp");
		
		}
	}
}
