<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	
	function test(){
		alert();
	}
	var httpRequest = null;
	
	function getHttpRequest(){
		
		//내장객체
		httpRequest = new XMLHttpRequest();
		
	}

	function getList(){
		
		getHttpRequest();
		
		var gid = document.getElementById("id").value;
		var gtitle = document.getElementById("title").value;
		
		console.log(gtName);
		//server에 있는 list.jsp를 호출
		httpRequest.onreadystatechange = callback;
		httpRequest.open("POST","./write_ok.jsp?id=" + gid + "&title=" + gtitle,true);
		httpRequest.send("id=" + gid + "&title=" + gtitle);
		
	}
	
	function callback()
	{ 
		//서버로부터 응답이 왔으므로 알맞은 작업을 수행 
		if (httpRequest.readyState == 4) 
		{ 
			if (httpRequest.status == 200) 
			{ 
				//alert(httpRequest.responseText)
				//var datas = httpRequest.responseXML;
				alert("list를 보여줘")
			} 
			else { alert("실패: " + httpRequest.status); } 
		}

	}
	
</script>
</head>
<body>
	<%
		//out.print("<a href='javascript:test();'>안녕</a>");
	%>
	<form action="./write_ok.jsp" method="post">
		<div>
			아이디 : <input type="text" name="id" id="id"/>
		</div>
		<div>
			제목 : <input type="text" name="title" id="title"/>
		</div>
		<div>
			<input type="submit" value="확인"/>
			<input type="button" value="ajax" onclick="getList();"/>
		</div>
	</form>
</body>
</html>