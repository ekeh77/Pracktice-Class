<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%
		//String strSID = session.getId();
		String strResult = request.getParameter("result");
	%>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function chkLogin(result){
		if(result == 'N'){
			alert("아이디 또는 패스워드가 일치하지 않습니다")
		}
	}
</script>
</head>
<body onload=chkLogin('<%=strResult %>')>

	<% 
		String strUserID = (String)session.getAttribute("user");
		String strUserName = (String)session.getAttribute("userName");
		
		//if(!strResult.equals("Y")){
		if(strUserID == null){
	%>
	<div>
		<form action="./01_Member/login_ok.jsp" method="post">
			<div>아이디 : <input type="text" name="userID" /></div>
			<div>패스워드 : <input type="text" name="userPass" /></div>
			<div><input type="submit" value="로그인" /></div>
		</form>
	</div>
	<%
		}
		else{
	%>
	<div>
		<form action="./01_Member/logout.jsp" method="post">
		<div><%=strUserName %>님 로그인 성공</div>
		<div><input type="submit" value="로그아웃" /></div>
		</form>
	</div>
	<%
		}
	%>
</body>
</html>