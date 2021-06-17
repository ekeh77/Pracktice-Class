<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="DBConn" class="PKG_DB.DBHandle" scope="page"/>

<%

	String strMenuID = request.getParameter("menuID");
	String strMenuName = request.getParameter("menuName");
	
	String[] dbInfos = new String[3];
	dbInfos[0] = "C##JavaDB";
	dbInfos[1] = "1";
	dbInfos[2] = "jdbc:oracle:thin:@localhost:1525:xe";
	
	DBConn.setDBInfo(dbInfos);
	
	String strSql = "UPDATE MENUS SET ";
	strSql += "MENUNAME='" + strMenuName + "' ";
	strSql += "WHERE MENUID='" + strMenuID + "'";
	
	DBConn.executeQuery(strSql);
	
%>