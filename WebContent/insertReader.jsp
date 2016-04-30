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
    <fieldset>
    <legend align="center">INSERT READER</legend>
     <table align="center">
        <tr>
        <td align="left">Firstname:</td>
        <td align="center"><input type="text" name="fname"></td>
        </tr>
        <tr>
        <td align="left">Address:</td>
        <td align="center"><input type="text" name="addrs"></td>
        </tr>
     	<tr>
        <td align="left">Type:</td>
        <td align="center"><select>
              <option value="student">Student</option>
              <option value="staff">Staff</option>
              <option value="senior citizen">Senior Citizen</option>
        </select></td>
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