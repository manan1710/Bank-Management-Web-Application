<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account Statement</title>
<style>
	table 
	{
  		border-collapse: collapse;
  		margin-left:auto;
  		margin-right:auto;
	}
	table, td, tr 
	{
	  border: 1px solid black;
	}
</style>
</head>
<body>
	<%@include file="HeaderFooter.jsp" %><br>
	<%@include file="Session.jsp" %>
	<h1 align="center">Account Statement</h1>

	<table>
		<tr>
			<th>Transaction ID</th>
			<th>Description</th>
			<th>Date (YYYY-MM-DD)</th>
			<th>Amount</th>
		</tr>

		<c:forEach var="transaction" items="${statementList }">
			<tr>
				<td>${transaction.ws_trxn_id }</td>
				<td>${transaction.ws_op }</td>
				<td>${transaction.ws_trxn_date }</td>
				<td>${transaction.ws_amt }</td>
			</tr>
		</c:forEach>
	</table>
	
	<button ><a href="TransactionController?operation=downloadPDF&accid=${accid}">Download PDF</a></button>

</body>
</html>