<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display Account</title>
</head>
<body>
	<%@include file="HeaderFooter.jsp" %><br>
	<%@include file="Session.jsp" %>
	<h1 align="center">Account Details</h1>

	<table border="1" style="margin: 0px auto;">

		<thead>
			<tr>
				<th>Customer ID</th>
				<th>Account ID</th>
				<th>Account Type</th>
				<th>Account Status</th>
				<th>Account Balance</th>
				<th>Account Creation Date</th>
				<th>Last Activity</th>
				<th>Last Transaction Date</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="account" items="${list }">
				<tr>
					<td>${account.ws_cust_id }</td>
					<td>${account.ws_acct_id }</td>
					<td>${account.ws_acct_type }</td>
					<td>${account.ws_acct_status }</td>
					<td>${account.ws_acct_balance }</td>
					<td>${account.ws_acct_crdate }</td>
					<td>${account.ws_msg }</td>
					<td>${account.ws_trxn_ts }</td>
				</tr>
			</c:forEach>
		</tbody>

	</table>

</body>
</html>