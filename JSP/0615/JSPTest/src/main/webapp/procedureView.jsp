<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var httpRequest = null;
	
	function getHttpRequest(){
		
		//내장객체
		httpRequest = new XMLHttpRequest();
		
	}

	function getList(){
		alert();
		getHttpRequest();
		
		//server에 있는 list.jsp를 호출
		httpRequest.onreadystatechange = callback;
		httpRequest.open("GET","./procedure.jsp",true);
		httpRequest.send(null);
		
	}
	
	function callback()
	{ 
		//서버로부터 응답이 왔으므로 알맞은 작업을 수행 
		if (httpRequest.readyState == 4) 
		{ 
			if (httpRequest.status == 200) 
			{ 
				//alert(httpRequest.responseText)
				
			} 
			else { alert("실패: " + httpRequest.status); } 
		}

	}
</script>
</head>
<body onload="getList();">

</body>
</html>