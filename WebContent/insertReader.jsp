<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<form action="reader">
        <h2> Insert Reader</h2>
        Firstname:
        <input type="text" name="fname"><br>
        Address:
        <input type="text" name="addrs"><br>
        Type:
        <select name="rtype">
              <option value="student">Student</option>
              <option value="staff">Staff</option>
              <option value="senior">Senior citizen</option>
        </select><br>
        <input type="hidden" name="operation" value="insert">
        <input type="submit" value="Submit">
    </form>

</body>
</html>