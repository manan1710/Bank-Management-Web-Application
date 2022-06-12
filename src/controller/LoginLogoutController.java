package controller;

import java.io.IOException;

import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.Login;
import service.LoginServiceImpl;

public class LoginLogoutController extends HttpServlet
{
	
	// Logout functionality
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		response.sendRedirect("login.jsp");
	}
	
	// Login functionality
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String ws_username = request.getParameter("username");
		String ws_password = request.getParameter("password");
		Date date = new Date();
		Timestamp ws_timestamp = new Timestamp(date.getTime());
		
		Login l = new Login();
		l.setWs_username(ws_username);
		l.setWs_password(ws_password);
		l.setWs_timestamp(ws_timestamp);
		
		LoginServiceImpl service = new LoginServiceImpl();
		boolean status = service.check(l); 
		if(status)
		{
			HttpSession session = request.getSession();
			session.setAttribute("login", true);
			session.setAttribute("username", l.getWs_username());
//			session.setAttribute("password", l.getWs_password());
			session.setAttribute("timestamp", l.getWs_timestamp());
//			response.sendRedirect("AccountController?operation=create");
			response.sendRedirect("index.jsp");
		}
		else
		{
			HttpSession session = request.getSession();
			session.invalidate();
			request.setAttribute("loginError", "Invalid Credentials !!");
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");  
	        rd.forward(request, response); 
		}
	}
}
