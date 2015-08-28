package com.test;

import com.opensymphony.xwork2.ActionSupport;

public class FirstAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5429038081067574854L;

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		System.out.println("Super");
		return SUCCESS;
	}
	
	
	
}
