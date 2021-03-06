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
	#modMainMenuID, #modSubMenuID{
	border: 0px solid #444;	
	}
	#modSubDiv{
		position:absolute;
		top:100px;
		left:200px;
		visibility:hidden;
		background-color:rgba(255,255,255,10);
	}
	#insertSubDiv{
		position:absolute;
		top:100px;
		left:200px;
		visibility:hidden;
		background-color:rgba(255,255,255,10);
	}
	input:focus{
		outline:none;
	}
</style>
<script src="./js/jquery-3.6.0.min.js"></script>
<script>
	
	var subMenuPid = "";
	
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
				//ajax????????? ?????? ???????????? ????????? data
				
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
				//?????? ????????? ??????
				alert("err");
			},
			complete:function(data,textStatus){
				//???????????? ??? ??????
				
			}
	});
		
	}
	
	var setSubMenuList = function(selectedMenuId){
		
		subMenuPid = selectedMenuId
		
		$("#subMenuName").val("");
		var strHTML = "";
		$.ajax({
			type: "post",
			async: "false",
			url: "/ServBoard/Admin_SubMenuList?selectedMainMenuID=" + selectedMenuId,
			data:"",
			dataType:"xml",
			success:function(data){
				//ajax????????? ?????? ???????????? ????????? data
				
				$(data).find("submenu").each(function(){
					
					var menuid = $(this).find("menuid").text();
					var menuname = $(this).find("menuname").text();
					var menuseq = $(this).find("menuseq").text();
					var menulvl = $(this).find("menulvl").text();
					var menupid = $(this).find("menupid").text();
					
					strHTML += "<tr>";
					strHTML += "<td width='7%' height='30px' align='center'>";
					strHTML += "<input type='checkbox' name='subChk' value='" + menuid + "' />";
					strHTML += "</td>";
					strHTML += "<td width='22%' height='30px' align='center'>"	;					
					strHTML += "<input type='text' style='text-align:center;' name='subMenuID' readonly value='" + menuid + "' class='txt'>";
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
				//?????? ????????? ??????
				alert("err");
			},
			complete:function(data,textStatus){
				//???????????? ??? ??????
			
			}
		});
		
	}
	
	var insertShow = function(){
		$("#insertDiv").attr("style", "visibility:visible");
	}
	var hiddenInsert = function(){
		$("#insertDiv").attr("style", "visibility:hidden");
	}
	
	var isFirst = false;
	
	var insertSubShow = function(){
		
		$("#insertSubDiv").attr("style", "visibility:visible");
		if(isFirst == false){
			var strSelectList = "";
					
					$.ajax({
						type: "get",
						async: "false",
						url: "/ServBoard/Admin_SelectListMake",
						data:"",
						dataType:"xml",
						success:function(data){
							//ajax????????? ?????? ???????????? ????????? data
							
								strSelectList += "<select name='subinsparentID'>";
							
								$(data).find("submenulist").each(function(){
										
									var menuid = $(this).find("menuid").text();
									var menuname = $(this).find("menuname").text();
									
									strSelectList += "<option value='" + menuid + "'>";
									strSelectList += menuname;
									strSelectList += "</option>";	
	
								}
								);
								
								strSelectList += "</select>";
								
								$("#subparentID").append(strSelectList); 
								isFirst = true;
						},
						error:function(xhr,status,error){
							//?????? ????????? ??????
							alert("err");
						},
						complete:function(data,textStatus){
							//???????????? ??? ??????
							
						}
				});
		}	
	}
	var hiddenSubInsert = function(){
		$("#insertSubDiv").attr("style", "visibility:hidden");
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
			alert("????????? ????????? ??? ??? ????????????");
			return false
		}
		else if(ChkNum == 0){
			alert("?????? ??? ????????? ??????????????????");
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
	
	
	var modifySubShow = function(){
		var Chk = $("input[name=subChk]");
		var ChkNum = 0;
		var WhatNum = 0;
		
		for(var i=0; i<Chk.length; i++){
			if(Chk[i].checked){
				ChkNum += 1;
				WhatNum = i;
			}
		}
		
		if(ChkNum > 1){
			alert("????????? ????????? ??? ??? ????????????");
			return false
		}
		else if(ChkNum == 0){
			alert("?????? ??? ????????? ??????????????????");
			return false
		}
		
		var modID = $("input[name=subMenuID]").eq(WhatNum).val();
		var modName = $("input[name=subMenuName]").eq(WhatNum+1).val();
		var modSeq = $("input[name=subMenuseq]").eq(WhatNum).val();
		var modLvl = $("input[name=subMenuLvl]").eq(WhatNum).val();
		
		$("#modSubMenuID").val(modID);
		$("#modSubMenuName").val(modName);
		$("#modSubMenuSeq").val(modSeq);
		$("#modSubMenuLvl").val(modLvl);
		
		$("#modSubDiv").attr("style", "visibility:visible");
		
		
		
	}
	var hiddenSubMod = function(){
		$("#modSubDiv").attr("style", "visibility:hidden");
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
			alert("????????? ????????? ??????????????????")
			return
		}
		
		//?????????????????????????
		var isRst = confirm("?????? ???????????????????");
		
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
				//ajax????????? ?????? ???????????? ????????? data
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
					strHTML += "<input type='text' style='text-align:center;' name='subMenuID' readonly value='" + menuid + "' class='txt'>";
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
				//?????? ????????? ??????
				alert("err");
			},
			complete:function(data,textStatus){
				//???????????? ??? ??????
			}
		});
	}
	
	var chk_menu = function(obj){
		
		var selectedMenuID = $(obj).val();
		var subMenuID = obj.getAttribute("menuID");
		
		location.href = "/ServBoard/Admin_SubMenuSelectMod?strSubMenuID=" + subMenuID + "&strPid=" + selectedMenuID;
		
	}
	
	var chkempty = function(){
		var chkName = document.getElementById("insSubMenuName").value;
		var chkSeq = document.getElementById("insSubMenuSeq").value;
		var chkLvl = document.getElementById("insSubMenuLvl").value;
		var subinsForm = document.getElementById("insSubForm");
		if(chkName == "" || chkSeq == "" || chkLvl == ""){
			alert("???????????? ????????? ????????? ??? ????????????");	
		}
		else{
			subinsForm.submit();
		}
	}
	
	var subMenudelRow = function(){
		
		var obj = document.getElementsByName("subChk");
		
		var countNum = 0;
		
		for(var i=0; i<obj.length; i++){
			
			if(obj[i].checked){
				
				countNum += 1;
				
			}
			
		}
		
		if(countNum == 0){
			alert("????????? ????????? ??????????????????")
			return
		}
		
		//?????????????????????????
		var isRst = confirm("?????? ???????????????????");
		
		if(isRst){
			
			//$("#SubmenuForm").attr("action","/ServBoard/Admin_DelMenuList");
			$("#SubmenuForm").submit();
			
		}
		
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
					<!-- ???????????? ????????? ?????? -->
					<table border="1" width="80%" align="center" cellpadding="0" cellspacing="0">
						<tr>
							<td width="16%" height="40" align="center" >
								<a href="Admin_AuthList"><span>????????????</span></a>
							</td>
							<td width="16%" height="40" align="center">
								<a href="Admin_MemList"><span>????????????</span></a>
							</td>
							<td width="16%" height="40" align="center" class="selecteMenu">
								<span>????????????</span>
							</td>
							<td width="16%" height="40" align="center">
								<a href="/ServBoard/02_admin/program_list.jsp"><span>??????????????????</span></a>
							</td>
							<td width="16%" height="40" align="center">
								<a href="/ServBoard/02_admin/auth_menus.jsp"><span>?????????????????????</span></a>
							</td>
						</tr>
					</table>
					<!-- ???????????? ????????? ??? -->
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
								<input type="button" value="??????" onclick="menuSearch();"/>
							</td>
							<td width="61%" height="30px" align="right" colspan='4'>
								<input type="button" value="??????" onclick="insertShow();"/>
								<input type="button" value="??????" onclick="modifyShow();"/>
								<input type="button" value="??????" onclick="delRow();"/>
							</td>
							<td width="1%"></td>
						</tr>
					
						<tr>
							<td width="10%" height="30px" align="center">
								<input type="checkbox" name="" value="" />
							</td>
							<td width="29%" height="30px" align="center">
								<span>???????????????</span>
							</td>
							<td width="40%" height="30px" align="center">
								<span>?????????</span>
							</td>
							<td width="10%" height="30px" align="center">
								<span>??????</span>
							</td>
							<td width="10%" height="30px" align="center">
								<span>??????</span>
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
			<!-- ???????????? ????????? ?????? -->
			<form name="SubmenuForm" id="SubmenuForm" action="/ServBoard/Admin_DelSubMenuList" method="post">
				<table border="1" width="100%" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td width="29%" height="30px" colspan="2" align="center">
							<input type="text" name="subMenuName" id="subMenuName" />
							<input type="button" value="??????" onclick="subMenuSearch();"/>
						</td>
						<td width="71%" height="30px" align="right" colspan='4'>
							<input type="button" value="??????" onclick="insertSubShow();"/>
							<input type="button" value="??????" onclick="modifySubShow();"/>
							<input type="button" value="??????" onclick="subMenudelRow();"/>
						</td>
						<td width="1%"></td>
					</tr>
					<tr>
						<td width='7%' height='30px' align='center'>
							<input type='checkbox' name='subChkAll' value='' />
						</td>
						<td width='22%' height='30px' align='center'>					
							???????????????
						</td>
						<td width='34%' height='30px' align='center'>
							?????????			
						</td>
						<td width='7%' height='30px' align='center'>
							??????
						</td>
						<td width='7%' height='30px' align='center'>
							??????
						</td>
						<td width='22%' height='30px' align='center'>
							???????????????
						</td>
						<td width='1%' height='30px' align='center'>
						</td>
					</tr>
					<table border="1" width="100%" align="center" cellpadding="0" cellspacing="0" id="subMenuTbl">
						<tr>
						</tr>
					</table>
				</form>
					<!-- ???????????? ????????? ??? -->
				</table>
			</td>
		</tr>
	</table>
	<div id="insertDiv">
		<form name="insertForm" action="/ServBoard/Admin_InsMainMenu" method="post">
		<table border="1" cellpadding="0" cellspacing="0" width="350px" align="center">
			<tr>
				<td width="300px" height="40px" align="center" colspan="2">
					????????? ??????
				</td>
				<td width="50px" height="40px" align="center" onclick="hiddenInsert();">
					X
				</td>
			</tr>
			<tr>
				<td width="100px" height="40px" align="center">
					?????? ?????????
				</td>
				<td width="250px" height="40px" align="center" colspan="2">
					????????????
				</td>
			</tr>
			<tr>
				<td width="100px" height="40px" align="center">
					?????????
				</td>
				<td width="250px" height="40px" align="center" colspan="2">
					<input type="text" name="insMenuName" id="insMenuName" class="txt" value=""/>			
				</td>
			</tr>
			<tr>
				<td width="100px" height="40px" align="center">
					??????SEQ
				</td>
				<td width="250px" height="40px" align="center" colspan="2">
					<input type="text" name="insMenuSeq" id="insMenuSeq" class="txt" value=""/>			
				</td>
			</tr>
			<tr>
				<td width="100px" height="40px" align="center">
					??????LVL
				</td>
				<td width="250px" height="40px" align="center" colspan="2">
					1			
				</td>
			</tr>
			<tr>
				<td width="350px" height="40px" align="center" colspan="3">
					<input type="submit" value="????????????"/>
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
					????????? ??????
				</td>
				<td width="50px" height="40px" align="center" onclick="hiddenMod();">
					X
				</td>
			</tr>
			<tr>
				<td width="100px" height="40px" align="center">
					?????? ?????????
				</td>
				<td width="250px" height="40px" align="center" colspan="2">
					<input type="text" value="" readonly name="modMainMenuID" id="modMainMenuID"/>
				</td>
			</tr>
			<tr>
				<td width="100px" height="40px" align="center">
					?????????
				</td>
				<td width="250px" height="40px" align="center" colspan="2">
					<input type="text" name="modMainMenuName" id="modMainMenuName" class="txt"/>			
				</td>
			</tr>
			<tr>
				<td width="100px" height="40px" align="center">
					??????SEQ
				</td>
				<td width="250px" height="40px" align="center" colspan="2">
					<input type="text" name="modMainMenuSeq" id="modMainMenuSeq" class="txt"/>			
				</td>
			</tr>
			<tr>
				<td width="100px" height="40px" align="center">
					??????LVL
				</td>
				<td width="250px" height="40px" align="center" colspan="2">
					1	
				</td>
			</tr>
			<tr>
				<td width="350px" height="40px" align="center" colspan="3">
					<input type="submit" value="????????????"/>
				</td>
			</tr>
		</table>
		</form>
	</div>
	
	<div id="insertSubDiv">
		<form name="insertSubForm" action="/ServBoard/Admin_InsSubMenu" method="post" id="insSubForm">
			<table border="1" cellpadding="0" cellspacing="0" width="350px" align="center">
				<tr>
					<td width="300px" height="40px" align="center" colspan="2">
						???????????? ??????
					</td>
					<td width="50px" height="40px" align="center" onclick="hiddenSubInsert();">
						X
					</td>
				</tr>
				<tr>
					<td width="100px" height="40px" align="center">
						?????? ?????????
					</td>
					<td width="250px" height="40px" align="center" colspan="2">
						????????????
					</td>
				</tr>
				<tr>
					<td width="100px" height="40px" align="center">
						?????????
					</td>
					<td width="250px" height="40px" align="center" colspan="2">
						<input type="text" name="insSubMenuName" id="insSubMenuName" class="txt" value=""/>			
					</td>
				</tr>
				<tr>
					<td width="100px" height="40px" align="center">
						??????SEQ
					</td>
					<td width="250px" height="40px" align="center" colspan="2">
						<input type="text" name="insSubMenuSeq" id="insSubMenuSeq" class="txt" value=""/>			
					</td>
				</tr>
				<tr>
					<td width="100px" height="40px" align="center">
						??????LVL
					</td>
					<td width="250px" height="40px" align="center" colspan="2">
						<input type="text" name="insSubMenuLvl" id="insSubMenuLvl" class="txt" value=""/>			
					</td>
				</tr>
				<tr>
					<td width="100px" height="40px" align="center">
						???????????????
					</td>
					<td width="250px" height="40px" align="center" colspan="2" id="subparentID">
									
					</td>
				</tr>
				<tr>
					<td width="350px" height="40px" align="center" colspan="3" >
						<input type="button" value="????????????" onclick="chkempty();"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	<div id="modSubDiv">
		<form name="modSubDiv" action="/ServBoard/Admin_ModSubMenu" method="post">
		<table border="1" cellpadding="0" cellspacing="0" width="350px" align="center">
			<tr>
				<td width="300px" height="40px" align="center" colspan="2">
					???????????? ??????
				</td>
				<td width="50px" height="40px" align="center" onclick="hiddenSubMod();">
					X
				</td>
			</tr>
			<tr>
				<td width="100px" height="40px" align="center">
					?????? ?????????
				</td>
				<td width="250px" height="40px" align="center" colspan="2">
					<input type="text" value="" readonly name="modSubMenuID" id="modSubMenuID"/>
				</td>
			</tr>
			<tr>
				<td width="100px" height="40px" align="center">
					?????????
				</td>
				<td width="250px" height="40px" align="center" colspan="2">
					<input type="text" name="modSubMenuName" id="modSubMenuName" class="txt"/>			
				</td>
			</tr>
			<tr>
				<td width="100px" height="40px" align="center">
					??????SEQ
				</td>
				<td width="250px" height="40px" align="center" colspan="2">
					<input type="text" name="modSubMenuSeq" id="modSubMenuSeq" class="txt"/>			
				</td>
			</tr>
			<tr>
				<td width="100px" height="40px" align="center">
					??????LVL
				</td>
				<td width="250px" height="40px" align="center" colspan="2">
					<input type="text" name="modSubMenuLvl" id="modSubMenuLvl" readonly class="txt"/>
				</td>
			</tr>
			<tr>
				<td width="350px" height="40px" align="center" colspan="3">
					<input type="submit" value="????????????"/>
				</td>
			</tr>
		</table>
		</form>
	</div>
	
</body>
</html>