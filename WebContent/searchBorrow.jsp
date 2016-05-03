<%@page import="VO.Borrows"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<fieldset>
		<legend align="center">Borrowed Books</legend>
		<table align="center">
			<tr>
				<th align="center">Document Id</th>
				<th align="center">Lib ID</th>
				<th>Borrow Date</th>
				<th></th>
			</tr>
			<tr>
				<%
					ArrayList<Borrows> arr = (ArrayList<Borrows>) session.getAttribute("borData");

					for (int i = 0; i < arr.size(); i++) {

						Borrows b = arr.get(i);
				%>
			
			<tr>
				<td><%=b.getDocid() %></td>
				<td><%=b.getLibid() %></td>
				<td><%=b.getBdtime() %></td>
				<td><a href="copy?operation=return&id=<%=b.getBornumber() %>">Return</a></td>
			</tr>
			<%
				}
			%>
			</tr>

		</table>
	</fieldset>

</body>
</html>