<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	#title{
	
		width:380px;
		height:40px;
		font-size:25px;
		border:0px;
	}
	#contents{
		width:480px;
		height:380px;
		font-size:25px;
		border:0px;
	}
</style>
<script>
	function check_Value(){
		
		var obj = document.getElementById("title");
		var obj2 = document.getElementById("contents");
		
		if(obj.value == ""){
			
			alert("글제목을 적어라 이놈아!");
			obj.focus();
			return;
			
		}
		
		if(obj2.value == ""){
			
			alert("글내용을 적어라 이놈아!");
			obj2.focus();
			return;
			
		}
		
		document.boardForm.submit();
		
		
	}
</script>
</head>
<body>
	<table border="1" width="700" cellpadding="0" cellspacing="0" align="center">
		<tr>
			<td width="150">
				<!-- 메뉴자리 -->
			</td>
			<td width="550" align="center">
				<form action="./write_ok.jsp" method="post" name="boardForm" id="boardForm">
					<table border="1" cellpadding="0" cellspacing="0" align="center" width="500">
						<tr>
							<td width="100" align="center" height="30">
								글제목
							</td>
							<td width="400" height="30">
								<input type="text" name="title" id="title" />
							</td>
						</tr>
						<tr>
							<td colspan="2" width="500" height="400" valign="top">
								<textarea cols="70" rows="10" name="contents" id="contents"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan="2" align="center">
								<input type="button" value="저장" onclick="check_Value()"/>
							</td>
						</tr>
					</table>
				 </form>
			</td>
		</tr>
	</table>
</body>
</html>