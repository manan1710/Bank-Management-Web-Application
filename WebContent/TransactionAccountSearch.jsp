<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Transaction Account Search</title>
</head>
<body>

	<%
		String operation = (String) request.getAttribute("operation");
	%>
	<%@include file="HeaderFooter.jsp" %><br>
	<%@include file="Session.jsp" %>
	<h1>Search Account Options</h1>

	<form action="TransactionController?operation=<%=operation%>" method="post">

		<input type="radio" name="search" value="cust_id"> Search by Customer ID : <input type="text" name="custid"> <br> <br>
		
		<input type="radio" name="search" value="acc_id"> Search by Account ID : <input type="text" name="accid"> <br> <br>
		
		<input type="submit" value="Search">
	</form>

</body>
</html>