<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	#innerbox{
		width:720px;
		height:20px;
	}
	span{
		display:block;
		width:150px;
		float:left;
		border:1px solid #666;
		white-space : nowrap;
		overflow: hidden;
  		text-overflow: ellipsis;
		border-width: 1px 1px 1px 1px;
	}
	span:nth-child(2){
		text-overflow: ellipsis;
		border-width: 1px 0px 1px 0px;
	}
	span:nth-child(3){

		border-width: 1px 0px 1px 1px;
	}
	#innerbox span{
		border-width: 1px 0px 1px 0px;
		text-align:center;
		
	}
	
	.getoff{
		clear:both;
	}
</style>
<script>
	function show_title(obj){		
		alert("이 게임의 제목은 " + obj.innerHTML + "입니다");
	}
</script>
</head>
<body>
	<%
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		
		String strSql = "SELECT T1.GNAME, T2.GENAME, T1.GPRICE FROM G_GAMES T1, G_GENRE T2 WHERE T1.GEID = T2.GEID";

    	
    	String userID = "dopractice";
    	String userPass = "1";
    	String url = "jdbc:oracle:thin:@localhost:1525:xe";
    	
    	Class.forName("oracle.jdbc.driver.OracleDriver");
    	
    	con = DriverManager.getConnection(url, userID, userPass);
    	stmt = con.createStatement();
    	
    	rs = stmt.executeQuery(strSql);
    	
	%>

	<div id="box">
		<div id="innerbox" class="getoff">
			<span>게임번호</span>
			<span style="width:250px">게임이름</span>
			<span>게임장르</span>
			<span>게임가격</span>
		</div>
		<%
			int	num = 1;
			while(rs.next()) {
		%>
		
		<div class="getoff">
			<span><%=num %></span>
			<span id="title" style="width:250px" onclick="show_title(this)"><%=rs.getString("GNAME")%></span>
			<span><%=rs.getString("GENAME")%></span>
			<span><%=rs.getString("GPRICE")%></span>
		</div>
		
		<%
			num += 1;
			}
		%>
	</div>
</body>
</html>