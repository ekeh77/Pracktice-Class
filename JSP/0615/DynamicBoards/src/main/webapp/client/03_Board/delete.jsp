<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<%
	String strIDX = request.getParameter("idx");

	Connection con = null;
	CallableStatement csmt = null;
	
	String userID = "C##JavaDB";
	String userPass = "1";
	String url = "jdbc:oracle:thin:@localhost:1525:xe";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	con = DriverManager.getConnection(url, userID, userPass);
	
	csmt = con.prepareCall("{call PKG_BOARD.PROC_BOARD_DEL(?)}");
	
	csmt.setString(1, strIDX);
	
	csmt.execute();

	response.sendRedirect("./list.jsp");
	
%>

<%=strIDX%>