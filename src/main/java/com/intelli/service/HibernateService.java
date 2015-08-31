package com.intelli.service;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.intelliswift.Utility.HibernateUtility;

public class HibernateService
{

    public static List getList() {
        Session session = HibernateUtility.buildSessionFactory();
        session.beginTransaction();
        Query query = session.getNamedQuery("RetailerConfigs");
        return query.list();
    }
}
