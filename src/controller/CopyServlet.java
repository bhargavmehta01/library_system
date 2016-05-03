package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.CopyDAO;
import DAO.DocumentDAO;
import DAO.LibraryDAO;
import VO.Copy;
import VO.Document;
import VO.Library;

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

		}if (ops.equals("insert")) {
			
			String title = request.getParameter("title");
			int id = Integer.parseInt(request.getParameter("id"));
			
		}

	}
}
