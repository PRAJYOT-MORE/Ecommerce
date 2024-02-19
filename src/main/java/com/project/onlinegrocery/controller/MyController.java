package com.project.onlinegrocery.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.cglib.core.Local;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.onlinegrocery.GetApplicationContext;
import com.project.onlinegrocery.dao.AdminLoginDao;
import com.project.onlinegrocery.dao.CartDao;
import com.project.onlinegrocery.dao.CategoryDao;
import com.project.onlinegrocery.dao.ContactDao;
import com.project.onlinegrocery.dao.DepartmentDao;
import com.project.onlinegrocery.dao.PlaceOrderDetailsDao;
import com.project.onlinegrocery.dao.PlaceOrderUserDetailsDao;
import com.project.onlinegrocery.dao.ProductDao;
import com.project.onlinegrocery.dao.SignupDao;
import com.project.onlinegrocery.fileio.ProductIO;
import com.project.onlinegrocery.pojo.CartPojo;
import com.project.onlinegrocery.pojo.PlaceOrderDetailsPojo;
import com.project.onlinegrocery.pojo.PlaceOrderUserDetailsPojo;
import com.project.onlinegrocery.pojo.ProductPojo;
import com.project.onlinegrocery.pojo.SignupPojo;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@Controller
public class MyController {
	
	@RequestMapping("savecontact")
	public void saveContact(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String message = request.getParameter("message");

		ApplicationContext ac = GetApplicationContext.getApplicationContext();
		ContactDao bean = ac.getBean(ContactDao.class);
		
		int row = bean.insertContact(name, email, message, LocalDateTime.now().toString());
		if(row == 1) {
			session.setAttribute("msg", "Message sent successfully!");
			response.sendRedirect("contact.jsp");
		}
	}
	
	@RequestMapping("deletecontact")
	public void deleteContact(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		
		int sn = Integer.parseInt(request.getParameter("sn"));
		ApplicationContext ac = GetApplicationContext.getApplicationContext();
		ContactDao bean = ac.getBean(ContactDao.class);
		
		int row = bean.deleteContact(sn);
		if(row == 1) {
			session.setAttribute("msg", "Message deleted successfully!");
			response.sendRedirect("read-contacts.jsp");
		}	
	}
	
	@RequestMapping("savecategory")
	public void saveCategory(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		
		String department = request.getParameter("department");
		String category = request.getParameter("category");

		ApplicationContext ac = GetApplicationContext.getApplicationContext();
		CategoryDao bean = ac.getBean(CategoryDao.class);
		
		int row = bean.insertCategory(department, category);
		if(row == 1) {
			session.setAttribute("msg", "Category added successfully!");
			response.sendRedirect("add-category.jsp");
		}
		
	}
	
	@RequestMapping("removecategory")
	public void removeCategory(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
	
		String category = request.getParameter("category");

		ApplicationContext ac = GetApplicationContext.getApplicationContext();
		CategoryDao categoryBean = ac.getBean(CategoryDao.class);
		ProductDao productBean = ac.getBean(ProductDao.class);
		CartDao cartBean = ac.getBean(CartDao.class);
		
		int row1 = categoryBean.deleteCategory(category);
		int row2 = productBean.deleteProductUsingCategory(category);
		
		cartBean.deleteFromCartUsingProductSn();
		
		if(row1 != 0 && row2 != 0) {
			session.setAttribute("msg", "Category removed successfully!");
			response.sendRedirect("remove-category.jsp");
		}
	}
	
	
	@RequestMapping("savedepartment")
	public void saveDepartment(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		
		String department = request.getParameter("department");

		ApplicationContext ac = GetApplicationContext.getApplicationContext();
		DepartmentDao bean = ac.getBean(DepartmentDao.class);
		
		int row = bean.insertDepartment(department);
		if(row == 1) {
			session.setAttribute("msg", "Department added successfully!");
			response.sendRedirect("add-department.jsp");
		}
	}
	
	@RequestMapping("removedepartment")
	public void removeDepartment(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
	
		String department = request.getParameter("department");

		ApplicationContext ac = GetApplicationContext.getApplicationContext();
		DepartmentDao departmentBean = ac.getBean(DepartmentDao.class);
		CategoryDao categoryBean = ac.getBean(CategoryDao.class);
		ProductDao productBean = ac.getBean(ProductDao.class);
		CartDao cartBean = ac.getBean(CartDao.class);
		
		int row1 = departmentBean.deleteDepartment(department);
		int row2 = categoryBean.deleteCategoryUsingDepartment(department);
		int row3 = productBean.deleteProductUsingDepartment(department);
		
		cartBean.deleteFromCartUsingProductSn();
		
		if(row1 != 0 && row2 != 0 && row3 != 0) {
			session.setAttribute("msg", "Department removed successfully!");
			response.sendRedirect("remove-department.jsp");
		}	
	}
	
	
	@RequestMapping("saveproduct")
	public void saveProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String crossprice = request.getParameter("crossprice");
		String mainprice = request.getParameter("mainprice");
		String availability = request.getParameter("availability");
		String department = request.getParameter("department");
		String category = request.getParameter("category");
		Part part = request.getPart("productimage");
		
