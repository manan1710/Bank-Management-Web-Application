<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="HeaderFooterStyle.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div class="navbar">
		<center><h1 style="color: orange">DMM Bank</h1></center>
  		<a href="index.jsp">Home</a>
  		<div class="dropdown">
    		<button class="dropbtn">Customer Management <i class="fa fa-caret-down"></i></button>
    		<div class="dropdown-content">
      			<a href="CustomerController?operation=create">Create Customer</a>
      			<a href="CustomerController?operation=update">Update Customer</a>
      			<a href="CustomerController?operation=delete">Delete Customer</a>
      			<a href="CustomerController?operation=search">Customer Search</a>
    		</div>
  		</div> 
  		<div class="dropdown">
    		<button class="dropbtn">Account Management <i class="fa fa-caret-down"></i></button>
    		<div class="dropdown-content">
      			<a href="AccountController?operation=create">Create Account</a>
      			<a href="AccountController?operation=delete">Delete Account</a>
      			<a href="AccountController?operation=search">Account Search</a>
    		</div>
  		</div> 
  		<div class="dropdown">
    		<button class="dropbtn">Status Details <i class="fa fa-caret-down"></i></button>
    		<div class="dropdown-content">
      			<a href="CustomerController?operation=status">Customer Status</a>
      			<a href="AccountController?operation=status">Account Status</a>
    		</div>
  		</div> 
  		<div class="dropdown">
    		<button class="dropbtn">Transaction <i class="fa fa-caret-down"></i></button>
    		<div class="dropdown-content">
      			<a href="TransactionController?operation=deposit">Deposit Money</a>
      			<a href="TransactionController?operation=withdraw">Withdraw Money</a>
      			<a href="TransactionController?operation=transfer">Transfor Money</a>
    		</div>
  		</div>
  		<a href="TransactionController?operation=statement">Account Statement</a>
  		<a href="LoginLogoutController" style="float: right">Logout</a>
  		<a href="#" style="float: right">Welcome ${sessionScope.username }</a>
  		
	</div>

	<div class="footer">
  		<p>Copyright @2020 DMM Bank. All rights are reserved.</p>
	</div>
</body>
</html>