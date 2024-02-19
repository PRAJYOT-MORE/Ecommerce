package com.project.onlinegrocery;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import com.project.onlinegrocery.dao.AdminLoginDao;

@Component
public class TableCreationRunner implements CommandLineRunner{

	@Autowired
	private AdminLoginDao adminLoginDao;
	
	@Override
	public void run(String... args) throws Exception {
		
		createAdminLoginTable();
		
	}

	private void createAdminLoginTable() {
		long count = adminLoginDao.count();
		if(count == 0) {
			this.adminLoginDao.createAdminLoginTableWithDefaultValue("admin", "admin");
		}
	}

}
