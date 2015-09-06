package com.intelli.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.intelli.service.HibernateService;
import com.intelliswift.beans.RetailerConfigs;
import com.intelliswift.beans.SiteLog;
import com.opensymphony.xwork2.ActionSupport;

public class RegionAction extends ActionSupport
{
    private List<String> allRegionList;
    private List<String> allSiteList;
    private List<String> importList;

    private String region;
    private String site;
    private String siteInfo;
    
    

    public String getSiteInfo()
    {
        return siteInfo;
    }

    public void setSiteInfo(String siteInfo)
    {
        this.siteInfo = siteInfo;
    }

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
        System.out.println(site);
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
        System.out.println("Enter 1");
        allRegionList = new ArrayList<String>();

        List<RetailerConfigs> myList = HibernateService.getList("RetailerConfigs.all");
        Iterator<RetailerConfigs> iterator = myList.iterator();
        while(iterator.hasNext()){
            RetailerConfigs rc = iterator.next();
            if(!allRegionList.contains(rc.getLocale())){
                allRegionList.add(rc.getLocale());
            }
        }
        return SUCCESS;
    }

    public String getSiteList() {
        System.out.println("Enter 2");
        allSiteList = new ArrayList<String>();
        List<RetailerConfigs> myList = HibernateService.getList("RetailerConfigs.locale",region);
        Iterator<RetailerConfigs> iterator = myList.iterator();
        while(iterator.hasNext()){
            RetailerConfigs rc = iterator.next();
            allSiteList.add(rc.getSiteName());
        }
        System.out.println(allSiteList);
        return SUCCESS;
    }
    
    public List<String> getImportList()
    {
        return importList;
    }

    public void setImportList(List<String> importList)
    {
        this.importList = importList;
    }

    public String getSiteDetailedInfo() {
        String entryId =  null;
        List<RetailerConfigs> myList = HibernateService.getList("RetailerConfigs.siteName",site);
        Iterator<RetailerConfigs> iterator = myList.iterator();
        while(iterator.hasNext()){
            RetailerConfigs rc = iterator.next();
            entryId = rc.getSite_id();
            siteInfo = rc.getRetailer()+";"+rc.getSiteName()+";"+rc.getDomain()+";"+rc.getLocale();
        }
        
        DateFormat format = new SimpleDateFormat("dd-MMM-YYYY");
        Calendar cal = Calendar.getInstance();
        
        importList = new ArrayList<String>();
        List<SiteLog> myList2 = HibernateService.getList("SiteLog.bylogId",entryId);
        Iterator<SiteLog> iterator2 = myList2.iterator();
        while(iterator2.hasNext()){
            SiteLog sl = iterator2.next();
            Long l = Long.parseLong(sl.getLogId());
            cal.setTimeInMillis(l);
            String importLogs = format.format(cal.getTime()).concat(";").concat(Integer.toString(sl.getNumProds()))
            		.concat(";").concat(Integer.toString(sl.getNumSale()))
            		.concat(";").concat(Integer.toString(sl.getNumColors()))
            		.concat(";").concat(Integer.toString(sl.getNumSizes()))
            		.concat(";").concat(sl.getLogId());
            importList.add(importLogs);
        }       
        return SUCCESS;
    }
}
