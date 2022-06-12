<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Customer</title>
</head>
<body>

	<%
		String operation = (String) request.getAttribute("operation");
	%>
	<%@include file="HeaderFooter.jsp" %><br>
	<%@include file="Session.jsp" %>
	<h1>Search Customer Options</h1>

<form action="CustomerController?operation=<%=operation %>" method="post">

	<input type="radio" name="search" value="ssn"> Search by SSN : <input type="text" name="ssn"> <br><br>
	<input type="radio" name="search" value="custid"> Search by ID : <input type="text" name="custid"> <br><br>
	
	<input type="submit" value="Search">
</form>

</body>
</html>