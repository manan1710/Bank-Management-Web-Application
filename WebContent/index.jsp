<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>TCS Bank</title>
</head>
<body>

<%-- <jsp:include page="Session.jsp"/> --%>
<%-- <% 
	if(session.getAttribute("login") == null)
	{
		response.sendRedirect("login.jsp");
	}
%> --%>
<%@include file="HeaderFooter.jsp" %>
<%@include file="Session.jsp" %>
<h1 align="center" style="margin-top: 20px;">Welcome to DMM Bank</h1>

<!--  Customer related Operation -->
<!-- <a href="CustomerController?operation=create">Registration of Customer</a><br><br>
<a href="CustomerController?operation=update">Update Customer</a><br><br>
<a href="CustomerController?operation=delete">Delete Customer</a><br><br>
<a href="CustomerController?operation=search">Search Customer</a><br><br>
<a href="CustomerController?operation=status">Customer Status</a><br><br>


<!--  Account related Operation  -->
<!-- <a href = "AccountController?operation=create">Account Registration</a><br><br>
<a href = "AccountController?operation=delete">Account Delete</a><br><br>
<a href = "AccountController?operation=status">Account Status</a><br><br>
<a href = "AccountController?operation=search">Account Search</a><br><br>

<!--  Transaction related Operation  -->
<!-- <a href="TransactionController?operation=withdraw">Transaction : Withdraw Money</a><br><br>
<a href="TransactionController?operation=deposit">Transaction : Deposit Money</a><br><br>
<a href="TransactionController?operation=transfer">Transaction : Transfer Money</a><br><br>-->

</body>
</html>