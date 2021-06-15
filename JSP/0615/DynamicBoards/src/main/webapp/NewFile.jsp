<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div{
		width:100px;
		height:100px;
		border:1px solid black;
	}
</style>
<script>
	var ar = () => document.getElementById("a").innerHTML = "hello"
	
	function clickOne(obj){
		
		var getbox = document.getElementsByName("checkOne");
		
		for(var i=0; i<getbox.length; i++){
			getbox[i].checked = false;
		}
		
		obj.checked = true;	
	
	}
	
	function checkOnlyOne(element) {
		  
		  const checkboxes 
		      = document.getElementsByName("animal");
		  
		  checkboxes.forEach((cb) => {
		    cb.checked = false;
		  })
		  
		  element.checked = true;
		}
</script>
</head>
<body>
	<div id="a" onclick="ar();"></div>
	
	<input type="checkbox" name="checkOne" onclick="clickOne(this)"/>
	<input type="checkbox" name="checkOne" onclick="clickOne(this)"/>
	<input type="checkbox" name="checkOne" onclick="clickOne(this)"/>
	
	<input type='checkbox'
       name='animal' 
       value='dog'
       onclick='checkOnlyOne(this)'/> 개
<br />
<input type='checkbox' 
       name='animal' 
       value='cat' 
       onclick='checkOnlyOne(this)'/> 고양이
<br />
<input type='checkbox' 
       name='animal' 
       value='rabbit' 
       onclick='checkOnlyOne(this)'/> 토끼
</body>
</html>