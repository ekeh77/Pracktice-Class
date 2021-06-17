<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인이 되어있는지 판단
	String strUserID = (String)session.getAttribute("user");

	if(strUserID == null){
		
		response.sendRedirect("../index.jsp");
		
	}

	String selectedMenuID = request.getParameter("menuID");

	if(selectedMenuID == null){
		selectedMenuID = "M001";
	}//참조 없음
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../Css/board.css"/>
<script src="../JS/board.js" type="text/javascript"></script>
<script>
	var getMenuID = "";
	function goWrite(){
		
		location.href = "./write.jsp?MenuID=" + getMenuID;//자바스크립트에서 옮겨가는것
	}
	
	function goRead(bNum){
		location.href = "./read.jsp?bNum=" + bNum;
	}
</script>
</head>
<body onload="getMenus('<%=selectedMenuID%>');">
	<div id="wrap">
		<div id="menus">
			
		</div>
		<div id="boards">
			<div id="bHead">
				<div></div>
				<div>
					<input type="button" value="글쓰기" onclick="goWrite();" />
				</div>
			</div>
			<div id="bBody">
			</div>
			<div id="bBottom"></div>
		</div>
	</div>
</body>
</html>