package com.solaressentials.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import com.solaressentials.connection.DBCon;
import com.solaressentials.dao.UserDao;
import com.solaressentials.model.User;
import com.solaressentials.connection.DBCon;
import com.solaressentials.dao.UserDao;
import com.solaressentials.model.User;

public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.sendRedirect("registration.jsp");

	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String cpassword = request.getParameter("cpassword");
			String username = request.getParameter("username");

			if(password.equals(cpassword)) {
				try {
					UserDao udao = new UserDao(DBCon.getConnection());
					int r = udao.userRegistration(email,username,password);

					if (r == 1) {
						response.sendRedirect("login.jsp");
					} else {
						out.print("user login failed!");

					}
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					out.print("user login failed!");

				}
			}

			
		}
	}

}
