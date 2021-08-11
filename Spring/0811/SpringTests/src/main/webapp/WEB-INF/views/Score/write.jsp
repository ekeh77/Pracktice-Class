<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form name="scoreForm" method="post" action="scoreRealSave.do">
		<div>
			<div>회원아이디 : <input type="text" name="sID"/></div>
			<div>회원이름 : <input type="text" name="sName"/></div>
			<div>총점 : <input type="text" name="totalScore"/></div>
		</div>
		<div><input type="submit" value="확인"/></div>
	</form>
</body>
</html>