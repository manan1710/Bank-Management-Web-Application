<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Transfer Money</title>
</head>
<body>
<%@include file="HeaderFooter.jsp" %><br>
<%@include file="Session.jsp" %>
<h1>Transfer Money</h1>

	<form action="TransactionController?operation=transferMoney" method="post">

		<table>
			<tr>
				<td>Customer ID</td>
				<td>${account.ws_cust_id}</td>
			</tr>
			<tr>
				<td>Account ID</td>
				<td>${account.ws_acct_id}<input type="hidden" name="accid" value="${account.ws_acct_id }"></td>
			</tr>
			<tr>
				<td>Account Type</td>
				<td>${account.ws_acct_type}</td>
			</tr>
			<tr>
				<td>Balance</td>
				<td>${account.ws_acct_balance}<input type="hidden" name="accBalance" value="${account.ws_acct_balance }"></td>
			</tr>
			<tr>
				<td>Target Account ID</td>
				<td><input type="text" name="tgtAccountId" required></td>
			</tr>
			<tr>
				<td>Transfer Amount</td>
				<td><input type="text" name="transferAmt" required></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="Submit"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><h3 style="color: red;">${transferError }</h3></td>
			</tr>
		</table>

	</form>

</body>
</html>