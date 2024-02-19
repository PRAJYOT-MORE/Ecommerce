package com.project.onlinegrocery.fileio;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import jakarta.servlet.ServletInputStream;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

public class ProductIO {

	private String result;
	private FileOutputStream fos;
	private InputStream is;
	@SuppressWarnings("finally")
	public String writeProduct(HttpServletRequest request, String newfilename, Part part) {
		
		String realPath = request.getServletContext().getRealPath("admin/products") + File.separator + newfilename;
		
		try {
			is = part.getInputStream();
			byte[] b = is.readAllBytes();
			
			fos = new FileOutputStream(realPath);
			fos.write(b);
			
			result = "saved";	
		} catch (Exception e) {
			e.printStackTrace();
			result = "failed";
		} finally {
			try {
				is.close();
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return result;
		}
	}
	
	
	
	
	
}
