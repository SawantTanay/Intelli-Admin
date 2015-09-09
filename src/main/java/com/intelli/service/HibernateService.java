package com.intelli.service;

import java.util.List;

import javax.persistence.NamedQueries;

import org.hibernate.Query;
import org.hibernate.Session;

import com.intelliswift.Utility.HibernateUtility;
import com.intelliswift.beans.RetailerConfigs;

public class HibernateService
{

    public static List getList(String Namedquery) {
        Session session = HibernateUtility.buildSessionFactory();
        session.beginTransaction();
        Query query = session.getNamedQuery(Namedquery);
        return query.list();
    }

    public static List getList(String Namedquery,String param) {
        Session session = HibernateUtility.buildSessionFactory();
        session.beginTransaction();
        Query query = session.getNamedQuery(Namedquery);
        query.setString(0, param);
        return query.list();
    }
   
    public static List getLikeList(String Namedquery,String param,int pgNo,int pgSize) {
        Session session = HibernateUtility.buildSessionFactory();
        session.beginTransaction();
        System.out.println(Namedquery+"==="+param);
        Query query = session.getNamedQuery(Namedquery);
        query.setString(0, "%-"+param);
        query.setFirstResult(pgNo);
        query.setMaxResults(pgSize);
        return query.list();
    }
}
