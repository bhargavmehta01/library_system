<%@page import="VO.Publisher"%>
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
	<form action="document">
		<table>
			<tr>
				<td align="left">Title:</td>
				<td align="center"><input type="text" name="title"></td>
			</tr>
			<tr>
				<td align="left">Publisher name:</td>
				<td><select name="pubid">
						<%
							ArrayList<Publisher> arr = (ArrayList<Publisher>) session.getAttribute("pubData");

							for (int i = 0; i < arr.size(); i++) {
								Publisher p = arr.get(i);
						%>
						<option value="<%=p.getId()%>"><%=p.getPubname()%></option>

						<%
							}
						%>

				</select></td>
			</tr>
			<tr>
				<td align="left">Published date:</td>
				<td align="center"><input type="date" name="pubdate"></td>
			</tr>

			<tr>
				<td><input type="hidden" name="operation" value="edit"></td>
				<td align="center"><input type="submit" value="Submit"></td>
			</tr>
		</table>
	</form>
</body>
</html>