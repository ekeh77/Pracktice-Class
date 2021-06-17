<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="DB" class="PKG_DBHandler.DBHandler" scope="page"/>

<% 
	DB.setUrl("jdbc:oracle:thin:@localhost:1525:xe");
	DB.setUserId("sales");
	DB.setUserPass("1");
	
	DB.DBCon();
	
	String strSql = "SELECT T2.PRO_NAME AS NAME, T2.PRO_COMPANY AS COMPANY, T2.PRO_VOL AS VOL, T2.PRO_POINT AS POINT, ROUND(AVG(S_PRICE))AS AVG FROM SALES_TBL T1, PRODUCTS_TBL T2 WHERE T1.PRO_ID = T2.PRO_ID GROUP BY T2.PRO_NAME, T2.PRO_COMPANY, T2.PRO_VOL, T2.PRO_POINT";
	
	ResultSet rs = DB.getResultSet(strSql);
	
	String strXML = "<?xml version='1.0'?>";
	//반드시 하나의 rootElement를 가져야한다.
	
	strXML += "<menus>";
	
	while(rs.next()){
		
		strXML += "<menu>";
		strXML += "<proName>";
		strXML += rs.getString("NAME");
		strXML += "</proName>";
		strXML += "<proCom>";
		strXML += rs.getString("COMPANY");
		strXML += "</proCom>";
		strXML += "<proAvg>";
		strXML += rs.getString("AVG");
		strXML += "</proAvg>";
		strXML += "<proVol>";
		strXML += rs.getString("VOL");
		strXML += "</proVol>";
		strXML += "<proPoint>";
		strXML += rs.getString("POINT");
		strXML += "</proPoint>";
		strXML += "</menu>";
		
	}
	
	strXML += "</menus>";
	
	response.setContentType("text/xml;");
	
	PrintWriter writer = response.getWriter();
	writer.print(strXML);
	
%>