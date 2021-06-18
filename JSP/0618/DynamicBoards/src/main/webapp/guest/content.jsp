<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<jsp:useBean id="DBConn" class="PKG_DB.DBHandle" scope="page"/>
<%
	String strGID = request.getParameter("gid");

	String[] dbInfos = new String[3];
	dbInfos[0] = "C##JavaDB";
	dbInfos[1] = "1";
	dbInfos[2] = "jdbc:oracle:thin:@localhost:1525:xe";
	
	DBConn.setDBInfo(dbInfos);
	
	String strSql = "SELECT GID,GTITLE FROM GUEST WHERE GID = '" + strGID + "'";
	
	ResultSet rs = DBConn.getResultSet(strSql);
	
	rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function goUpdate(){
		document.getElementById("updateForm").action ="update.jsp"
		document.getElementById("updateForm").method ="post"
		document.getElementById("updateForm").submit();
		
	}
</script>
</head>
<body>
	<div>
		아이디 : <%=rs.getString("GID") %>
	</div>
	<div>
		제목 :  <%=rs.getString("GTITLE") %>
	</div>
	<div>
		<a href="./list.jsp">리스트로</a>
		<a href="delete.jsp?gid=<%=rs.getString("GID") %>"><input type="button" value="삭제"/></a>
		<div>
			<form action="update.jsp" method="post">
				<input type="hidden" name="gid" value="<%=rs.getString("GID") %>"/>
				<input type="submit" value="수정"/>
			</form>
		</div>
		<div>
			<form  name="updateForm" id="updateForm">
				<input type="hidden" name="gid" value="<%=rs.getString("GID") %>"/>
			</form>
				<a href="javascript:goUpdate();">수정</a>
				<span onclick="goUpdate();">수정</span>
		</div>
	</div>
</body>
</html>