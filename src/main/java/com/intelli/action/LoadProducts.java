package com.intelli.action;

import java.util.ArrayList;
import java.util.List;

import com.intelli.service.HibernateService;
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

    public List<Integer> getPageList()
    {
        return pageList;
    }

    public void setPageList(List<Integer> pageList)
    {
        this.pageList = pageList;
    }

    public int getCurrentPage()
    {
        return currentPage;
    }

    public void setCurrentPage(int currentPage)
    {
        this.currentPage = currentPage;
    }

    public String getEntryPoint()
    {
        return entryPoint;
    }

    public void setEntryPoint(String entryPoint)
    {
        this.entryPoint = entryPoint;
    }

    public int getCount()
    {
        return count;
    }

    public void setCount(int count)
    {
        this.count = count;
    }

    public String paginationList() {
//        resultList = new ArrayList();
//        int limit = currentPage*15;
//        currentPage = (currentPage-1)*15;
//        System.out.println(currentPage+"==>"+limit);
//        for (int i=currentPage; i < limit;i=i+5) {
//            ArrayList myList = (ArrayList) HibernateService.getLikeList("Products.byAll", entryPoint, i, 5);
//            resultList.addAll(myList);
//        }
//        System.out.println(resultList);
        resultList = HibernateService.getLikeList("Products.byAll", entryPoint, currentPage, 9);
        return SUCCESS;
    }

    public String fullPageList() {
        System.out.println("ENtry"+entryPoint);
        pageList = new ArrayList<Integer>();
        for(int i=1;i<= Math.ceil(count/30);i++){
            pageList.add(i);
        }
        return SUCCESS;
    }




}
