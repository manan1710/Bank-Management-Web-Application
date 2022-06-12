<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList,bean.Customer"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Status</title>
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
<script type="text/javascript" src="CustomerStatus.js"></script>
</head>
<body>
	<%@include file="HeaderFooter.jsp" %><br>
	<%@include file="Session.jsp" %><br>
	
	<h2 align="center">Customer Status</h2>
	
	<%
		ArrayList<Customer> c = (ArrayList)request.getAttribute("customer");
		out.println("<table>");
		
		for(Customer t:c)
		{
			out.println("<tr id = "+t.getWs_cust_id()+">");
			out.print("<td>"+t.getWs_ssn()+"</td>");
			out.print("<td>"+t.getWs_cust_id()+"</td>");
			out.print("<td>"+t.getWs_name()+"</td>");
			out.print("<td>"+t.getWs_adrs()+"</td>");
			out.print("<td>"+t.getWs_city()+"</td>");
			out.print("<td>"+t.getWs_state()+"</td>");
			out.print("<td>"+t.getWs_age()+"</td>");
			out.print("<td>"+t.getWs_status()+"</td>");
			out.print("<td>"+t.getWs_msg()+"</td>");
			out.print("<td>"+t.getWs_last_update()+"</td>");
			out.println("<td><input type = 'submit' value = 'refresh' onclick='sendInfo("+t.getWs_cust_id()+")''></td>");
			out.println("</tr>");
		}
		out.println("</table>");
	%>
</body>
</html>