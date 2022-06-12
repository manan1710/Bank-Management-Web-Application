<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Registration</title>
</head>
<body>

	<%
		String insertError = (String) request.getAttribute("insertError");
		String operation = (String) request.getAttribute("operation");
	%>
	<%@include file="HeaderFooter.jsp" %><br>
	<%@include file="Session.jsp" %>
	<h1>Add New Customer</h1>
	<form action="CustomerController?operation=<%=operation %>" method="post">
	
		<table>
			<tr>
				<td>SSN:</td>
				<td><input type="text" name="ssn" required/></td>
			</tr>
			<!-- <tr>
				<td>Customer ID:</td>
				<td><input type="text" name="customerid" required/></td>
			</tr> -->
			<tr>
				<td>Name:</td>
				<td><input type="text" name="name" required/></td>
			</tr>
			<tr>
				<td>Age:</td>
				<td><input type="number" name="age" required/></td>
			</tr>
			<tr>
				<td>Address:</td>
				<td><input type="text" name="address" required/></td>
			</tr>
			<tr>
				<td>City:</td>
				<td><input type="text" name="city" required/></td>
			</tr>
			<tr>
				<td>State:</td>
				<td><input type="text" name="state" required/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Create Customer" /></td>
			</tr>
			<tr>
				<td colspan="2"><h3 style="color: red;"><%=insertError == null ? "" : insertError %></h3></td>
			</tr>
		</table>
	</form>

</body>
</html>