		String oldfilename = part.getSubmittedFileName();
		String datetime = LocalDateTime.now().toString();
		String newfilename = datetime + oldfilename;
		String[] split = newfilename.split(":");
		newfilename = split[0] + split[1] + split[2];
		
		ApplicationContext ac = GetApplicationContext.getApplicationContext();
		ProductDao bean = ac.getBean(ProductDao.class);
		
		ProductPojo obj = bean.save(new ProductPojo(title, description, crossprice, mainprice, availability, department, category, newfilename, datetime));
		
		if(obj != null) {
			String res = new ProductIO().writeProduct(request, newfilename, part);
			if(res.equals("saved")) {
				session.setAttribute("msg", "Product added successfully!");
				response.sendRedirect("add-product.jsp");
			}
			else {
				session.setAttribute("msg", "Something went wrong!");
				response.sendRedirect("add-product.jsp");
			}	
		}	 
	}
	
	
	@RequestMapping("deleteproduct")
	public void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		int sn = Integer.parseInt(request.getParameter("sn"));
		String photoname = request.getParameter("photoname");
		
		ApplicationContext ac = GetApplicationContext.getApplicationContext();
		ProductDao productDao = ac.getBean(ProductDao.class);
		
		productDao.deleteById(sn);
		
		
		String realPath = request.getServletContext().getRealPath("admin/products") + File.separator + photoname;
		
		File f = new File(realPath);
		f.delete();
		
		session.setAttribute("msg", "Product deleted successfully!");
		response.sendRedirect("readproducts.jsp");				
	}
	
	@RequestMapping("updateproduct")
	public void updateProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		int sn = Integer.parseInt(request.getParameter("sn"));
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String crossprice = request.getParameter("crossprice");
		String mainprice = request.getParameter("mainprice");
		String availability = request.getParameter("availability");
		String department = request.getParameter("department");
		String category = request.getParameter("category");
		
		ApplicationContext ac = GetApplicationContext.getApplicationContext();
		ProductDao productDao = ac.getBean(ProductDao.class);
		
		int res = productDao.updateProductDetails(title, description, crossprice, mainprice, availability, department, category, sn);
		
		if(res == 1) {
			session.setAttribute("msg", "Product updated successfully!");
			response.sendRedirect("readproducts.jsp");			
		}
		else {
			session.setAttribute("msg", "Something went wrong!");
			response.sendRedirect("readproducts.jsp");
		}				
	}
	
	
	@RequestMapping("adminlogin")
	public void adminLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		
		ApplicationContext ac = GetApplicationContext.getApplicationContext();
		AdminLoginDao bean = ac.getBean(AdminLoginDao.class);
		
		int count = bean.readAdminLoginCredentials(username, password);	
		
		if(count == 1) {
			session.setAttribute("token", username);
			response.sendRedirect("admintasks.jsp");
		}
		else {
			session.setAttribute("msg", "Invalid Credentials!");
			response.sendRedirect("adminlogin.jsp");
		}
	}
	
	
	@RequestMapping("changeadmincredentials")
	public void changeAdminCredentials(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		String newusername = request.getParameter("newusername");
		String confirmusername = request.getParameter("confirmusername");
		String newpassword = request.getParameter("newpassword");
		String confirmpassword = request.getParameter("confirmpassword");
		
		if(newusername.equals(confirmusername) && newpassword.equals(confirmpassword)) {
			ApplicationContext ac = GetApplicationContext.getApplicationContext();
			AdminLoginDao bean = ac.getBean(AdminLoginDao.class);
			
			int res = bean.updateCredentials(confirmusername, confirmpassword);
			
			if(res == 1) {
				session.setAttribute("msg", "Credentials updated successfully!");
				response.sendRedirect("admintasks.jsp");
			}
			else {
				session.setAttribute("msg", "Something went wrong!");
				response.sendRedirect("admintasks.jsp");
			}
		}
		else {
			session.setAttribute("msg", "Username or Password doesn't match!");
			response.sendRedirect("admintasks.jsp");
		}
	}
	
	
	@RequestMapping("delivered")
	public void delivered(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		int sn = Integer.parseInt(request.getParameter("sn"));
		
		ApplicationContext ac = GetApplicationContext.getApplicationContext();
		PlaceOrderUserDetailsDao bean = ac.getBean(PlaceOrderUserDetailsDao.class);
		
		int ensureDelivery = bean.ensureDelivery(sn);
		
		if(ensureDelivery == 1) {
			session.setAttribute("msg", "Order Delivered Successfully!");
			response.sendRedirect("order.jsp");
		}
		else {
			session.setAttribute("msg", "Something went wrong!");
			response.sendRedirect("order.jsp");
		}
	}
	
}