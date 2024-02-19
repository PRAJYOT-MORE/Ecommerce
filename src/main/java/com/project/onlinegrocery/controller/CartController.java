package com.project.onlinegrocery.controller;

import java.time.LocalDateTime;

import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.onlinegrocery.GetApplicationContext;
import com.project.onlinegrocery.dao.CartDao;
import com.project.onlinegrocery.dao.PlaceOrderDetailsDao;
import com.project.onlinegrocery.dao.PlaceOrderUserDetailsDao;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {

	@RequestMapping("cart")
	public void cart(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		
		int productsn = Integer.parseInt(request.getParameter("productsn"));
		String mobile = request.getParameter("mobile");
		String password = request.getParameter("password");
		int count = Integer.parseInt(request.getParameter("count"));
		
		ApplicationContext ac = GetApplicationContext.getApplicationContext();
		CartDao bean = ac.getBean(CartDao.class);

		int exist = bean.checkIfProductExist(productsn, mobile, password);
		
		if(exist == 0) {
			int res = bean.insertIntoCart(productsn, count, mobile, password, LocalDateTime.now().toString());
			if(res != 0) {
				session.setAttribute("msg", "Product added to the cart successfully!");
				response.sendRedirect("cart.jsp");
			}
			else {
				session.setAttribute("msg", "Something went wrong!");
				response.sendRedirect("product-details.jsp");
			}
		}
		else {
			int updateCartItem = bean.updateCartItem(count, productsn, mobile, password);
			if(updateCartItem != 0) {
				session.setAttribute("msg", "Product added to the cart successfully!");
				response.sendRedirect("cart.jsp");
			}
			else {
				session.setAttribute("msg", "Something went wrong!");
				response.sendRedirect("product-details.jsp");
			}
		}
	}
	
	@RequestMapping("deletecartitem")
	public void deleteCartItem(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		int productsn = Integer.parseInt(request.getParameter("productsn"));
		String mobile = request.getParameter("mobile");
		String password = request.getParameter("password");
		
		
		ApplicationContext ac = GetApplicationContext.getApplicationContext();
		CartDao bean = ac.getBean(CartDao.class);
		int deleteFromCartById = bean.deleteFromCartById(mobile, password, productsn);
		
		if(deleteFromCartById != 0) {
			session.setAttribute("msg", "Product deleted from the cart successfully!");
			response.sendRedirect("cart.jsp");
		}
		else {
			session.setAttribute("msg", "Something went wrong!");
			response.sendRedirect("cart.jsp");
		}
	}
	
	
	@RequestMapping("cancelorder")
	public void cancelOrder(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		int sn = Integer.parseInt(request.getParameter("sn"));
		String orderid = request.getParameter("orderid");
		
		ApplicationContext ac = GetApplicationContext.getApplicationContext();
		PlaceOrderDetailsDao pod = ac.getBean(PlaceOrderDetailsDao.class);
		
		int row = pod.deleteOrder(sn);
		
		if(row == 1) {
			int checkIfOrderIdExist = pod.checkIfOrderIdExist(orderid);
			if(checkIfOrderIdExist == 0) {
				PlaceOrderUserDetailsDao poud = ac.getBean(PlaceOrderUserDetailsDao.class);
				int deleteUserDetails = poud.deleteUserDetails(orderid);
				if(deleteUserDetails == 1) {
					session.setAttribute("msg", "Order Cancelled!");
					response.sendRedirect("userorderhistory.jsp?status=No");
				}
				else {
					session.setAttribute("msg", "Something went wrong!");
					response.sendRedirect("userorderhistory.jsp?status=No");
				}
			}
			else {
				session.setAttribute("msg", "Order Cancelled!");
				response.sendRedirect("userorderhistory.jsp?status=No");				
			}
		}
		else {
			session.setAttribute("msg", "Something went wrong!");
			response.sendRedirect("userorderhistory.jsp?status=No");
		}
	}
}
