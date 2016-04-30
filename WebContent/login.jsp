<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Library management system-Home Page</title>
<h1 align="center">LIBRARY MANAGEMENT SYSTEM</h1>
</head>
<body>
<h2> Reader's login</h2>
	<form action="login">
        Username:
        <input type="text" name="uname"><br>
        Password:
        <input type="password" name="pswd"><br>
        <input type="hidden" name="auth" value="reader">
        <input type="submit" value="Submit">
    </form>
    <br>
    <br> 
    <br>
    <br>
    <br>    
    <form action="login">
        <h2> Admin's login</h2>
        Username:
        <input type="text" name="uname"><br>
        Password:
        <input type="password" name="pswd"><br>
        <input type="hidden" name="auth" value="admin">
        <input type="submit" value="Submit">
    </form>
</body>
</html>