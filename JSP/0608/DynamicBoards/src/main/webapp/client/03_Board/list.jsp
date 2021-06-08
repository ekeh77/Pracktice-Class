<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="oracle.jdbc.OracleTypes" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 리스트</title>
	<style>
		#borad{
			width:707px;
			height:100px;
			border:1px solid #444444;
			border-width: 1px 0px 0px 0px;
		}
		#borad span{
			display:block;
			width:100px;
			border:1px solid #dddddd;
			border-width: 0px 0px 1px 0px;
			height:20px;
			padding-top:4px;
			float:left;
			font-size:13px;
			text-align:center;
		}
		#btnBlock{
			width:707px;
			height:40px;
			padding-left:600px;
		}
		.btn{
			display:block;
			width:90px;
			height:17px;
			border:1px solid #777777;
			padding:3px 0px 7px 0px;
			text-align:center;
			border-radius:10px;
			background-color:#ededed;	
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
		#borad a:hover{
			color:blue;
		}
		#btnBlock span:hover{
			color:#eee;
			background-color:black;
		}
	</style>
	<script>
		
	</script>
</head>
<body>
	<% 
		//db연결해서 데이터 가져오자
		//Connection객체
		Connection con = null;
		CallableStatement csmt = null;
		ResultSet rs = null;
		
		String userID = "C##JavaDB";
    	String userPass = "1";
    	String url = "jdbc:oracle:thin:@localhost:1525:xe";
    	
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		con = DriverManager.getConnection(url, userID, userPass);
		
		csmt = con.prepareCall("{call PKG_BOARD.PROC_BOARD_SEL(?,?,?)}");
		
		csmt.setString(1,"List");
		csmt.setString(2,"");
		csmt.registerOutParameter(3, OracleTypes.CURSOR);
		
		csmt.execute();
		
		rs = (ResultSet)csmt.getObject(3);
		
	%>

	<div id="wrap">
	
		<div id="btnBlock">
			<a href="./write.jsp"><span class="btn">글쓰기</span></a>
		</div>
	
		<div id="borad">
		
			<% 
				while(rs.next()){
			%>
			<div>
				<span style="width:50px"><%=rs.getString("BNUM")%></span>
				<a href="./contents.jsp?idx=<%=rs.getString("IDX")%>"><span style="width:350px"><%=rs.getString("TITLE")%></span></a>
				<span><%=rs.getString("MEMID")%></span>
				<span><%=rs.getString("REGDATE")%></span>
				<span><%=rs.getInt("VISITED")%></span>
			</div>
			<% 
				}
			
			rs.close();
			con.close();
			%>
		</div>
		
	</div>
</body>
</html>