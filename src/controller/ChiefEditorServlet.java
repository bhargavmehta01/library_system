package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ChiefEditorDAO;
import VO.ChiefEditor;



public class ChiefEditorServlet extends HttpServlet{

protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ops=request.getParameter("operation");
		
		if(ops.equals("insert")){
			
			ChiefEditor c1 = new ChiefEditor();
			c1.setEname(request.getParameter("ename"));
			
			new ChiefEditorDAO().insert(c1);
			
			response.sendRedirect("insertCE.jsp");
		}
		
	}
	
}
