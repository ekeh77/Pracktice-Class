<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="PKG_DAO.listDAO" %>
<%
	ArrayList<listDAO> arr = (ArrayList<listDAO>)request.getAttribute("list");
	ArrayList arr2 = (ArrayList)request.getAttribute("list2");
	
	if(arr == null){
		response.sendRedirect("./write.jsp");	
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	span{
		display:block;
		width:200px;
		height:25px;
		padding:8px 0px 0px 0px;
		text-align:center;
		border:1px solid #444;
		float:left;
	}
	#list{
		clear:both;
	}
</style>
</head>
<body>
	<div id="">
		<div>
			<span>글번호</span>
			<span>글제목</span>
		</div>
		<%
			for(int i=0; i<arr.size(); i++){
				
				listDAO row = arr.get(i);
				String bnum = row.getBnum();
				String title = row.getTitle();
				String idx = row.getIdx();
				
				listDAO row2 = (listDAO)arr2.get(i);
				String bnum2 = row2.getBnum();
				String title2 = row2.getTitle();
				
		%>
		<div id="list">
			<span><%=bnum2%></span>
			<span><a href="/ServBoard/BoardContent?idx=<%=idx%>"><%=title2%></a></span>
		</div>
		<%
			}
		%>
	</div>
</body>
</html>