<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="DBConn" class="PKG_DB.DBHandle" scope="page"/>

<%
	String[] menuIDs = request.getParameterValues("menuID");
	String[] menuNames = request.getParameterValues("menuName");
	
	String[] dbInfos = new String[3];
	dbInfos[0] = "C##JavaDB";
	dbInfos[1] = "1";
	dbInfos[2] = "jdbc:oracle:thin:@localhost:1525:xe";
	
	DBConn.setDBInfo(dbInfos);
	
	String result = "Y";
	
	try{
		
		String strSql = "";
		
		for(int i=0; i<menuIDs.length; i++){
			
			strSql = "";
			strSql += "INSERT INTO MENUS(MENUID, MENUNAME) ";	
			strSql += "VALUES(";
			strSql += "'" + menuIDs[i] + "',";
			strSql += "'" + menuNames[i] + "'";
			strSql += ")";
			
			DBConn.executeQuery(strSql);
		}
	
	}
	catch(Exception e){
		
		result = e.getMessage();
		
	}
	
	out.print(result);
	
%>