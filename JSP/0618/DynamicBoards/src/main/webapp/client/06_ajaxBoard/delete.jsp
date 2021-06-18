<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="DBConn" class="PKG_DB.DBHandle" scope="page"/>
<%

	String strIDX = request.getParameter("idx");
	String strSelectedMenuID = request.getParameter("MenuID");

	//글삭제 데이터베이스
	String[] dbInfos = new String[3];
	dbInfos[0] = "C##JavaDB";
	dbInfos[1] = "1";
	dbInfos[2] = "jdbc:oracle:thin:@localhost:1525:xe";
	
	DBConn.setDBInfo(dbInfos);
	
	String strProcName = "{call PKG_BOARD.PROC_BOARD_DEL(?)}";
	
	String[] strParams = new String[1];
	strParams[0] = strIDX;
		
	DBConn.executeQuery(strProcName, strParams);
	
	response.sendRedirect("./list.jsp?menuID=" + strSelectedMenuID);
	
%>