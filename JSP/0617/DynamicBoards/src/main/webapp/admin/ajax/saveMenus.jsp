<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="DBConn" class="PKG_DB.DBHandle" scope="page"/>

<%
	String[] menuIDs = request.getParameterValues("menuID");
	String[] menuNames = request.getParameterValues("menuName");
	
	String[] RmenuIDs;
	
	String[] dbInfos = new String[3];
	dbInfos[0] = "C##JavaDB";
	dbInfos[1] = "1";
	dbInfos[2] = "jdbc:oracle:thin:@localhost:1525:xe";
	
	
	
	DBConn.setDBInfo(dbInfos);
	
	String result = "Y";

	try{
	
	for(int j=0; j< menuIDs.length; j++){
		
		String strsql2 = "SELECT MENUID FROM MENUS";
		
		ResultSet rs = DBConn.getResultSet(strsql2);
		
		String strSql = "";
		int sameNum = 0;
		
		while(rs.next()){
			
			if(menuIDs[j].equals(rs.getString("MENUID"))){
				
				sameNum += 1;
				
			}
			else if(menuIDs[j] == ""){
				
				sameNum += 1;
				
			}

		}
		
		if(sameNum == 0){
			
			strSql = "";
			strSql += "INSERT INTO MENUS(MENUID, MENUNAME) ";	
			strSql += "VALUES(";
			strSql += "'" + menuIDs[j] + "',";
			strSql += "'" + menuNames[j] + "'";
			strSql += ")";
			
			DBConn.executeQuery(strSql);
			
		}
	}
	
	}
	catch(Exception e){
		
		result = e.getMessage();
		
	}
	
	/*
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
	*/
	out.print(result);
	
%>