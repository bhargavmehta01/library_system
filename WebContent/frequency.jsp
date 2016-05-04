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
					ArrayList<String> arr = (ArrayList<String>) session.getAttribute("freqData");

					for (int i = 0; i < arr.size();) {
						
				%>
			
			<tr>
				<td><%=arr.get(i++) %></td>
				<td><%=arr.get(i++) %></td>
				<td><%=arr.get(i++) %></td>
			</tr>
			<%
				}
			%>
			</tr>

		</table>
	</fieldset>

</body>
</html>