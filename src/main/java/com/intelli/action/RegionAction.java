package com.intelli.action;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.intelli.service.HibernateService;
import com.intelliswift.beans.RetailerConfigs;
import com.opensymphony.xwork2.ActionSupport;

public class RegionAction extends ActionSupport
{
    private List<String> allRegionList;
    private List<String> allSiteList;
    
    private String region;
    private String site;
    
    public List<String> getAllSiteList()
    {
        return allSiteList;
    }

    public void setAllSiteList(List<String> allSiteList)
    {
        this.allSiteList = allSiteList;
    }

    public String getSite()
    {
        return site;
    }

    public void setSite(String site)
    {
        this.site = site;
    }

    public RegionAction() {
        allSiteList = new ArrayList<String>();
        
    }
    
    public List<String> getAllRegionList()
    {
        return allRegionList;
    }

    public void setAllRegionList(List<String> allRegionList)
    {
        this.allRegionList = allRegionList;
    }

    public String getRegion()
    {
        return region;
    }

    public void setRegion(String region)
    {
        this.region = region;
    }

    public String getRegionList() {
        allRegionList = new ArrayList<String>();
        List<RetailerConfigs> myList = HibernateService.getList();
        Iterator<RetailerConfigs> iterator = myList.iterator();
        while(iterator.hasNext()){
            RetailerConfigs rc = iterator.next();
            allRegionList.add(rc.getLocale());
        }
        System.out.println(region);
        return SUCCESS;
    }
    
    public String getSiteList() {
        
        return SUCCESS;
    }
}