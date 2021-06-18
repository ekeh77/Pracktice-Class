<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="DBConn" class="PKG_DB.DBHandle" scope="page"/>
<%
	//값을 받아서 db에 저장한다
	
	String strID = request.getParameter("id");
	String strTitle = request.getParameter("title");
	
	String[] dbInfos = new String[3];
	dbInfos[0] = "C##JavaDB";
	dbInfos[1] = "1";
	dbInfos[2] = "jdbc:oracle:thin:@localhost:1525:xe";
	
	DBConn.setDBInfo(dbInfos);
	
	String strSql = "INSERT INTO GUEST(GID, GTITLE)";
	strSql += "VALUES('" + strID + "',";
	strSql += "'" + strTitle + "')";
	
	DBConn.executeQuery(strSql);
	
	response.sendRedirect("./list.jsp");
%>