<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<% 
		if(session.getAttribute("login") != null)
		{
			boolean status = (boolean)session.getAttribute("login");
			out.println(status);
			response.sendRedirect("index.jsp");
		}	
	%>
	<form action = "LoginLogoutController" method="post">
		<table>
			<tr>
				<td>
					Login
				</td>
				<td>
					<input type="text" name="username" required="required">
				</td>
			</tr>
			<tr>
				<td>
					Password
				</td>
				<td>
					<input type="password" name = "password" required="required">
				</td>
			</tr>
			<tr>
				<td>
					<input type = "submit" value="login">
				</td>
				<td>
					<input type = "reset" value="clear">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<h3 style="color: red;">${loginError }</h3>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>