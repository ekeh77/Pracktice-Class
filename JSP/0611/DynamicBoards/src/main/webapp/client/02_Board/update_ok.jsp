<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>   
 
    
    <%
    
    	String strTitle = request.getParameter("title");
    	String strContents = request.getParameter("contents");
    	String strIdx = request.getParameter("idx");
    %>
    
    <% 
    
    	//�����ͺ��̽� ����
    	Connection con = null;
    	Statement stmt = null;	
    
    
    	String strSql = "UPDATE BOARD SET TITLE = '" + strTitle;
    	strSql += "', CONTENTS = '" + strContents;
    	strSql += "' WHERE IDX = " + strIdx; 
    	
    	String userID = "C##JavaDB";
    	String userPass = "1";
    	String url = "jdbc:oracle:thin:@localhost:1525:xe";
    	
    	Class.forName("oracle.jdbc.driver.OracleDriver");
    	
    	con = DriverManager.getConnection(url, userID, userPass);
    	stmt = con.createStatement();
    	
    	stmt.execute(strSql);
    	
    	con.close();
    	
    	//page�� list.jsp�� �̵�
    	response.sendRedirect("./list.jsp");
    	
    %>