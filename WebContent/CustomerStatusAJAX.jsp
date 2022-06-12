<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*,bean.Customer,service.CustomerServiceImpl"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	table 
	{
  		border-collapse: collapse;
	}
	table, td, tr 
	{
	  border: 1px solid black;
	}
</style>
</head>
<body>
	<%
		Long ws_cust_id = Long.parseLong(request.getParameter("val"));  
		CustomerServiceImpl service = new CustomerServiceImpl();
		Customer c = service.getCustomerByID(ws_cust_id);
		
		out.println("<tr id = "+c.getWs_cust_id()+">");
		out.print("<td>"+c.getWs_ssn()+"</td>");
		out.print("<td>"+c.getWs_cust_id()+"</td>");
		out.print("<td>"+c.getWs_name()+"</td>");
		out.print("<td>"+c.getWs_adrs()+"</td>");
		out.print("<td>"+c.getWs_city()+"</td>");
		out.print("<td>"+c.getWs_state()+"</td>");
		out.print("<td>"+c.getWs_age()+"</td>");
		out.print("<td>"+c.getWs_status()+"</td>");
		out.print("<td>"+c.getWs_msg()+"</td>");
		out.print("<td>"+c.getWs_last_update()+"</td>");
		out.println("<td><input type = 'submit' value = 'refresh' onclick='sendInfo("+c.getWs_cust_id()+")''></td>");
		out.println("</tr>");
	%>
</body>
</html>