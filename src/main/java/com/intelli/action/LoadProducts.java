package com.intelli.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.intelli.service.HibernateService;
import com.intelliswift.beans.Products;
import com.opensymphony.xwork2.ActionSupport;

public class LoadProducts extends ActionSupport {

	private List<Integer> pageList;
	private String entryPoint;
	private int count;
	
	
	public List<Integer> getPageList() {
		return pageList;
	}



	public void setPageList(List<Integer> pageList) {
		this.pageList = pageList;
	}

	public String getEntryPoint() {
		return entryPoint;
	}



	public void setEntryPoint(String entryPoint) {
		this.entryPoint = entryPoint;
	}



	public int getCount() {
		return count;
	}



	public void setCount(int count) {
		this.count = count;
	}



	public String execute() {
		System.out.println(entryPoint);
		pageList = new ArrayList<Integer>();
		for(int i=1;i<= Math.ceil(count/30);i++){
			pageList.add(i);
		}
		return SUCCESS;		
	}


	
}
