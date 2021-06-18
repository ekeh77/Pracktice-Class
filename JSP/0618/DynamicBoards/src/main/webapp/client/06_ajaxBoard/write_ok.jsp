<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="DBConn" class="PKG_DB.DBHandle" scope="page"/>
<%
	request.setCharacterEncoding("UTF-8");
	String strTitle = request.getParameter("title");
	String strContent = request.getParameter("content");
	String strSelectedMenuID = request.getParameter("selectedMenuID");
	String strMenID = request.getParameter("userID");;
	
	String[] dbInfos = new String[3];
	dbInfos[0] = "C##JavaDB";
	dbInfos[1] = "1";
	dbInfos[2] = "jdbc:oracle:thin:@localhost:1525:xe";
	
	DBConn.setDBInfo(dbInfos);
	
	String strProcName = "{call PKG_BOARD.PROC_BOARD_INS(?,?,?,?)}";
	
	String[] strParams = new String[4];
	strParams[0] = strTitle;
	strParams[1] = strContent;
	strParams[2] = strMenID;
	strParams[3] = strSelectedMenuID;
	
	DBConn.executeQuery(strProcName, strParams);
	
	response.sendRedirect("./list.jsp?menuID=" + strSelectedMenuID);
%>