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

<table>
<tr>
<th>Title</th>
<th>Publish Date</th>
<th>Publisher Id</th>
<th></th>
<th></th>
</tr>

<%

ArrayList<Document> arr= (ArrayList<Document>)session.getAttribute("docarr");
	
	for(int i =0;i<arr.size();i++){
		
		Document d=arr.get(i);
		
%>
<tr>
<td><%=d.getTitle() %></td>
<td><%=d.getPubid() %></td>
<td><%=d.getPubdate() %></td>
<td><a href="document?operation=delete&id=<%=d.getDocid() %>">Delete</a></td>
<td><a href="document?operation=update&id=<%=d.getDocid() %>">Update</a></td>	
</tr>	
<% 
	}

%>

</table>

</body>
</html>