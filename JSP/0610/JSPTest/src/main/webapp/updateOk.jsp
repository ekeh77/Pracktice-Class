<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="DB" class="PKG_DBHandler.DBHandler" scope="page"/>
<%@ page import="java.sql.*" %>  
<%
	String Num = request.getParameter("number");
	String Name = request.getParameter("text");
	
	System.out.println(Num);
	System.out.println(Name);
	
	Connection con = null;
	CallableStatement csmt = null;
	
	String userID = "dopractice";
	String userPass = "1";
	String url = "jdbc:oracle:thin:@localhost:1525:xe";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	con = DriverManager.getConnection(url, userID, userPass);
	
	csmt = con.prepareCall("{call PKG_GAMES.PROC_UPDATE_GAMES(?,?)}");
	
	csmt.setString(1, Num);
	csmt.setString(2, Name);
	
	csmt.execute();
	
	con.close();
	
	response.sendRedirect("./DB2.jsp");
	
%>