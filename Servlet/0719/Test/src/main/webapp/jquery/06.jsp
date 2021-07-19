<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="./jquery-3.6.0.min.js"></script>
<script>

	var chkAll = function(obj){
		
		if($(obj).prop("checked")){
			$("input[name='chk']").prop("checked",true);
		}
		else{
			$("input[name='chk']").prop("checked",false);
		}
		
		
	}
	
	var chkAll2 = function(obj, objName){
		
		var objChk = document.getElementsByName(objName);
		
		if(obj.checked){
			
			for(var chkObj in objChks){
				chkObj.checked = true;
			}
			
		}
		else{
			
			for(var i=0; i<objChks.length;i++){
				objChks[i].checked = false;
			}
			
		}
		
	}
</script>
<style>
	span{
		width:100px;
		height:20px;
		padding-top:5px;
		float:left;
		border:1px solid blue;
	}
	div{
		clear:both;
	}
</style>
</head>
<body>
	<%
		for(int i = 0; i<10; i++){
	%>
	<div>
		<span>
			<input type="checkbox" name="chk" id="" onclick="chkAll(this);"/>
		</span>
		<span>
			<input type="checkbox" name="chk1" id=""/>
		</span>
		<span>
			<input type="checkbox" name="chk2" id=""/>
		</span>
		<span>
			<input type="checkbox" name="chk3" id=""/>
		</span>
	</div>
	<%
		} 
	%>
</body>
</html>