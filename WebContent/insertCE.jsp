<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="chiefedtr">
    <fieldset>
    <legend align="center">INSERT CHIEF EDITOR</legend>
	<table align="center">
	<tr>
        <td align="center">Editor name:</td>
        <td align="center"><input type="text" name="aname"></td>
    </tr>
    <tr>
    <input type="hidden" name="operation" value="insert">
       <td align="center"> <input type="submit" value="Submit"></td>
       </tr>
       </table>
    </fieldset>
    </form>
</body>
</html>