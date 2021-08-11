<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- for each 와 똑같다 -->
	<div>성적리스트</div>
	
	<div>
		<span>학생이름</span>
		<span>총점</span>
	</div>
	
	<c:forEach var="score" items="${scoreList}">
	
	<div>
		<span>
			<a href="memberScore.do?sID=${score.sID}">
				<c:out value="${score.sID}" />
			</a>
		</span>
		<span><c:out value="${score.sName}" /></span>
		<span><c:out value="${score.totalScore}" /></span>
		
	</div>
	
	</c:forEach>
	
</body>
</html>