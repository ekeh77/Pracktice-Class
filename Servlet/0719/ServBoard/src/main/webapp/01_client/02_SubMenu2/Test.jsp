<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String strSubMenuID = (String)request.getAttribute("subMenusID");
%>
<script type="text/javascript" src="/Test/js/jquery-3.6.0.min.js"></script>
<script>
	
	var selectedMenuID = '<%=strSubMenuID%>';
	
	$(document).ready(
			
		function(){
		
			setAuth();
			
		}
		
	);
	
	var setAuth = function(){
		
		var loginID = "M000001";
		
		var strHTML = "";
		
		var ajaxObj = ({
				
				type: "post",
				async: "true",
				url: "/ServBoard/TEST_AUTH",
				data:"memberID=" + loginID + "&menuID=" + selectedMenuID,
				dataType:"JSON",
				success:function(data){
					//ajax요청을 통해 반환되는 데이터 data
					
					var authes = data["MENU_AUTHES"];
					
					var auth_sel = authes[0]["AUTH_SEL"];
					var auth_ins = authes[0]["AUTH_INS"];
					var auth_up = authes[0]["AUTH_UP"];
					var auth_del = authes[0]["AUTH_DEL"]
					
					if(auth_sel == "Y"){
						strHTML +='<input type="button" value="조회" onclick="search();"/>';	
					}
					if(auth_ins == "Y"){
						strHTML +='<input type="button" value="추가" onclick="add();"/>';	
					}
					if(auth_up == "Y"){
						strHTML +='<input type="button" value="저장" onclick="save();"/>';	
					}
					if(auth_del == "Y"){
						strHTML +='<input type="button" value="삭제" onclick="del();"/>';	
					}
					
					$("#btns").html(strHTML);
				},
				error:function(xhr,status,error){
					//오류 발생시 처리
					alert("err")
				},
				complete:function(data,textStatus){
					//작업완료 후 처리
					
				}
			});
			$.ajax(ajaxObj);
		}
	
	var add = function(){
		
	}
	
	var save = function(){
		
	}
		
	var search = function(){
		
	}
	
	var del = function(){
		
	}
	
</script>
</head>
<body>
	<div id="btns">

	</div>
	테스트
</body>
</html>