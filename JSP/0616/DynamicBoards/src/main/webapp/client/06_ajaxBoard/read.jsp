<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="DBConn" class="PKG_DB.DBHandle" scope="page"/>
<% 
	String bNum = request.getParameter("bNum");
	
	String[] dbInfos = new String[3];
	dbInfos[0] = "C##JavaDB";
	dbInfos[1] = "1";
	dbInfos[2] = "jdbc:oracle:thin:@localhost:1525:xe";
	
	DBConn.setDBInfo(dbInfos);
	
	String strSql = "SELECT * FROM BOARDS WHERE BNUM='" + bNum + "'";
	
	ResultSet rs = DBConn.getResultSet(strSql);
	
	rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../Css/board.css"/>
<style>
	#Rtitle{
		clear:both;
	}

	#Rtitle span{
		display:block;
		width:70px;
		height:20px;
		float:left;
		margin: 0px 0px 10px 0px;
	}
	
	#Rtitle span:last-child{
		width:1000px;
	}
	
	#Rcontent{
		
		clear:both;
	}
	
	#Rcontent span:first-child{
		display:block;
		width:100px;
		height:20px;
		margin: 0px 0px 20px 0px;
	}
	#Rcontent span:last-child{
		padding:10px;
		display:block;
		width:1100px;
		height:400px;
		border:1px solid #777777;
	}
	
</style>
<script src="../JS/board2.js" type="text/javascript"></script>
</head>
<body onload="getMenus();">
	<div id="wrap">
		<div id="menus">
			
		</div>
		<div id=bWrite>
			<div id="bHead">
				<div></div>
				<div>
					<!-- <input type="button" value="글쓰기" onclick="goWrite();" /> -->
				</div>
			</div>
			<div id="bBody">
				<div id="Rbox">
					<div id="Rtitle">
						<span>글제목 :</span>
						<span><%=rs.getString("TITLE")%></span>
					</div>
					<div id="Rcontent">
						<span>글내용</span>
						<span><%=rs.getString("CONTENTS")%></span>
					</div>				
				</div>
			</div>
			<div id="bBottom"></div>
		</div>
	</div>
</body>
</html>