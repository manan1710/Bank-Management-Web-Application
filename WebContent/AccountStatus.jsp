<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,bean.Account"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account Status</title>
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
<script type="text/javascript" src="AccountStatus.js"></script>
</head>
<body>
	<%@include file="HeaderFooter.jsp" %><br>
	<%@include file="Session.jsp" %><br>
	
	<h2 align="center">Account Status</h2>
	
	<%
		ArrayList<Account> a = (ArrayList)request.getAttribute("account");
		out.println("<table>");
		for(Account t:a)
		{
			out.println("<tr id = "+t.getWs_acct_id()+">");
			out.print("<td>"+t.getWs_cust_id()+"</td>");
			out.print("<td>"+t.getWs_acct_id()+"</td>");
			out.print("<td>"+t.getWs_acct_type()+"</td>");
			out.print("<td>"+t.getWs_acct_status()+"</td>");
			out.print("<td>"+t.getWs_acct_balance()+"</td>");
			out.print("<td>"+t.getWs_acct_crdate()+"</td>");
			out.print("<td>"+t.getWs_msg()+"</td>");
			out.print("<td>"+t.getWs_acct_crdate()+"</td>");
			out.println("<td><input type = 'submit' value = 'refresh' onclick='sendInfo("+t.getWs_acct_id()+")''></td>");
			out.println("</tr>");
		}
		out.println("</table>");
	%>
</body>
</html>