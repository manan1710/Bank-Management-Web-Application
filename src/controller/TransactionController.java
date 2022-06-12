package controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Account;
import bean.Transaction;
import pdf.GeneratePdf;
import service.AccountServiceImpl;
import service.TransactionServiceImpl;

/**
 * Servlet implementation class TransactionController
 */
@WebServlet("/TransactionController")
public class TransactionController extends HttpServlet {

   
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String operation = request.getParameter("operation");
		System.out.println(operation);
		if(operation.equals("withdraw") || operation.equals("deposit") || operation.equals("transfer") || operation.equals("statement"))
		{
			request.setAttribute("operation", operation);
			request.getRequestDispatcher("TransactionAccountSearch.jsp").include(request, response);
		}
		else if(operation.equals("downloadPDF"))
		{
			System.out.println("in else if og do get method");
			System.out.println(operation);
			long accid = Long.parseLong(request.getParameter("accid"));
			HttpSession session = request.getSession();
			ArrayList<Transaction> list = (ArrayList<Transaction>) session.getAttribute("statementListSession");
			for(Transaction t : list)
			{
				System.out.println(t);
			}
			response.setContentType("application/pdf;charset=UTF-8");
	        response.addHeader("Content-Disposition", "inline; filename="+accid+"_transactions.pdf");
	        ServletOutputStream out = response.getOutputStream();
	        ByteArrayOutputStream baos = GeneratePdf.generatePdf(list);
			baos.writeTo(out);
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String operation = request.getParameter("operation");
		
		if(operation.equals("withdraw") || operation.equals("deposit") || operation.equals("transfer") || operation.equals("statement"))
		{
			TransactionServiceImpl service = new TransactionServiceImpl();
			String searchBy = request.getParameter("search");
			ArrayList<Account> list = new ArrayList<Account>();
			if(searchBy.equals("cust_id"))
			{
				long custid = Long.parseLong(request.getParameter("custid"));
				Account a = new Account();
				a.setWs_cust_id(custid);
				list = service.readAllCustomerAccount(a);
				for(Account acc : list)
				{
					System.out.println(acc);
				}
			}
			else if(searchBy.equals("acc_id"))
			{
				long accid = Long.parseLong(request.getParameter("accid"));
				Account a = new Account();
				a.setWs_acct_id(accid);
				Account acc = service.readAccount(a);
				list.add(acc);
			}
			request.setAttribute("list", list);
			if(operation.equals("withdraw"))
			{
				request.setAttribute("operation", operation+"page");
			}
			else if(operation.equals("deposit"))
			{
				request.setAttribute("operation", operation+"page");
			}
			else if(operation.equals("transfer"))
			{
				request.setAttribute("operation", operation+"page");
			}
			else if(operation.equals("statement"))
			{
				request.setAttribute("operation", operation+"page");
			}
			request.getRequestDispatcher("TransactionChooseAccount.jsp").include(request, response);
		}
		else if(operation.equals("withdrawpage"))
		{
			long accid = Long.parseLong(request.getParameter("accounts"));
			System.out.println("accid : "+accid);
			TransactionServiceImpl service = new TransactionServiceImpl();
			Account a = new Account();
			a.setWs_acct_id(accid);
			Account acc = service.readAccount(a);
			request.setAttribute("account", acc);
			request.getRequestDispatcher("TransactionWithdrawMoney.jsp").include(request, response);
		}
		else if(operation.equals("withdrawMoney"))
		{
			TransactionServiceImpl service = new TransactionServiceImpl();
			long accid = Long.parseLong(request.getParameter("accid"));
			long accBalance = Long.parseLong(request.getParameter("accBalance"));
			long withdrawAmt = Long.parseLong(request.getParameter("withdrawAmt"));
			System.out.println(accid+" "+accBalance+" "+withdrawAmt);
			int status = 0;
			if(accBalance>=withdrawAmt)
			{
				Transaction t = new Transaction();
				t.setWs_src_acct_id(accid);
				t.setWs_tgt_acct_id(accid);
				t.setWs_amt(withdrawAmt);
				t.setWs_op("W");
				status = service.transactionWithdraw(t);
				if(status>0)
				{
					System.out.println("Collect your amount");
					response.sendRedirect("index.jsp");
				}
				else {
					Account a = new Account();
					a.setWs_acct_id(accid);
					Account acc = service.readAccount(a);
					request.setAttribute("account", acc);
					System.out.println("Error occured in withdraw money");
					request.setAttribute("withdrawError", "Error occured in withdraw money");
					request.getRequestDispatcher("TransactionWithdrawMoney.jsp").include(request, response);
				}
			}
			else {
				Account a = new Account();
				a.setWs_acct_id(accid);
				Account acc = service.readAccount(a);
				request.setAttribute("account", acc);
				System.out.println("You Don't have enough balance to withdraw money");
				request.setAttribute("withdrawError", "Don't have enough balance to withdraw money");
				request.getRequestDispatcher("TransactionWithdrawMoney.jsp").include(request, response);
			}
		}
		else if(operation.equals("depositpage"))
		{
			long accid = Long.parseLong(request.getParameter("accounts"));
			System.out.println("accid : "+accid);
			TransactionServiceImpl service = new TransactionServiceImpl();
			Account a = new Account();
			a.setWs_acct_id(accid);
			Account acc = service.readAccount(a);
			request.setAttribute("account", acc);
			request.getRequestDispatcher("TransactionDepositMoney.jsp").include(request, response);
		}
		else if(operation.equals("depositMoney"))
		{
			TransactionServiceImpl service = new TransactionServiceImpl();
			long accid = Long.parseLong(request.getParameter("accid"));
			long accBalance = Long.parseLong(request.getParameter("accBalance"));
			long depositAmt = Long.parseLong(request.getParameter("depositAmt"));
			System.out.println(accid+" "+accBalance+" "+depositAmt);
			int status = 0;
//			if(accBalance>=withdrawAmt)
//			{
				Transaction t = new Transaction();
				t.setWs_src_acct_id(accid);
				t.setWs_tgt_acct_id(accid);
				t.setWs_amt(depositAmt);
				t.setWs_op("D");
				status = service.transactionDeposit(t);
				if(status>0)
				{
					System.out.println("Your amount is deposited");
					response.sendRedirect("index.jsp");
				}
				else {
					Account a = new Account();
					a.setWs_acct_id(accid);
					Account acc = service.readAccount(a);
					request.setAttribute("account", acc);
					System.out.println("Error occured in deposit money");
					request.setAttribute("depositError", "Error occured in deposit money");
					request.getRequestDispatcher("TransactionDepositMoney.jsp").include(request, response);
				}
//			}
//			else {
//				Account a = new Account();
//				a.setWs_acct_id(accid);
//				Account acc = service.readAccount(a);
//				request.setAttribute("account", acc);
//				System.out.println("You Don't have enough balance to withdraw money");
//				request.setAttribute("withdrawError", "Don't have enough balance to withdraw money");
//				request.getRequestDispatcher("TransactionWithdrawMoney.jsp").include(request, response);
//			}
		}
		else if(operation.equals("transferpage"))
		{
			long accid = Long.parseLong(request.getParameter("accounts"));
			System.out.println("accid : "+accid);
			TransactionServiceImpl service = new TransactionServiceImpl();
			Account a = new Account();
			a.setWs_acct_id(accid);
			Account acc = service.readAccount(a);
			request.setAttribute("account", acc);
			request.getRequestDispatcher("TransactionTransferMoney.jsp").include(request, response);
		}
		else if(operation.equals("transferMoney"))
		{
			TransactionServiceImpl service = new TransactionServiceImpl();
			long accid = Long.parseLong(request.getParameter("accid"));
			long accBalance = Long.parseLong(request.getParameter("accBalance"));
			long tgtAccId = Long.parseLong(request.getParameter("tgtAccountId"));
			long transferAmt = Long.parseLong(request.getParameter("transferAmt"));
			System.out.println(accid+" "+accBalance+" "+tgtAccId+" "+transferAmt);
			int status = 0;
			if(accBalance>=transferAmt)
			{
				Transaction t = new Transaction();
				t.setWs_src_acct_id(accid);
				t.setWs_tgt_acct_id(tgtAccId);
				t.setWs_amt(transferAmt);
				t.setWs_op("T");
				status = service.transactionTransfer(t);
				if(status>0)
				{
					System.out.println("Amount Transferred success");
					response.sendRedirect("index.jsp");
				}
				else {
					Account a = new Account();
					a.setWs_acct_id(accid);
					Account acc = service.readAccount(a);
					request.setAttribute("account", acc);
					System.out.println("Error occured in transfering money");
					request.setAttribute("transferError", "Error occured in transfering money");
					request.getRequestDispatcher("TransactionTransferMoney.jsp").include(request, response);
				}
			}
			else {
				Account a = new Account();
				a.setWs_acct_id(accid);
				Account acc = service.readAccount(a);
				request.setAttribute("account", acc);
				System.out.println("You Don't have enough balance to transfer money");
				request.setAttribute("transferError", "Don't have enough balance to transfer money");
				request.getRequestDispatcher("TransactionTransferMoney.jsp").include(request, response);
			}
		}
		else if(operation.equals("statementpage"))
		{
			long accid = Long.parseLong(request.getParameter("accounts"));
			System.out.println("accid : "+accid);
			TransactionServiceImpl service = new TransactionServiceImpl();
			Account a = new Account();
			a.setWs_acct_id(accid);
			Account acc = service.readAccount(a);
			request.setAttribute("account", acc);
			request.getRequestDispatcher("TransactionAccountStatementOptions.jsp").include(request, response);
		}
		else if(operation.equals("viewAccountStatement"))
		{
			TransactionServiceImpl service = new TransactionServiceImpl();
			long accid = Long.parseLong(request.getParameter("accid"));
			String searchBy = request.getParameter("acct_statement_options");
			ArrayList<Transaction> list = new ArrayList<Transaction>();
			if(searchBy.equals("number"))
			{
				// last n transactions value
				int n = Integer.parseInt(request.getParameter("numberOfTrxns"));
				list = service.readTransactionNumberWise(accid, n);
			}
			else if(searchBy.equals("date"))
			{
				String startdate = request.getParameter("startdate");
				String enddate = request.getParameter("enddate");
				list = service.readTransactionDateWise(accid, startdate, enddate);
			}
			for(Transaction t : list)
			{
				System.out.println(t);
			}
			request.setAttribute("statementList", list);
			HttpSession session = request.getSession();
			session.setAttribute("statementListSession", list);
			// generating pdf in our server
//			response.setContentType("application/pdf;charset=UTF-8");
//	        response.addHeader("Content-Disposition", "inline; filename="+accid+"_transactions.pdf");
//	        ServletOutputStream out = response.getOutputStream();
//	        ByteArrayOutputStream baos = GeneratePdf.generatePdf(list);
//			baos.writeTo(out);
	        
	        request.setAttribute("filename", accid+"_transactions.pdf");
			request.setAttribute("accid", accid);
			request.getRequestDispatcher("TransactionDisplayAcctStatement.jsp").include(request, response);
		}
		
	}

}
