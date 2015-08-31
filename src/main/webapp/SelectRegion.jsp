<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Select The Region</title>
</head>
<body>
<s:select id="Locale" list="allRegionList" name="region" headerKey="-1" headerValue="---Select Region---"></s:select>
<s:select id="Site" list="allSiteList" name="site" headerKey="-1" headerValue="---Select Site--"></s:select>
</body>
</html>