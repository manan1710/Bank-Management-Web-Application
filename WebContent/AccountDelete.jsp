<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account Delete</title>
</head>
<body>
	<%
		String insertError = (String) request.getAttribute("insertError");
		String operation = (String) request.getAttribute("operation");
	%>
	<%@include file="HeaderFooter.jsp" %><br>
	<%@include file="Session.jsp" %>
	<form action="AccountController?operation=<%=operation%>" method="post">
		<table>
			<tr>
				<td>
					Account ID
				</td>
				<td>
					<input type="number" name="accountid">
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="Delete Account">
				</td>
				<td>
					<input type="reset" value="clear">
				</td>
			</tr>
			<tr>
				<td colspan="2"><h3 style="color: red;"><%=insertError == null ? "" : insertError %></h3></td>
			</tr>
		</table>
	</form>
</body>
</html>