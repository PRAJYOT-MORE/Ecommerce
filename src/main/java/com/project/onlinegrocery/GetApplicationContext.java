package com.project.onlinegrocery;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

@Component
public class GetApplicationContext implements ApplicationContextAware{

	private static ApplicationContext ac;
	
	@Override
	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.ac = applicationContext;	
	}

	public static ApplicationContext getApplicationContext() {
		return ac;
	}
}
