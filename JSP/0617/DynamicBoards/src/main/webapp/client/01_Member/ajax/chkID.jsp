<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="DBConn" class="PKG_DB.DBHandle" scope="page" />

<%
	//1.client에서 날려준 파라메터들을 받아야죠
	String strUserID = request.getParameter("userID");

	String[] dbInfos = new String[3];
	dbInfos[0] = "C##JavaDB";
	dbInfos[1] = "1";
	dbInfos[2] = "jdbc:oracle:thin:@localhost:1525:xe";

	DBConn.setDBInfo(dbInfos);
	
	String strProcName = "{call PKG_MEMBER.PROC_CHK_USERID(?,?)}";
	
	String[] strParams = new String[1];
	strParams[0] = strUserID;
	
	ResultSet rs = DBConn.getResultSet(strProcName, strParams);
	
	rs.next();
	
	String strResult = rs.getString("RST");
	
	//strResult가 'Y'이면 중복 'N'이면 중복되지 않았다
	
	String strXML = "<?xml version='1.0'?>";
	strXML += "<result>" + strResult + "</result>";
	
	response.setContentType("text/xml;");
	
	PrintWriter writer = response.getWriter();
	writer.print(strXML);
	
%>