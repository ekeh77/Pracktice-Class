<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	#title{
	
		width:380px;
		height:40px;
		font-size:25px;
		border:0px;
	}
	#contents{
		width:480px;
		height:380px;
		font-size:25px;
		border:0px;
	}
</style>
<script>
	function check_Value(){
		
		var obj = document.getElementById("title");
		var obj2 = document.getElementById("contents");
		
		if(obj.value == ""){
			
			alert("�������� ����� �̳��!");
			obj.focus();
			return;
			
		}
		
		if(obj2.value == ""){
			
			alert("�۳����� ����� �̳��!");
			obj2.focus();
			return;
			
		}
		
		document.boardForm.submit();
		
		
	}
</script>
</head>
<body>

	<% 
		String strIdx = request.getParameter("idx");
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String userID = "C##JavaDB";
		String userPass = "1";
		String url = "jdbc:oracle:thin:@localhost:1525:xe";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		String strSql = "SELECT * FROM BOARD WHERE IDX=" + strIdx;
		
		con = DriverManager.getConnection(url, userID, userPass);
		stmt = con.createStatement();
		
		rs = stmt.executeQuery(strSql);
		
		rs.next();
	%>

	<table border="1" width="700" cellpadding="0" cellspacing="0" align="center">
		<tr>
			<td width="150">
				<!-- �޴��ڸ� -->
			</td>
			<td width="550" align="center">
				<form action="./update_ok.jsp?idx=<%= rs.getString("IDX") %>" method="post" name="boardForm" id="boardForm">
					<table border="1" cellpadding="0" cellspacing="0" align="center" width="500">
						<tr>
							<td width="100" align="center" height="30">
								������
							</td>
							<td width="400" height="30">
								<input type="text" name="title" id="title" value="<%=rs.getString("TITLE")%>"/>
							</td>
						</tr>
						<tr>
							<td colspan="2" width="500" height="400" valign="top">
								<textarea cols="70" rows="10" name="contents" id="contents"><%=rs.getString("CONTENTS")%></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="button" value="����" onclick="check_Value()"/>
							</td>
						</tr>
					</table>
				 </form>
			</td>
		</tr>
	</table>
</body>
</html>