<%@page import="VO.Document"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Page</title>

<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">   
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<link rel="stylesheet" 
href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.min.css"></style>
<script type="text/javascript" 
src="http://cdn.datatables.net/1.10.2/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" 
src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
    $('#mytable').DataTable();
} );

</script>


</head>
<body>


<br>
<br>


<table id="mytable" class="display table table-stripped" cellspacing="0" width="100%">
	<thead>
		<tr>
			<th>Title</th>
			<th>Publisher Id</th>
			<th>Publish Date</th>
			<th></th>
		</tr>
	</thead>
	
	<tbody>
	<%

ArrayList<Document> arr= (ArrayList<Document>)session.getAttribute("docarr");
	
	for(int i =0;i<arr.size();i++){
		
		Document d=arr.get(i);
		
%>
<tr>
<td><%=d.getTitle() %></td>
<td><%=d.getPubid() %></td>
<td><%=d.getPubdate() %></td>
<td><a href="copy?operation=fetch&id=<%=d.getDocid() %>&title=<%=d.getTitle() %>">Get Details</a></td>
</tr>	
<% 
	}

%>
	
	
	</tbody>
</table>

</body>
