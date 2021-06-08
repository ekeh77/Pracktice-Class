<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="oracle.jdbc.OracleTypes" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>글내용 보기</title>
<style>
	#title{
		width:700px;
		height:50px;
		border:1px solid #aaa;
		border-width:0px 0px 1px 0px;
		clear: both;
	}
	.memid{
		display:block;
		width:250px;
		height:50px;
		font-size:12px;
		float:left;
	}
	.memid span{
		display:block;
		padding:4px 0px 4px 40px;
	}
	.title2{
		width:390px;
		display:block;
		float:left;
		padding:14px;
	}
	#content{
		clear: both;
		width:700px;
		height:300px;
		padding:15px;
		border:1px solid #aaa;
		border-width:0px 0px 1px 0px;
	}
	.btn{
		display:block;
		width:70px;
		height:12px;
		border:1px solid #777777;
		padding:2px 0px 5px 0px;
		text-align:center;
		border-radius:7px;
		background-color:#ededed;
		font-size:12px;
		float:left;
	}
	#bottom{
		padding:5px 0px 0px 0px;
	}
	a{
		text-decoration:none;
	}
	a:link { 
		color: black; 
	}
	a:visited {
		 color: black; 
	}
	.btn:hover{
		color:#eee;
		background-color:black;
	}
</style>
<script>
	function formSubmit(strURL){
		document.getElementById("form").action = strURL;
		document.getElementById("form").method = "post";
		document.getElementById("form").submit();
	}
</script>
</head>
<body>
	<%
		String strIDX = request.getParameter("idx");
		
		Connection con = null;
		CallableStatement csmt = null;
		ResultSet rs = null;
		Statement stmt = null;
		
		
		String userID = "C##JavaDB";
		String userPass = "1";
		String url = "jdbc:oracle:thin:@localhost:1525:xe";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		con = DriverManager.getConnection(url, userID, userPass);
		
		String strSql = "UPDATE BOARDS SET VISITED = VISITED + 1 WHERE IDX = " + strIDX;
		stmt = con.createStatement();
		
		stmt.executeQuery(strSql);
		
		csmt = con.prepareCall("{call PKG_BOARD.PROC_BOARD_SEL(?,?,?)}");
		
		csmt.setString(1, "List");
		csmt.setString(2, strIDX);
		csmt.registerOutParameter(3, OracleTypes.CURSOR);
		
		csmt.execute();
		
		rs = (ResultSet)csmt.getObject(3);
		
		rs.next();
		
		
		
	%>
	
	<div id="wrap">
		<div id="title">
			<span class="memid">
				<span><%=rs.getString("MEMID") %></span>
				<span>
					<%=rs.getString("REGDATE_CON") %>
					&nbsp;&nbsp;&nbsp;&nbsp;
					조회 : <%=rs.getString("VISITED") %>
				</span>
			</span>
			<span class="title2">
				글제목 : <%=rs.getString("TITLE") %>	
			</span>
		</div>
		<div id="content">
			<%=rs.getString("CONTENTS") %>
		</div>
		<div id="bottom">
			<a href="./list.jsp"><span class="btn">리스트</span></a>
			<a href="javascript:formSubmit('./delete.jsp')"><span class="btn">삭제</span></a>
			<a href="javascript:formSubmit('./update.jsp')"><span class="btn">수정</span></a>
		</div>
		
	</div>
	<form id="form">
		<input type="hidden" name="idx" value="<%=rs.getString("IDX")%>"/>
	</form>
	<% 
		rs.close();
		con.close();
	%>
</body>
</html>