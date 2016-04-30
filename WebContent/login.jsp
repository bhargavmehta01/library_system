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
    <form action="login">
 <fieldset>
 <legend align="center">READER'S LOGIN</legend>
<table  align="center">
   		
        <tr>
            <td align="center">Username:</td>
         	<td align="center"><input type="text" name="uname"></td>
        </br>
        <tr>
        	<td align="center">Password:</td>
        	<td align="center"><input type="password" name="pswd"><br></td>
        </tr>
        	</br>
        <tr>
        	<td align="center"></td>
            <input type="hidden" name="auth" value="reader">
       		<td align="center"> <input type="submit" value="Submit"></td>
       	</tr>
       		
       		
       		</table>
       		</fieldset>
    </form> 
    </br>
    </br>
    </br>
    <form action="login">
     <fieldset>
      <legend align="center">ADMIN'S LOGIN</legend>
       <table align="center">
        </br>
        <tr>
        <td  align="center">Username:</td>
        <td align="center"><input type="text" name="uname"></td>
        </tr>
        </br>
        <tr>
        <td align="center">Password:</td>
        <td align="center"><input type="password" name="pswd"></td>
        </tr>
        </br>
        <tr>
        <td align="center"></td>
        <input type="hidden" name="auth" value="admin">
        <td align="center"><input type="submit" value="Submit"></td>
 		</tr>   
       </table>
     </fieldset>
    </form>
</body>
</html>