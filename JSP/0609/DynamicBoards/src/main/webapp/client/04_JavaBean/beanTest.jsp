<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="TC" class="PKG_Test.TestClass" scope="page" /><!-- Jsp가 기본적으로 제공하는것  TestClass TC = new TestClass(); 와같음-->
<!-- scope > page, response, request, application -->
<jsp:useBean id="DBCon" class="PKG_DB.DBHandle" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<!-- JavaBean이란 
		내가 만든 Class를 이야기한다 Jsp에 사용하기 위해서
		컴파일이 안된 상태이기 때문에 import로는 사용할 수 없다
		생성자를 이용할 수 없기 때문에 무조건 get set 메서드를 사용해야함
		
	 -->
	 <%
	 /*
	 	TC.setName("안녕");
	 	String strName = TC.getName();
	 	
	 	int sum = TC.getSum(100);
	 	char chr = 'B';
	 	out.print("<font color=\'red\' size=\'7\'>" + sum + "</font>");//브라우저에 던져주는것
	
		String userID = "C##JavaDB";
		String userPass = "1";
		String url = "jdbc:oracle:thin:@localhost:1525:xe";
	 	
		String[] dbInfos = new String[3];
		dbInfos[0] = "C##JavaDB";
		dbInfos[1] = "1";
		dbInfos[2] = "jdbc:oracle:thin:@localhost:1525:xe";
	
		DBCon.setDBInfo(dbInfos);
		
	 	Connection con = DBCon.getConnection();
	 	Statement stmt = con.createStatement();
	 	
	 	String strSql = "SELECT * FROM BOARDS";
	 	
	 	ResultSet rs = stmt.executeQuery(strSql);
	 	
	 	while(rs.next()){
	 		out.print(rs.getString("TITLE") + "<br/>");
	 	}
	 */
	 
	 String[] dbInfos = new String[3];
		dbInfos[0] = "C##JavaDB";
		dbInfos[1] = "1";
		dbInfos[2] = "jdbc:oracle:thin:@localhost:1525:xe";
	
		DBCon.setDBInfo(dbInfos);
		
		String strSql = "DELETE FROM BOARDS WHERE IDX = 205";
		DBCon.executeQuery(strSql);
		
		String strSql2 = "SELECT * FROM BOARDS";
		ResultSet rs = DBCon.getResultSet(strSql2);
		
		while(rs.next()){
			
			out.print(rs.getString("TITLE"));
			
		}
	 	
		String strProc = "{call PKG_BOARD.PROC_BOARD_INS(?,?,?,?)}";
		String[] strParams = new String[4];
		strParams[0] = "this is a title";
		strParams[1] = "this is a content";
		strParams[2] = "Mem001";
		strParams[3] = "M001";
		
		DBCon.executeQuery(strProc, strParams);
		
		String StrProc2 = "{call PKG_BOARD.PROC_BOARD_SEL(?,?,?)}";
		String[] strParams2 = new String[2];
		strParams[0] = "List";
		strParams[1] = "";
		
		ResultSet rs2 = DBCon.getResultSet(StrProc2, strParams2);
		
		while(rs2.next()){
			
			out.print(rs2.getString("TITLE"));
			
		}
		
	 %>
	 
	 <%="<font color='red' size='7'>" + "안녕" + "</font>" %>
</body>
</html>