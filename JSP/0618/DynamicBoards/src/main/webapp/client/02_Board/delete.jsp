<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<% 
	String strIdx = request.getParameter("idx");
	//데이터베이스 연결
	Connection con = null;
	Statement stmt = null;	

	String strSql = "DELETE FROM BOARD WHERE IDX=" + strIdx;
	
	String userID = "C##JavaDB";
	String userPass = "1";
	String url = "jdbc:oracle:thin:@localhost:1525:xe";
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	con = DriverManager.getConnection(url, userID, userPass);
	stmt = con.createStatement();
	
	stmt.execute(strSql);
	
	con.close();
	
	response.sendRedirect("./list.jsp");
%>