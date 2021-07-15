<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="PKG_ADMIN_DAO.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
		margin:0px;
	}
	
	.txt{
		width: 99%;
		height: 40px;
		border-width: 0px;
		text-align:center;
		font-size:14px;
	}
	.selecteMenu{
		background-color:#444444;
		color:#fefefe;
		font-weight:bolder;
	}
</style>
<script src="./js/jquery-3.6.0.min.js"></script>
<script>
	var authSearch = function(){
		
		var authname = $("#s_authname").val();
		
		location.href = "/ServBoard/Admin_AuthList?authname=" + authname;
		
	}
	
	var checkAll = function(){
		
		var rst = $("#chkAll").prop("checked");
		
		if(rst){
			
			$("input[name='chk']").prop("checked",true);
			
		}
		else{
				
			$("input[name='chk']").prop("checked",false);
			
		}
		
	}
	
	var isAddRow = true;
	/*
	var addRow = function(){
		
		//ajax로 새로운 AUTHID를 받아온다
		
		var strHTML = "";
		
		strHTML += "<tr>";
		strHTML += 		"<td width='10%' height='30px' align='center'>";
		strHTML += 			"<input type='checkbox' name='chk' />";
		strHTML += 		"</td>";
		strHTML += 		"<td width='25%' height='30px' align='center'>";
		strHTML += 			"<input type='text' name='authid' class='txt' value='" + newID +"' readonly/>";
		strHTML += 		"</td>";
		strHTML += 		"<td width='40%' height='30px' align='center' colspan='2'>";
		strHTML += 			"<input type='text' name='authname' class='txt'/>";
		strHTML += 		"</td>";
		strHTML +=		"<td width='1%'>";
		strHTML +=			"<input type='hidden' name='gbn' value='I'/>";
		strHTML +=		"</td>";
		strHTML += "</tr>";
		
		
		if(isAddRow){
		
		$("#authListTbl").append(strHTML);
		
		}
		
		isAddRow = false;
		
	}
	*/
	var addRow_Res = function(newID){
		
		var strHTML = "";
		
		strHTML += "<tr>";
		strHTML += 		"<td width='10%' height='30px' align='center'>";
		strHTML += 			"<input type='checkbox' name='chk' value='"+ newID +"'/>";
		strHTML += 		"</td>";
		strHTML += 		"<td width='25%' height='30px' align='center'>";
		strHTML += 			"<input type='text' name='authid' class='txt' value='" + newID +"' readonly/>";
		strHTML += 		"</td>";
		strHTML += 		"<td width='40%' height='30px' align='center' colspan='2'>";
		strHTML += 			"<input type='text' name='authname' class='txt'/>";
		strHTML += 		"</td>";
		strHTML +=		"<td width='1%'>";
		strHTML +=			"<input type='hidden' name='gbn' value='I'/>";
		strHTML +=		"</td>";
		strHTML += "</tr>";
		
		
		if(isAddRow){
		
		$("#authListTbl").append(strHTML);
		
		}
		
		isAddRow = false;
		
	}
	
	var modify = function(){
		
		var cnt = 0;
		var len = $("input[name='authname']").length;
		
		for(var i=0; i<len; i++){
			var authname_val = $("input[name='authname']").eq(i).val();
			
			if(authname_val.trim() == ""){
				cnt += 1;
			}
		}
		
		if(cnt > 0){
			alert("권한이름을 정확하게 입력해 주세요!(빈값있음)");
			return;
		}
		
		$("#authForm").submit();
	}
	
	var newID = ""
	
	var setNewAuthID = function(){
		$.ajax({
			type: "post",
			async: "true",
			url: "/ServBoard/Admin_NewAuthID",
			data:"",
			dataType:"xml",
			success:function(data){
				//ajax요청을 통해 반환되는 데이터 data
				newID = $(data).find("authNewID").text();
			},
			error:function(xhr,status,error){
				//오류 발생시 처리
				alert("err")
			},
			complete:function(data,textStatus){
				//작업완료 후 처리
				addRow_Res(newID);
			}
		});
		
	}
	
	var delRow = function(){
		//하나라도 체크가 되지 않았다면 경고창
		var obj = document.getElementsByName("chk");
		var countNum = 0;
		
		for(var i=0; i<obj.length; i++){
			
			if(obj[i].checked){
				
				countNum += 1;
				
			}
			
		}
		
		if(countNum == 0){
			alert("삭제할행을 선택해주세요")
			return
		}
		
		//삭제하시겠습니까?
		var isRst = confirm("삭제 하시겠습니까?");
		
		if(isRst){
			
			$("#authForm").attr("action","/ServBoard/Admin_DelAuthList");
			$("#authForm").submit();
			
		}
		
		
	}
	
	/*
	var delRow = function(){
			
	}
	*/
	
