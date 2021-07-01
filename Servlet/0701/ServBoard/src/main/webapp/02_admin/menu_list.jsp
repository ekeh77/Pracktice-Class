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
		width: 98%;
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
	.clickList:hover{
		background-color:#444444;
		cursor:pointer;
	}
	
	.clickList:hover input{
		color:#fefefe;
	}
	#insertDiv{
		position:absolute;
		top:100px;
		left:200px;
		visibility:hidden;
		background-color:rgba(255,255,255,10);
	}
	#modDiv{
		position:absolute;
		top:100px;
		left:200px;
		visibility:hidden;
		background-color:rgba(255,255,255,10);
	}
	.clickList > td:nth-child(3) > input{
		width:150px;
		text-align:left;
	}
	.clickList > td:nth-child(2) > input{
		width:80px;
	}
	.clickList > td input{
		border: 0px solid #444;
		text-align:center;
		width:20px;
		background-color: rgba(0,0,0,0);
		cursor:pointer;
	}
	#modMainMenuID{
	border: 0px solid #444;	
	}
</style>
<script src="./js/jquery-3.6.0.min.js"></script>
<script>

	var showSubMenuList = function(selectedMainMenuID){
		
		location.href = "/ServBoard/Admin_MenuList?selectedMainMenuID=" + selectedMainMenuID;
		
	}
	
	var menuSearch = function(){
		
		var strMainMenuname = $("#mainMenuName").val();
		location.href = "/ServBoard/Admin_MenuList?mainMenuName=" + strMainMenuname;
		
	}
		
	var makeSelectList = function(){
		
		var strSelectList = "";
		
		$.ajax({
			type: "get",
			async: "false",
			url: "/ServBoard/Admin_SelectListMake",
			data:"",
			dataType:"xml",
			success:function(data){
				//ajax요청을 통해 반환되는 데이터 data
				
				var selectDiv = $("div[name='selectDiv']");
				var submenuID = $("[name='Submenuid']");
				
				for(var i=0; i<selectDiv.length; i++){
					
					var selectDivId = selectDiv[i].getAttribute('Pid');
					var selectPid = $(submenuID).eq(i).html();
					strSelectList += "<select name='selectPid' id='' menuID='" + selectPid + "' onchange='chk_menu(this);'>";
					
					$(data).find("submenulist").each(function(){
							
						var menuid = $(this).find("menuid").text();
						var menuname = $(this).find("menuname").text();
						
						if( selectDivId == menuid){
							strSelectList += "<option value='" + menuid + "' selected>";
							strSelectList += menuname;
							strSelectList += "</option>";
						}
						else{
							strSelectList += "<option value='" + menuid + "'>";
							strSelectList += menuname;
							strSelectList += "</option>";	
						}
						
					
					}
					);
					
					strSelectList += "</select>";
					
					selectDiv[i].innerHTML = strSelectList;
					strSelectList = "";
				}
				
			},
			error:function(xhr,status,error){
				//오류 발생시 처리
				alert("err");
			},
			complete:function(data,textStatus){
				//작업완료 후 처리
				
			}
	});
		
	}
	
	var setSubMenuList = function(selectedMenuId){
		
		$("#subMenuName").val("");
		var strHTML = "";
		$.ajax({
			type: "post",
			async: "false",
			url: "/ServBoard/Admin_SubMenuList?selectedMainMenuID=" + selectedMenuId,
			data:"",
			dataType:"xml",
			success:function(data){
				//ajax요청을 통해 반환되는 데이터 data
				
				$(data).find("submenu").each(function(){
					
					var menuid = $(this).find("menuid").text();
					var menuname = $(this).find("menuname").text();
					var menuseq = $(this).find("menuseq").text();
					var menulvl = $(this).find("menulvl").text();
					var menupid = $(this).find("menupid").text();
					
					strHTML += "<tr>";
					strHTML += "<td width='7%' height='30px' align='center'>";
					strHTML += "<input type='checkbox' name='' value='' />";
					strHTML += "</td>";
					strHTML += "<td width='22%' height='30px' align='center'>"	;					
					strHTML +=	"<span name='Submenuid'>" + menuid + "</span>"
					strHTML += "</td>";
					strHTML += "<td width='34%' height='30px'>";
					strHTML += "<input type='text' style='text-align:left;' name='subMenuName' value='" + menuname + "' class='txt'>";			
					strHTML += "</td>";
					strHTML += "<td width='7%' height='30px' align='center'>";
					strHTML +=	"<input type='text' name='subMenuseq' value='" + menuseq + "' class='txt'>";
					strHTML += "</td>";
					strHTML += "<td width='7%' height='30px' align='center'>";
					strHTML +=	"<input type='text' name='subMenuLvl' value='" + menulvl + "' class='txt'>";
					strHTML += "</td>";
					strHTML += "<td width='22%' height='30px' align='center'>";
					strHTML += "<div name='selectDiv' id='' Pid='" + menupid + "'></div>";
					strHTML += "</td>";
					strHTML += "<td width='1%' height='30px' align='center'>";
					strHTML += "</td>";
					strHTML += "</tr>";
				}
				);
				$("#subMenuTbl").html("");
				$("#subMenuTbl").append(strHTML);
				
				makeSelectList();
			},
			error:function(xhr,status,error){
				//오류 발생시 처리
				alert("err");
			},
			complete:function(data,textStatus){
				//작업완료 후 처리
			
			}
		});
		
	}
	
	var insertShow = function(){
		$("#insertDiv").attr("style", "visibility:visible");
	}
	var hiddenInsert = function(){
		$("#insertDiv").attr("style", "visibility:hidden");
	}
	var modifyShow = function(){
		var Chk = $("input[name=mainChk]");
		var ChkNum = 0;
		var WhatNum = 0;
		
		for(var i=0; i<Chk.length; i++){
			if(Chk[i].checked){
				ChkNum += 1;
				WhatNum = i;
			}
		}
		
		if(ChkNum > 1){
			alert("수정은 한개만 할 수 있습니다");
			return false
		}
		else if(ChkNum == 0){
			alert("수정 할 항목을 선택해주세요");
			return false
		}
		
		var modID = $("input[name=mainGetID]").eq(WhatNum).val();
		var modName = $("input[name=mainGetName]").eq(WhatNum).val();
		var modSeq = $("input[name=mainGetSeq]").eq(WhatNum).val();
		
		$("#modMainMenuID").val(modID);
		$("#modMainMenuName").val(modName);
		$("#modMainMenuSeq").val(modSeq);
		
		$("#modDiv").attr("style", "visibility:visible");
		
		
		
	}
	var hiddenMod = function(){
		$("#modDiv").attr("style", "visibility:hidden");
	}
	
	var delRow = function(){
		
		var obj = document.getElementsByName("mainChk");
		var countNum = 0;
		
		for(var i=0; i<obj.length; i++){
			
			if(obj[i].checked){
				
				countNum += 1;
				
			}
			
		}
		
		if(countNum == 0){
			alert("삭제할 항목을 선택해주세요")
			return
		}
		
		//삭제하시겠습니까?
		var isRst = confirm("삭제 하시겠습니까?");
		
		if(isRst){
			
			$("#MainmenuForm").attr("action","/ServBoard/Admin_DelMenuList");
			$("#MainmenuForm").submit();
			
		}
		
	}
	
	var subMenuSearch = function(){
		
		var subMenuName = $("#subMenuName").val();
		alert
		var strHTML = "";
		
		$.ajax({
			type: "post",
			async: "true",
			url: "/ServBoard/Admin_SubMenuSel?subMenuPid=" + subMenuPid + "&subMenuName=" + subMenuName,
			data:"",
			dataType:"xml",
			success:function(data){
				//ajax요청을 통해 반환되는 데이터 data
				$(data).find("submenu").each(function(){
					
					var menuid = $(this).find("menuid").text();
					var menuname = $(this).find("menuname").text();
					var menuseq = $(this).find("menuseq").text();
					var menulvl = $(this).find("menulvl").text();
					var menupid = $(this).find("menupid").text();
					
					strHTML += "<tr>";
					strHTML += "<td width='7%' height='30px' align='center'>";
					strHTML += "<input type='checkbox' name='' value='' />";
					strHTML += "</td>";
					strHTML += "<td width='22%' height='30px' align='center'>"	;					
					strHTML +=	menuid
					strHTML += "</td>";
					strHTML += "<td width='34%' height='30px'>";
					strHTML += "<input type='text' style='text-align:left;' name='subMenuName' value='" + menuname + "' class='txt'>";			
					strHTML += "</td>";
					strHTML += "<td width='7%' height='30px' align='center'>";
					strHTML +=	"<input type='text' name='subMenuseq' value='" + menuseq + "' class='txt'>";
					strHTML += "</td>";
					strHTML += "<td width='7%' height='30px' align='center'>";
					strHTML +=	"<input type='text' name='subMenuLvl' value='" + menulvl + "' class='txt'>";
					strHTML += "</td>";
					strHTML += "<td width='22%' height='30px' align='center'>";
					strHTML += "<div id='sMenuID'></div>";
					strHTML += "</td>";
					strHTML += "<td width='1%' height='30px' align='center'>";
					strHTML += "</td>";
					strHTML += "</tr>";
				}
				);
				$("#subMenuTbl").html("");
				$("#subMenuTbl").append(strHTML);
				
			},
			error:function(xhr,status,error){
				//오류 발생시 처리
				alert("err");
			},
			complete:function(data,textStatus){
				//작업완료 후 처리
			}
		});
	}
	
	var chk_menu = function(obj){
		
		var selectedMenuID = $(obj).val();
		var subMenuID = obj.getAttribute("menuID");
		
		location.href = "/ServBoard/Admin_SubMenuSelectMod?strSubMenuID=" + subMenuID + "&strPid=" + selectedMenuID;
		
	}
