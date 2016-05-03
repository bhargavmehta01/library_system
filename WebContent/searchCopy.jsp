<%@page import="VO.Copy"%>
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
		<legend align="center"><%=session.getAttribute("title")%></legend>
		<table align="center">
			<tr>
				<th align="center">Library Id</th>
				<th align="center">Copy No</th>
				<th></th>
			</tr>
			<tr>
				<%
					ArrayList<Copy> arr = (ArrayList<Copy>) session.getAttribute("copyData");

					for (int i = 0; i < arr.size(); i++) {

						Copy c = arr.get(i);
				%>
			
			<tr>
				<td><%=c.getLibid() %></td>
				<td><%=c.getCopyno() %></td>
				<td><a href="copy?operation=borrow&libid=<%=c.getLibid()%>&copyno=<%=c.getCopyno() %>">Borrow</a></td>
				<td><a href="copy?operation=reserve&libid=<%=c.getLibid()%>&copyno=<%=c.getCopyno() %>">Reserve</a></td>
			</tr>
			<%
				}
			%>
			</tr>

		</table>
	</fieldset>

</body>
</html>