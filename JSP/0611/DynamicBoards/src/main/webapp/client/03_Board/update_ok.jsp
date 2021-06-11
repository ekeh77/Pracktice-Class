<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>   
<%@ page import="java.sql.*" %>
<%
	String strTitle = request.getParameter("title");
	String strContents = request.getParameter("contents");
	String strIDX = request.getParameter("idx");
	
	Connection con = null;
	CallableStatement csmt = null;
	
	String userID = "C##JavaDB";
	String userPass = "1";
	String url = "jdbc:oracle:thin:@localhost:1525:xe";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	con = DriverManager.getConnection(url, userID, userPass);
	
	csmt = con.prepareCall("{call PKG_BOARD.PROC_BOARD_UPD(?,?,?)}");
	
	csmt.setString(1, strIDX);
	csmt.setString(2, strTitle);
	csmt.setString(3, strContents);
	
	csmt.execute();
	
	con.close();
	
	response.sendRedirect("./contents.jsp?idx=" + strIDX);
	
%>