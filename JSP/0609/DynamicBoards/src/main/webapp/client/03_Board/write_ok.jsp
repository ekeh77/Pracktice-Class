<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>   
<%@ page import="java.sql.*" %>
<%
	String strTitle = request.getParameter("title"); 
	String strContents = request.getParameter("contents");
	String strMemID = "Mem001";
	String strMenuId = "M001";
	
	Connection con = null;
	CallableStatement csmt = null;
	
	String userID = "C##JavaDB";
	String userPass = "1";
	String url = "jdbc:oracle:thin:@localhost:1525:xe";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	con = DriverManager.getConnection(url, userID, userPass);
	
	csmt = con.prepareCall("{call PKG_BOARD.PROC_BOARD_INS(?,?,?,?)}");
	
	csmt.setString(1, strTitle);
	csmt.setString(2, strContents);
	csmt.setString(3, strMemID);
	csmt.setString(4, strMenuId);
	
	csmt.execute();
	
	con.close();
	
	response.sendRedirect("./list.jsp");
	
%>