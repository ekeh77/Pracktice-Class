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
			<label><input type="radio" name="gender" value="male"/>����</label>
			<label><input type="radio" name="gender" value="female"/>����</label>
			<label><input type="radio" name="gender" value="ETC"/>��Ÿ</label>
		</div>
		<div>
			���
			<label><input type="checkbox" name="hobby" value="M" />��ȭ����</label>
			<label><input type="checkbox" name="hobby" value="S" />���ǵ��</label>
			<label><input type="checkbox" name="hobby" value="C" />����</label>
		</div>
		<div>
			<input type="submit" value="Ȯ��"/>
		</div>
	</form>
</body>
</html>