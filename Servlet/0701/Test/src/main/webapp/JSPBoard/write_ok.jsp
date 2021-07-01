<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String strTitle = request.getParameter("title");

	//DB연결
	//data저장
	
	String[] strs = new String[5];
		
		strs[0] = "aaaa";
		strs[1] = "bbbb";
		strs[2] = "cccc";
		strs[3] = "dddd";
		strs[4] = "eeee";
	
	response.sendRedirect("./list.jsp?title=" + strTitle);
%>