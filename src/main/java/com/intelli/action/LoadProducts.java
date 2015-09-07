package com.intelli.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.intelli.service.HibernateService;
import com.intelliswift.Utility.HibernateUtility;
import com.intelliswift.beans.Products;
import com.opensymphony.xwork2.ActionSupport;

public class LoadProducts extends ActionSupport {

    private List resultList;  
    private List<Integer> pageList;
    
    private int currentPage;
    private String entryPoint;
    private int count;
    
    public List getResultList()
    {
        return resultList;
    }

    public void setResultList(List resultList)
    {
        this.resultList = resultList;
    }

    public int getCurrentPage()
    {
        return currentPage;
    }

    public void setCurrentPage(int currentPage)
    {
        this.currentPage = currentPage;
    }

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

    public String getPaginationList() {
        resultList = HibernateService.getLikeList("Products.byAll", entryPoint, currentPage, 10);
        return SUCCESS;
    }

    public String execute() {
        System.out.println("ENtry"+entryPoint);
        pageList = new ArrayList<Integer>();
        for(int i=1;i<= Math.ceil(count/10);i++){
            pageList.add(i);
        }
        return SUCCESS;		
    }



}
