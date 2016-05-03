<%@page import="VO.Reserves"%>
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
		<legend align="center">Reserved Books</legend>
		<table align="center">
			<tr>
				<th align="center">Document Id</th>
				<th align="center">Lib ID</th>
				<th>Borrow Date</th>
				<th></th>
			</tr>
			<tr>
				<%
					ArrayList<Reserves> arr = (ArrayList<Reserves>) session.getAttribute("resData");

					for (int i = 0; i < arr.size(); i++) {

						Reserves r = arr.get(i);
				%>
			
			<tr>
				<td><%=r.getDocid() %></td>
				<td><%=r.getLibid() %></td>
				<td><%=r.getDtime() %></td>
				<td><a href="copy?operation=cancel&id=<%=r.getReserveid() %>">Cancel</a></td>
			</tr>
			<%
				}
			%>
			</tr>

		</table>
	</fieldset>

</body>
</html>