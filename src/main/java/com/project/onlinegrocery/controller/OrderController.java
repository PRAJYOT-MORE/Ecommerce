package com.project.onlinegrocery.controller;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.onlinegrocery.GetApplicationContext;
import com.project.onlinegrocery.dao.CartDao;
import com.project.onlinegrocery.dao.PlaceOrderDetailsDao;
import com.project.onlinegrocery.dao.PlaceOrderUserDetailsDao;
import com.project.onlinegrocery.dao.ProductDao;
import com.project.onlinegrocery.pojo.CartPojo;
import com.project.onlinegrocery.pojo.PlaceOrderDetailsPojo;
import com.project.onlinegrocery.pojo.PlaceOrderUserDetailsPojo;
import com.project.onlinegrocery.pojo.ProductPojo;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class OrderController {

	@RequestMapping("checkout")
	public void checkOut(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		String fullname = request.getParameter("fullname");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String pincode = request.getParameter("pincode");
		String phone = request.getParameter("phone");
		String ordernotes = request.getParameter("ordernotes");
		String deliverycharges = request.getParameter("deliverycharges");
		String mobile = request.getParameter("mobile");
		String password = request.getParameter("password");
		
		ApplicationContext ac = GetApplicationContext.getApplicationContext();
		PlaceOrderUserDetailsDao bean = ac.getBean(PlaceOrderUserDetailsDao.class);

		String datetime = LocalDateTime.now().toString();
		String orderid = datetime + mobile + password;
		
		PlaceOrderUserDetailsPojo save = bean.save(new PlaceOrderUserDetailsPojo(fullname, address, city, state, pincode, phone, ordernotes, deliverycharges, mobile, password, datetime, orderid, "No"));
		
		if(save != null) {
			CartDao cartDao = ac.getBean(CartDao.class);
			List<CartPojo> list = cartDao.readCart(mobile, password);
			
			for(CartPojo cp : list) {
				int productsn = cp.getProductsn();
				int count = cp.getCount();
				
				ProductDao productDao = ac.getBean(ProductDao.class);
				Optional<ProductPojo> productdetails = productDao.findById(productsn);
				ProductPojo pp = productdetails.get();
				
				PlaceOrderDetailsDao placeOrderDetailsDao = ac.getBean(PlaceOrderDetailsDao.class);
				PlaceOrderDetailsPojo pop = placeOrderDetailsDao.save(new PlaceOrderDetailsPojo(productsn, count, pp.getTitle(), pp.getDescription(), pp.getCrossprice(), pp.getMainprice(), pp.getAvailability(), pp.getDepartment(), pp.getCategory(), pp.getProductimage(), mobile, password, orderid, datetime));
				
				if(pop != null) {
					cartDao.deleteFromCart(mobile, password);
				}
			
			}
			session.setAttribute("msg", "Order Placed Successfully!");
			response.sendRedirect("cart.jsp");
		}
		else {
			session.setAttribute("msg", "Something went wrong!");
			response.sendRedirect("cart.jsp");
		}
	}
	
}
