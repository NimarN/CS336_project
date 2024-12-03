<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<div align = center>
	<h1>User Login</h1>
	<form action= "validateLogin.jsp" method=post>
		<table>
			<tr>
				<td>Enter Name:</td>
				<td><input type=text name=txtName></td>
			</tr>
			<tr>
				<td>Enter Password:</td>
				<td><input type=password name=txtPwd></td>
		</table>
		<label for="loginType">Choose Account Type</label>
		<select name=loginType>
  		<option value="customers">Customer</option>
  		<option value="customerReps">Customer Rep</option>
  		<option value="admins">Admin</option>	
		</select>
		<input type=submit value=Login>
	</form>
	<p>Don't Have an Account</p>
	<a href="register.jsp">register</a>
</div>
</body>
</html>