<%@page import="VO.Publisher"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript">

function myFunc(){
	
	var sel=document.getElementById("docType").value 

	if(sel=="book"){
		document.getElementById("bookdiv").style.display="";
		document.getElementById("journaldiv").style.display="none";
		document.getElementById("proceedingdiv").style.display="none";
	}else if(sel=="journal"){
		document.getElementById("journaldiv").style.display="";
		document.getElementById("bookdiv").style.display="none";
		document.getElementById("proceedingdiv").style.display="none";
	}else if(sel=="proceeding"){
		document.getElementById("proceedingdiv").style.display="";
		document.getElementById("bookdiv").style.display="none";
		document.getElementById("journaldiv").style.display="none";
	}else if(sel=="nothing"){
		document.getElementById("bookdiv").style.display="none";
		document.getElementById("journaldiv").style.display="none";
		document.getElementById("proceedingdiv").style.display="none";
	}
	
	
	
}

</script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="document">
    <fieldset>
    <legend align="center">INSERT DOCUMENT</legend>
        <table align="center">
        <tr>
        <td align="left">Title:</td>
        <td align="center"><input type="text" name="title"></td>
		</tr>
        <tr>
        <td align="left">Publisher name:</td>
        <td><select name="pubid">
        <%
        ArrayList<Publisher> arr = (ArrayList<Publisher>)session.getAttribute("pubData");
        
        for(int i=0;i<arr.size();i++){
        Publisher p =arr.get(i);
        %>
		<option value="<%=p.getId() %>"><%=p.getPubname() %></option>

		<%
        }
		%>
	
        </select>
        </td>
        </tr>
        <tr>
        <td align="left">Published date:</td>
        <td align="center"><input type="date" name="pubdate"></td>
        </tr>
        <tr>
        <td></td>
        <input type="hidden" name="operation" value="insert">
        <td align="center"><input type="submit" value="Submit"></td>
        </tr>
        <tr>
        <td align="left">Document type:</td>
        <td><select name="docType" id="docType" onchange="myFunc()">
        	<option value="nothing">---</option>
        	<option value="book">Book</option>
        	<option value="journal">Journal</option>
        	<option value="proceeding">Proceeding</option>
        </select>
        <div id="bookdiv" style="display:none">
        book
        </div>
        <div id="journaldiv" style="display:none">
        journal
        </div>
        <div id="proceedingdiv" style="display:none">
        proceeding
        </div>
        
        </tr>
        
        
        </fieldset>
    </form>
</body>
</html>