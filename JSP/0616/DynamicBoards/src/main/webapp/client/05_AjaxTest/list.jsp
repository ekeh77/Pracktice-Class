<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.PrintWriter" %>
<jsp:useBean id="DBConn" class="PKG_DB.DBHandle" scope="page" />
    <%
    
	 	String[] dbInfos = new String[3];
		dbInfos[0] = "C##JavaDB";
		dbInfos[1] = "1";
		dbInfos[2] = "jdbc:oracle:thin:@localhost:1525:xe";
	
		DBConn.setDBInfo(dbInfos);
    	
		
		
		String StrProc = "{call PKG_BOARD.PROC_BOARD_SEL(?,?,?)}";
		
		String[] strParams = new String[2];
		strParams[0] = "List";
		strParams[1] = "";
		
		ResultSet rs = DBConn.getResultSet(StrProc, strParams);
		
		String strXML = "<?xml version='1.0' encoding='UTF-8'?>";
		strXML += "<rows>";
		while(rs.next()){
			
			strXML += "<row>";
			strXML += "<bnum>" + rs.getString("BNUM") + "</bnum>";
			strXML += "<title>" + rs.getString("TITLE") + "</title>";
			strXML += "<regdate>" + rs.getString("REGDATE") + "</regdate>";
			strXML += "</row>";
			
		}
		strXML += "</rows>";
		
		//request.setCharacterEncoding("utf-8");
		response.setContentType("text/xml; charset=utf-8");
		
		PrintWriter writer = response.getWriter();
		writer.print(strXML);
		
		/*String strParam = request.getParameter("userName");
    	out.print("hi " + strParam);*/
    	
    %>