</script>
</head>
<%
	ArrayList<AuthListDAO> authLists = (ArrayList<AuthListDAO>)request.getAttribute("authLists");
%>
<body>
	<form name="authForm" id="authForm" action="/ServBoard/Admin_ModAuthList" method="post">
		<table border="1" width="100%" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="100%" height="70px" align="center">
					<!-- 메뉴구성 테이블 시작 -->
					<table border="1" width="80%" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="16%" height="40" align="center" class="selecteMenu">
								<span>권한관리</span>
							</td>
							<td width="16%" height="40" align="center">
								<a href="Admin_MemList"><span>회원관리</span></a>
							</td>
							<td width="16%" height="40" align="center">
								<a href="Admin_MenuList"><span>메뉴관리</span></a>
							</td>
							<td width="16%" height="40" align="center">
								<a href="/ServBoard/02_admin/program_list.jsp"><span>프로그램관리</span></a>
							</td>
							<td width="16%" height="40" align="center">
								<a href="/ServBoard/02_admin/auth_menus.jsp"><span>권한별상세관리</span></a>
							</td>
						</tr>
					</table>
					<!-- 메뉴구성 테이블 끝 -->
				</td>
			</tr>
			<tr>
				<td width="100%" height="890px" align="center" valign="top">
					<!-- 권한리스트 테이블 시작 -->
					<table border="1" width="80%" align="center" cellpadding="0" cellspacing="0" id="authListTbl">
						<tr>
							<td width="40%" height="30px" colspan="2" align="center">
								<input type="text" name="s_authname" id="s_authname" />
								<input type="button" value="조회" onclick="authSearch();"/>
							</td>
							<td width="40%" height="30px" align="right" colspan='2'>
								<input type="button" value="추가" onclick="setNewAuthID();"/>
								<input type="button" value="저장" onclick="modify();"/>
								<input type="button" value="삭제" onclick="delRow();"/>
							</td>
							<td width="1%"></td>
						</tr>
						<tr>
							<td width="10%" height="30px" align="center" >
								<input type="checkbox" name="chkAll" id="chkAll" onclick="checkAll();"/>
							</td>
							<td width="25%" height="30px" align="center">
								<span>권한아이디</span>
							</td>
							<td width="40%" height="30px" align="center" colspan='2'>
								<span>권한명</span>
							</td>
							<td width="1%"></td>
						</tr>
						<%
							for(AuthListDAO auth : authLists){
						%>
						<tr>
							<td width="10%" height="30px" align="center" >
								<input type="checkbox" name="chk" value="<%=auth.getAuthID()%>"/>
							</td>
							<td width="25%" height="30px" align="center">
								<input type="text" name="authid" class="txt" value="<%=auth.getAuthID()%>" readonly/>
							</td>
							<td width="40%" height="30px" align="center">
								<input type="text" name="authname" class="txt" value="<%=auth.getAuthName()%>" colspan='2'/>
							</td>
							<td width="1%">
								<input type="hidden" id="gbn" name="gbn" value="U"/>
							</td>
						</tr>
						<%
							}
						%>
					</table>
					<!-- 권한리스트 테이블 끝 -->
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
