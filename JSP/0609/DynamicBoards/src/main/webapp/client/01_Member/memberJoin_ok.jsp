<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String[] strHobby = request.getParameterValues("hobby");
	String strGender = request.getParameter("gender");
	
	if(strHobby != null){
		out.print(strHobby.length);
	for(int i = 0; i<strHobby.length;i++){
		out.print(strHobby[i]);
	}
	}
	else{
		out.print("선택안했다");
	}
	

%>