package com.project.onlinegrocery.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;

import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.onlinegrocery.GetApplicationContext;
import com.project.onlinegrocery.dao.SignupDao;
import com.project.onlinegrocery.pojo.SignupPojo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@RequestMapping("usersignup")
	public void userSignup(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		String fullname = request.getParameter("fullname");
		String mobile = request.getParameter("mobile");
		String password = request.getParameter("password");
		String confirmpassword = request.getParameter("confirmpassword");
		
		if(password.equals(confirmpassword)) {
			ApplicationContext ac = GetApplicationContext.getApplicationContext();
			SignupDao bean = ac.getBean(SignupDao.class);
			
			int check = bean.checkEntry(mobile);
			
			if(check == 0) {
				SignupPojo save = bean.save(new SignupPojo(mobile, fullname, password, LocalDateTime.now().toString()));
				if(save != null) {
					
					ArrayList<String> al = new ArrayList<>();
					al.add(mobile);
					al.add(password);
					 
					session.setAttribute("logindata", al);
					session.setAttribute("msg", "Signed up successfully!");
					response.sendRedirect("index.jsp");
				}
				else {
					session.setAttribute("msg", "Something went wrong!");
					response.sendRedirect("signup.jsp");
				}
			}
			else {
				session.setAttribute("msg", "User already exist!");
				response.sendRedirect("index.jsp");
			}
		}
		else {
			session.setAttribute("msg", "Password doesn't match!");
			response.sendRedirect("signup.jsp");
		}
	}
	
	
	
	@RequestMapping("userlogin")
	public void userLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		String mobile = request.getParameter("mobile");
		String password = request.getParameter("password");
		
		ApplicationContext ac = GetApplicationContext.getApplicationContext();
		SignupDao bean = ac.getBean(SignupDao.class);
		
		int loggedin = bean.isUserLoggedIn(mobile, password);
		
		if(loggedin == 0) {
			session.setAttribute("msg", "Invalid Credentials!");
			response.sendRedirect("index.jsp");
		}
		else {
			ArrayList<String> al = new ArrayList<>();
			al.add(mobile);
			al.add(password);
			
			session.setAttribute("userlogindata", al);
			response.sendRedirect("home.jsp");
		}
	}
	
}
