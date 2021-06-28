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
		border-width: 0px 1px 0px 1px;
		text-align:center;
		font-size:14px;
	}
	.selecteMenu{
		background-color:#444444;
		color:#fefefe;
		font-weight:bolder;
		
	}
	.auth{
		font-size:20px;
	}
</style>
<script src="./js/jquery-3.6.0.min.js"></script>
<script>

	var checkAll = function(){
	
	var rst = $("#chkAll").prop("checked");
	
	if(rst){
		
		$("input[name='chk']").prop("checked",true);
		
	}
	else{
			
		$("input[name='chk']").prop("checked",false);
		
	}
	
	}

	var memberSearch = function(){
		
		var membername = $("#s_memberName").val();
		
		location.href = "/ServBoard/Admin_MemList?memberName=" + membername;
		
	}

	var addRow = function(data){
		
		var strSelectHTML = "";
		var authList_Length = $(data).find("authID").length
		strSelectHTML += "<select name='auth' class='auth' title='auth1'>";
		
		for(var i=0; i<authList_Length; i++){
			
			var authID = $(data).find("authID").eq(i).text();
			var authName = $(data).find("authName").eq(i).text();
			strSelectHTML += "<option value='" + authID + "'>"+ authName + "</option>";
		}
		
		strSelectHTML += "</select name='auth'>";
		var strHTML = "";
		
		strHTML += "<tr>";
		strHTML += 		"<td width='10%' height='30px' align='center'>";
		strHTML += 			"<input type='checkbox' name='chk' value=''/>";
		strHTML += 		"</td>";
		strHTML += 		"<td width='15%' height='30px' align='center'>";
		strHTML += 		"<input type='text' name='memberid' class='txt' value='자동생성' readonly/>";
		strHTML += 		"</td>";
		strHTML += 		"<td width='35%' height='30px' align='center'>";
		strHTML += 			"<input type='text' name='membername' title='auth1' class='txt'/>";
		strHTML += 		"</td>";
		strHTML += 		"<td width='20%' height='30px' align='center' colspan='2'>";
		strHTML +=			strSelectHTML;
		strHTML += 		"</td>";
		strHTML +=		"<td width='1%'>";
		strHTML +=			"<input type='hidden' name='gbn' value='I'/>";
		strHTML +=		"</td>";
		strHTML += "</tr>";
		
		
		$("#memberListTBL").append(strHTML);
	}
	
	var setNewMemberListes = function(){
		$.ajax({
			type: "post",
			async: "true",
			url: "/ServBoard/Admin_AuthList_AJAX",
			data:"",
			dataType:"xml",
			success:function(data){
				//ajax요청을 통해 반환되는 데이터 data
				addRow(data);
			},
			error:function(xhr,status,error){
				//오류 발생시 처리
				alert("err")
			},
			complete:function(data,textStatus){
				//작업완료 후 처리
				
			}
		});
		
	}
	
	var modify = function(){
		//회원 이름의 빈값을 처리
		$("[title='auth1']").each(
				
				function(){
					var fieldName = $(this).val();
					if(fieldName.trim().length <= 0){
						alert("비어있는 필드를 적어주세요");
						$(this).focus();
						modify.preventDefault();
						
					}
			}
		);
		
		$("#memberForm").submit();
		
		/*
		//권한에 대한 빈값도 처리
		$("select[name='auth']").each(
				function(){
					var authName = $(this).val();
					if(authName == "선택하세요"){
						alert("비어있는 권한을 선택해주세요");
						$(this).focus();
						return false;
					}
			}
		);
		*/
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
			
			$("#memberForm").attr("action","/ServBoard/Admin_DelMemberList");
			$("#memberForm").submit();
			
		}
		
		
	}
	
</script>
</head>
<%
	ArrayList<memberListDAO> memberLists = (ArrayList<memberListDAO>)request.getAttribute("memberLists");
	ArrayList<AuthListDAO> authLists = (ArrayList<AuthListDAO>)request.getAttribute("authLists");
%>
<body>
	<form name="memberForm" id="memberForm" action="/ServBoard/Admin_ModMemberList" method="post">
		<table border="1" width="100%" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="100%" height="70px" align="center">
					<!-- 메뉴구성 테이블 시작 -->
					<table border="1" width="80%" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="16%" height="40" align="center">
								<a href="Admin_AuthList"><span>권한관리</span></a>
							</td>
							<td width="16%" height="40" align="center" class="selecteMenu">
								<span>회원관리</span>
							</td>
							<td width="16%" height="40" align="center">
								<a href="Admin_MenuList"><span>메뉴관리</span></a>
							</td>
							<td width="16%" height="40" align="center">
								<span>프로그램관리</span>
							</td>
							<td width="16%" height="40" align="center">
								<span>권한별상세관리</span>
							</td>
						</tr>
					</table>
					<!-- 메뉴구성 테이블 끝 -->
				</td>
			</tr>
			<tr>
				<td width="100%" height="890px" align="center" valign="top">
					<!-- 권한리스트 테이블 시작 -->
					<table border="1" width="80%" align="center" cellpadding="0" cellspacing="0" id="memberListTBL">
						<tr>
							<td width="40%" height="30px" colspan="2" align="center">
								<input type="text" name="s_memberName" id="s_memberName" />
								<input type="button" value="조회" onclick="memberSearch();"/>
							</td>
							<td width="40%" height="30px" align="right" colspan='3'>
								<input type="button" value="추가" onclick="setNewMemberListes();"/>
								<input type="button" value="저장" onclick="modify();"/>
								<input type="button" value="삭제" onclick="delRow();"/>
							</td>
							<td width="1%"></td>
						</tr>
						<tr>
							<td width="10%" height="30px" align="center" >
								<input type="checkbox" name="chkAll" id="chkAll" onclick="checkAll();"/>
							</td>
							<td width="15%" height="30px" align="center">
								<span>회원아이디</span>
							</td>
							<td width="35%" height="30px" align="center">
								<span>회원명</span>
							</td>
							<td width="20%" height="30px" align="center" colspan='2'>
								<span>권한</span>
							</td>
							<td width="1%"></td>
						</tr>
						<%
							for(memberListDAO member : memberLists){
						%>
						<tr>
							<td width="10%" height="30px" align="center" >
								<input type="checkbox" name="chk" value="<%=member.getMID()%>"/>
							</td>
							<td width="15%" height="30px" align="center">
								<input type="text" name="memberid" class="txt" value="<%=member.getMID()%>" readonly/>
							</td>
							<td width="35%" height="30px" align="center">
								<input type="text" name="membername" class="txt" title="auth1" value="<%=member.getMName()%>"/>
							</td>
							<td width="20%" height="30px" align="center" colspan="2">
								<select name="auth" class="auth" title="auth1">
									<%
										for(AuthListDAO authList : authLists){
											String selectedAuthID = member.getAuthID();
											String authID = authList.getAuthID();
											String authName = authList.getAuthName();
									%>
										<option value="<%=authID%>"
									<%
										if(selectedAuthID.equals(authID)){
									%>
										selected
									<% 
										}
									%>
									
										><%=authName%></option>
										
									<%
										}
									%>
								</select>
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