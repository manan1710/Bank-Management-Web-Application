<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display Customer</title>
</head>
<body>

	<%-- SSN : ${customerBean.ws_ssn}
	<br> ID : ${customerBean.ws_cust_id}
	<br> Name : ${customerBean.ws_name}
	<br> Address : ${customerBean.ws_adrs}
	<br> Age : ${customerBean.ws_age}
	<br> --%>

	<%@include file="HeaderFooter.jsp" %><br>
	<%@include file="Session.jsp" %>
	
	<table border="1" cellpadding="5" cellspacing="5">
		<tr>
			<td>SSN</td>
			<td>${customerBean.ws_ssn}</td>
		</tr>
		<tr>
			<td>ID</td>
			<td>${customerBean.ws_cust_id}</td>
		</tr>
		<tr>
			<td>Name</td>
			<td>${customerBean.ws_name}</td>
		</tr>
		<tr>
			<td>Address</td>
			<td>${customerBean.ws_adrs}</td>
		</tr>
		<tr>
			<td>City</td>
			<td>${customerBean.ws_city}</td>
		</tr>
		<tr>
			<td>State</td>
			<td>${customerBean.ws_state}</td>
		</tr>
		<tr>
			<td>Age</td>
			<td>${customerBean.ws_age}</td>
		</tr>
		<tr>
			<td>Status</td>
			<td>${customerBean.ws_status}</td>
		</tr>
		<tr>
			<td>Last Updated</td>
			<td>${customerBean.ws_last_update}</td>
		</tr>
	</table>

</body>
</html>