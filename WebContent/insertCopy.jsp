<%@page import="VO.Library"%>
<%@page import="VO.Document"%>
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

	<form action="copy">
		<fieldset>
			<legend align="center">INSERT COPY</legend>
			<table align="center">
				<tr>
					<td align="center">Document title:</td>
					<td align="center"><select name="docid">
							<%
								ArrayList<Document> arr = (ArrayList<Document>) session.getAttribute("docData");

								for (int i = 0; i < arr.size(); i++) {
									Document d = arr.get(i);
							%>
							<option value="<%=d.getDocid()%>"><%=d.getTitle()%></option>

							<%
								}
							%>

					</select></td>
				</tr>
				
				<tr>
					<td align="center">Library ID:</td>
					<td align="center"><select name="libid">
							<%
								ArrayList<Library> arr2 = (ArrayList<Library>) session.getAttribute("libData");

								for (int i = 0; i < arr2.size(); i++) {
									Library l = arr2.get(i);
							%>
							<option value="<%=l.getId()%>"><%=l.getName()%></option>

							<%
								}
							%>

					</select></td>
				</tr>
				
				<tr>
					<td align="center">Copy No:</td>
					<td align="center"><select name="copyno">
							<%

								for (int i = 1; i <= 10; i++) {
							%>
							<option value="<%=i%>"><%=i%></option>

							<%
								}
							%>

					</select></td>
				</tr>
				
				<tr>
					<td align="left">Position:</td>
					<td align="center"><input type="text" name="position"></td>
				</tr>
				<tr>
					<td></td>
					<input type="hidden" name="operation" value="insert">
					<td align="center"><input type="submit" value="Submit"></td>
				</tr>
			</table>
		</fieldset>
	</form>

</body>
</html>