</script>
</head>
<%
	ArrayList<MenuListDAO> mainMenuList = (ArrayList<MenuListDAO>)request.getAttribute("mainMenuList");
	//ArrayList<MenuListDAO> subMenuList = (ArrayList<MenuListDAO>)request.getAttribute("subMenuList");
%>
<body>
	<form name="MainmenuForm" id="MainmenuForm" action="/ServBoard/Admin_DelMenuList" method="post">
		<table border="1" width="100%" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="100%" height="70px" align="center">
					<!-- 메뉴구성 테이블 시작 -->
					<table border="1" width="80%" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="16%" height="40" align="center" >
								<a href="Admin_AuthList"><span>권한관리</span></a>
							</td>
							<td width="16%" height="40" align="center">
								<a href="Admin_MemList"><span>회원관리</span></a>
							</td>
							<td width="16%" height="40" align="center" class="selecteMenu">
								<span>메뉴관리</span>
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
		</table>
		
		<table border="1" width="100%" height="875px" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="40%" align="center" height="875px" valign="top">
					<table border="1" width="100%" align="center" cellpadding="0" cellspacing="0">
				
						<tr>
							<td width="39%" height="30px" colspan="2" align="center">
								<input type="text" name="mainMenuName" id="mainMenuName" />
								<input type="button" value="조회" onclick="menuSearch();"/>
							</td>
							<td width="61%" height="30px" align="right" colspan='4'>
								<input type="button" value="추가" onclick="insertShow();"/>
								<input type="button" value="수정" onclick="modifyShow();"/>
								<input type="button" value="삭제" onclick="delRow();"/>
							</td>
							<td width="1%"></td>
						</tr>
					
						<tr>
							<td width="10%" height="30px" align="center">
								<input type="checkbox" name="" value="" />
							</td>
							<td width="29%" height="30px" align="center">
								<span>메뉴아이디</span>
							</td>
							<td width="40%" height="30px" align="center">
								<span>메뉴명</span>
							</td>
							<td width="10%" height="30px" align="center">
								<span>순서</span>
							</td>
							<td width="10%" height="30px" align="center">
								<span>레벨</span>
							</td>
							<td width="1%" height="30px" align="center">
								
							</td>
						</tr>
						
						<%
							for(MenuListDAO mainMenu : mainMenuList)
							{
						%>
						
						<tr onclick="setSubMenuList('<%=mainMenu.getMenuID() %>')" class="clickList" >
							<td width="10%" height="30px" align="center">
								<input type="checkbox" name="mainChk" value="<%=mainMenu.getMenuID() %>" />
							</td>
							<td width="29%" height="30px" align="center">
								<input type="text" name="mainGetID" value='<%=mainMenu.getMenuID() %>' readonly/>
								
							</td>
							<td width="40%" height="30px">
								<input type="text" name="mainGetName" value='<%=mainMenu.getMenuName() %>' readonly/>
							</td>
							<td width="10%" height="30px" align="center">
								<input type="text" name="mainGetSeq" value='<%=mainMenu.getMenuSeq() %>' readonly/>
							</td>
							<td width="10%" height="30px" align="center">
								<input type="text" name="mainGetLvl" value='<%=mainMenu.getMenuLvl() %>' readonly/>
							</td>
							<td width="1%" height="30px" align="center">
								
							</td>
						</tr>
						<%
							}
						%>
						
					</table>
			</form>
				<input type="hidden" id="searchValue" />
		
			</td>
			<td width="60%" align="center"  height="875px" valign="top">
			<!-- 서브메뉴 테이블 시작 -->
				<table border="1" width="100%" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td width="29%" height="30px" colspan="2" align="center">
							<input type="text" name="subMenuName" id="subMenuName" />
							<input type="button" value="조회" onclick="subMenuSearch();"/>
						</td>
						<td width="71%" height="30px" align="right" colspan='4'>
							<input type="button" value="추가" onclick="subInsertMenu();"/>
							<input type="button" value="수정" onclick="modify();"/>
							<input type="button" value="삭제" onclick="delRow();"/>
						</td>
						<td width="1%"></td>
					</tr>
					<tr>
						<td width='7%' height='30px' align='center'>
							<input type='checkbox' name='' value='' />
						</td>
						<td width='22%' height='30px' align='center'>					
							메뉴아이디
						</td>
						<td width='34%' height='30px' align='center'>
							메뉴명			
						</td>
						<td width='7%' height='30px' align='center'>
							순서
						</td>
						<td width='7%' height='30px' align='center'>
							레벨
						</td>
						<td width='22%' height='30px' align='center'>
							부모아이디
						</td>
						<td width='1%' height='30px' align='center'>
						</td>
					</tr>
					<table border="1" width="100%" align="center" cellpadding="0" cellspacing="0" id="subMenuTbl">
						<tr>
						</tr>
					</table>
					<!-- 서브메뉴 테이블 끝 -->
				</table>
			</td>
		</tr>
	</table>
	<div id="insertDiv">
		<form name="insertForm" action="/ServBoard/Admin_InsMainMenu" method="post">
		<table border="1" cellpadding="0" cellspacing="0" width="350px" align="center">
			<tr>
				<td width="300px" height="40px" align="center" colspan="2">
					주메뉴 추가
				</td>
				<td width="50px" height="40px" align="center" onclick="hiddenInsert();">
					X
				</td>
			</tr>
			<tr>
				<td width="100px" height="40px" align="center">
					메뉴 아이디
				</td>
				<td width="250px" height="40px" align="center" colspan="2">
					자동생성
				</td>
			</tr>
			<tr>
				<td width="100px" height="40px" align="center">
					메뉴명
				</td>
				<td width="250px" height="40px" align="center" colspan="2">
					<input type="text" name="insMenuName" id="insMenuName" class="txt" value=""/>			
				</td>
			</tr>
			<tr>
				<td width="100px" height="40px" align="center">
					메뉴SEQ
				</td>
				<td width="250px" height="40px" align="center" colspan="2">
					<input type="text" name="insMenuSeq" id="insMenuSeq" class="txt" value=""/>			
				</td>
			</tr>
			<tr>
				<td width="100px" height="40px" align="center">
					메뉴LVL
				</td>
				<td width="250px" height="40px" align="center" colspan="2">
					1			
				</td>
			</tr>
			<tr>
				<td width="350px" height="40px" align="center" colspan="3">
					<input type="submit" value="추가하기"/>
				</td>
			</tr>
		</table>
		</form>
	</div>
	<div id="modDiv">
		<form name="modForm" action="/ServBoard/Admin_ModMainMenu" method="post">
		<table border="1" cellpadding="0" cellspacing="0" width="350px" align="center">
			<tr>
				<td width="300px" height="40px" align="center" colspan="2">
					주메뉴 수정
				</td>
				<td width="50px" height="40px" align="center" onclick="hiddenMod();">
					X
				</td>
			</tr>
			<tr>
				<td width="100px" height="40px" align="center">
					메뉴 아이디
				</td>
				<td width="250px" height="40px" align="center" colspan="2">
					<input type="text" value="" readonly name="modMainMenuID" id="modMainMenuID"/>
				</td>
			</tr>
			<tr>
				<td width="100px" height="40px" align="center">
					메뉴명
				</td>
				<td width="250px" height="40px" align="center" colspan="2">
					<input type="text" name="modMainMenuName" id="modMainMenuName" class="txt"/>			
				</td>
			</tr>
			<tr>
				<td width="100px" height="40px" align="center">
					메뉴SEQ
				</td>
				<td width="250px" height="40px" align="center" colspan="2">
					<input type="text" name="modMainMenuSeq" id="modMainMenuSeq" class="txt"/>			
				</td>
			</tr>
			<tr>
				<td width="100px" height="40px" align="center">
					메뉴LVL
				</td>
				<td width="250px" height="40px" align="center" colspan="2">
					1	
				</td>
			</tr>
			<tr>
				<td width="350px" height="40px" align="center" colspan="3">
					<input type="submit" value="수정하기"/>
				</td>
			</tr>
		</table>
		</form>
	</div>
	
</body>
</html>