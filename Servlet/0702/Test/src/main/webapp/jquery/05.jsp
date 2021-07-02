<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./jquery-3.6.0.min.js"></script>
<script>

var newFunct = function(index){
		if(index == 1){
			console.log(index + ":" + $(this).text());
		}
	
}

var test = function(){
	
	$("li").each(
		newFunct(index);
	);
	
}
	

</script>
</head>
<body>
	<ui>
		<li>foo</li>
		<li>bar</li>
	</ui>
	<div>
		<input type="button" value="확인" onclick="test();"/>
	</div>
</body>
</html>