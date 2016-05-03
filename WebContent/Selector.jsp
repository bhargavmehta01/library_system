<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
a:link
{
	background-color: #B0C4DE;
    padding: 10px 20px;
    text-decoration: none;
    color: initial;
    display: inline-block;
}

a:hover, a:active {
    background-color: #F4A460;
}
</style>
</head>
<body>


<form align="center">
<a href="insertReader.jsp">Reader</a>
<a href="insertPublisher.jsp">Publisher</a>
<a href="document?operation=load">Document</a>
<a href="insertLibrary.jsp">Library</a>
<a href="copy?operation=load">Copy</a>
<a href="document?operation=searchAll">Search Documents</a>
</form>

</body>
</html>