<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account Statement Options</title>
</head>
<body>
<%@include file="HeaderFooter.jsp" %><br>
<%@include file="Session.jsp" %>
<h1>Account Statement Options</h1>

	<form action="TransactionController?operation=viewAccountStatement" method="post">

		<table>
			<tr>
				<td>Account ID</td>
				<td>${account.ws_acct_id}<input type="hidden" name="accid" value="${account.ws_acct_id }"></td>
			</tr>
			<tr>
				<td><input type="radio" name="acct_statement_options" value="number"> Last Number of Transactions</td>
				<td><input type="number" name="numberOfTrxns" placeholder="Last number of transactions"></td>
			</tr>
			<tr>
				<td><input type="radio" name="acct_statement_options" value="date"> Start-End Dates</td>
				<td><input type="text" name="startdate" placeholder="Enter start date (dd/mm/yyyy)">-<input type="text" name="enddate" placeholder="Enter end date (dd/mm/yyyy)"> </td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="Submit"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><h3 style="color: red;">${acctStatementError }</h3></td>
			</tr>
		</table>

	</form>

</body>
</html>