<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String selectedMenuID = request.getParameter("MenuID");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../Css/board.css"/>
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
				<div id="writeForm">
					<form action="write_ok.jsp" method="post">
						<div>
							<span class="left">글제목</span>
							<span class="right">
								<input type="text" name="title"/>
							</span>
						</div>
						<div>
							<span class="left">글내용</span>
							<span class="right">
								<textarea name="content" cols="60" rows="12"></textarea>
							</span>
						</div>
						<div>
							<span>메뉴아이디</span>
							<span><input type="text" name="selectedMenuID" value="<%=selectedMenuID%>"/></span>
						</div>
						<div>
							<span>작성자</span>
							<span></span>
						</div>
						<div>
							<input type="submit" value="확인"/>
						</div>
					</form>
				</div>
			</div>
			<div id="bBottom"></div>
		</div>
	</div>
</body>
</html>