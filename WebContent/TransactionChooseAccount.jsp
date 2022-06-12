<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Choose Account for Transaction</title>
</head>
<body>
	
	<%
		String operation = (String) request.getAttribute("operation");
	%>
	<%@include file="HeaderFooter.jsp" %><br>
	<%@include file="Session.jsp" %>
	<label for="accounts">Choose an Account :</label>

	<form action="TransactionController?operation=<%=operation%>" method="post">
		<select name="accounts" id="accounts">
			<c:forEach var="account" items="${list }">
				<option value="${account.ws_acct_id }">${account.ws_acct_id }</option>
			</c:forEach>
		</select> <input type="submit" value="Choose">
	</form>
</body>
</html>