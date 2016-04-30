<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>
    <fieldset>
    <legend align="center">INSERT DOCUMENT</legend>
        <table align="center">
        <tr>
        <td align="left">Title:</td>
        <td align="center"><input type="text" name="title"></td>
		</tr>
        <tr>
        <td align="left">Publisher name:</td>
        <td align="center"><input type="text" name="pubname"></td>
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
        </fieldset>
    </form>
</body>
</html>