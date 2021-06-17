<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="DBConn" class="PKG_DB.DBHandle" scope="page"/>

<% 
	//로그인 처리
	//1.userID, userPass
	
	String strUserID = request.getParameter("userID");
	String strUserPass = request.getParameter("userPass");
	
	//2.아이디와 패스워드가 일치하는지 검사
	
	String[] dbInfos = new String[3];
	dbInfos[0] = "C##JavaDB";
	dbInfos[1] = "1";
	dbInfos[2] = "jdbc:oracle:thin:@localhost:1525:xe";
	
	DBConn.setDBInfo(dbInfos);
	
	String strProcName = "{call PKG_MEMBER.PROC_LOGIN(?,?,?)}";
	
	String[] strParams = new String[2];
	strParams[0] = strUserID;
	strParams[1] = strUserPass;
	
	ResultSet rs = DBConn.getResultSet(strProcName, strParams);
	
	rs.next();
	
	String Login_YN = rs.getString("LOGIN_YN");
	
	
	//3.Login_YN = 'Y' --> 로그인 시켜줄거야 'N'이면 --> 아이디 또는 패스워드가 틀렸다는 메세지를 만들거에요
	
	if(Login_YN.equals("Y")){
		//로그인을 해줄거고 --session
		session.setAttribute("user", strUserID); // session변수
		session.setAttribute("userName", "이지완"); // session변수
		//response.sendRedirect("../index.jsp?result=Y");
		response.sendRedirect("../06_ajaxBoard/list.jsp");
	}
	else{
		//실패를 알려줄거에요 -- index.jsp 돌려줄거에요
		response.sendRedirect("../index.jsp?result=N");
		
	}
	
%>