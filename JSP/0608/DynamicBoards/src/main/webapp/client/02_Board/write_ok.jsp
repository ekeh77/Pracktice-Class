<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>   
 
    
    <%
    
    	String strTitle = request.getParameter("title");
    	String strContents = request.getParameter("contents");
    	String StrMemId = "Mem001";
    	String StrMenuId = "M001";
    	
    %>
    
    <% 
    
    	//데이터베이스 연결
    	Connection con = null;
    	Statement stmt = null;	
    
    
    	String strSql = "INSERT INTO BOARD";
    	strSql += "(IDX, TITLE, CONTENTS, MEMID, MENUID, REGDATE) ";
    	strSql += "VALUES( ";
    	strSql += "BOARDSEQ.NEXTVAL, "; 
    	strSql += "'" + strTitle + "', ";
    	strSql += "'" + strContents + "', ";
    	strSql += "'" + StrMemId + "', ";
    	strSql += "'" + StrMenuId + "', ";
    	strSql += "SYSDATE)";
    	
    	String userID = "C##JavaDB";
    	String userPass = "1";
    	String url = "jdbc:oracle:thin:@localhost:1525:xe";
    	
    	Class.forName("oracle.jdbc.driver.OracleDriver");
    	
    	con = DriverManager.getConnection(url, userID, userPass);
    	stmt = con.createStatement();
    	
    	stmt.execute(strSql);
    	
    	con.close();
    	
    	//page를 list.jsp로 이동
    	response.sendRedirect("./list.jsp");
    	
    %>