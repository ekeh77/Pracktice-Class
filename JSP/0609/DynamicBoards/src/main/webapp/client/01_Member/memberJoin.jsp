<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form name="testForm" action="memberJoin_ok.jsp">
		<div>
			<label><input type="radio" name="gender" value="male"/>남자</label>
			<label><input type="radio" name="gender" value="female"/>여자</label>
			<label><input type="radio" name="gender" value="ETC"/>기타</label>
		</div>
		<div>
			취미
			<label><input type="checkbox" name="hobby" value="M" />영화보기</label>
			<label><input type="checkbox" name="hobby" value="S" />음악듣기</label>
			<label><input type="checkbox" name="hobby" value="C" />수집</label>
		</div>
		<div>
			<input type="submit" value="확인"/>
		</div>
	</form>
</body>
</html>