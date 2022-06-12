<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Customer</title>
</head>
<body>
	<%@include file="HeaderFooter.jsp" %><br>
	<%@include file="Session.jsp" %>
	<form action="CustomerController?operation=deletecustomer" method="post">

		<table border="1">
			<tr>
				<td>SSN</td>
				<td><input type="text" name="ssn" value="${customerBean.ws_ssn}" readonly></td>
			</tr>
			<tr>
				<td>ID</td>
				<td><input type="text" name="customerid" value="${customerBean.ws_cust_id}" readonly></td>
			</tr>
			<tr>
				<td>Name</td>
				<td><input type="text" name="name" value="${customerBean.ws_name}" readonly></td>
			</tr>
			<tr>
				<td>Address</td>
				<td><input type="text" name="address" value="${customerBean.ws_adrs}" readonly></td>
			</tr>
			<tr>
				<td>City</td>
				<td><input type="text" name="city" value="${customerBean.ws_city}" readonly></td>
			</tr>
			<tr>
				<td>State</td>
				<td><input type="text" name="state" value="${customerBean.ws_state}" readonly></td>
			</tr>
			<tr>
				<td>Age</td>
				<td><input type="text" name="age" value="${customerBean.ws_age}" readonly></td>
			</tr>
			<tr>
				<td>Status</td>
				<td><input type="text" name="status" value="${customerBean.ws_status}" readonly></td>
			</tr>
			<tr>
				<td>Last Updated</td>
				<td><input type="text" name="last_updated_time" value="${customerBean.ws_last_update}" readonly></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Delete"></td>
			</tr>
			<tr>
				<td colspan="2">${deleteError}</td>
			</tr>
		</table>

	</form>

</body>
</html>