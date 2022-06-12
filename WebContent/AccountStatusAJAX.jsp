<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.sql.*,bean.Account,service.AccountServiceImpl"%>
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
		Long ws_acct_id = Long.parseLong(request.getParameter("val"));  
		AccountServiceImpl service = new AccountServiceImpl();
		Account a = new Account();
		a.setWs_acct_id(ws_acct_id);
		a = service.readAccount(a);
		out.println("<tr id = "+a.getWs_acct_id()+">");
		out.print("<td>"+a.getWs_cust_id()+"</td>");
		out.print("<td>"+a.getWs_acct_id()+"</td>");
		out.print("<td>"+a.getWs_acct_type()+"</td>");
		out.print("<td>"+a.getWs_acct_status()+"</td>");
		out.print("<td>"+a.getWs_acct_balance()+"</td>");
		out.print("<td>"+a.getWs_acct_crdate()+"</td>");
		out.print("<td>"+a.getWs_msg()+"</td>");
		out.print("<td>"+a.getWs_acct_crdate()+"</td>");
		out.println("<td><input type = 'submit' value = 'refresh' onclick='sendInfo("+a.getWs_acct_id()+")''></td>");
		out.println("</tr>");
	%>
</body>
</html>