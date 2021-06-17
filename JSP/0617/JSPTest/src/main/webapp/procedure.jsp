<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="DB" class="PKG_DBHandler.DBHandler" scope="page"/>

<%
	DB.setUrl("jdbc:oracle:thin:@localhost:1525:xe");
	DB.setUserId("games");
	DB.setUserPass("1");
	
	DB.DBCon();
	
	String strSql = "{call PKG_CUSTOMERS_TBL.PROC_INSERT_CUSTOMERS_TBL(?,?,?,?,?)}";
	
	String[] strParams = new String[5];
	strParams[0] = "김철수"; 
	strParams[1] = "19941104";
	strParams[2] = "CMS004";
	strParams[3] = "M";
	strParams[4] = "01024789521";
	
	DB.executeQuery(strSql, strParams);
%>