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
	.clickList:hover{
		background-color:#444444;
		color:#fefefe;
		cursor:pointer;
	}
</style>
<script src="./js/jquery-3.6.0.min.js"></script>
<script>

	var showSubMenuList = function(selectedMainMenuID){
		location.href = "/ServBoard/Admin_MenuList?selectedMainMenuID=" + selectedMainMenuID;
	}
	
	var menuSearch = function(){
		
		var menuname = $("#s_menuName").val();
		
		location.href = "/ServBoard/Admin_MenuList?mainMenuName=" + menuname;
		
	}
	
</script>
</head>
<%
	ArrayList<MenuListDAO> mainMenuList = (ArrayList<MenuListDAO>)request.getAttribute("mainMenuList");
	ArrayList<MenuListDAO> subMenuList = (ArrayList<MenuListDAO>)request.getAttribute("subMenuList");
%>
<body>
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
						<td width="40%" height="30px" colspan="2" align="center">
							<input type="text" name="s_menuName" id="s_menuName" />
							<input type="button" value="조회" onclick="menuSearch();"/>
						</td>
						<td width="40%" height="30px" align="right" colspan='6'>
							<input type="button" value="추가" onclick="setNewMenuListes();"/>
							<input type="button" value="저장" onclick="modify();"/>
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
					
					<tr onclick="showSubMenuList('<%=mainMenu.getMenuID() %>')" class="clickList">
						<td width="10%" height="30px" align="center">
							<input type="checkbox" name="" value="" />
						</td>
						<td width="29%" height="30px" align="center">
							<span><%=mainMenu.getMenuID() %></span>
						</td>
						<td width="40%" height="30px">
							<span><%=mainMenu.getMenuName() %></span>
							
						</td>
						<td width="10%" height="30px" align="center">
							<span><%=mainMenu.getMenuSeq() %></span>
							
						</td>
						<td width="10%" height="30px" align="center">
							<span><%=mainMenu.getMenuLvl() %></span>
							
						</td>
						<td width="1%" height="30px" align="center">
							
						</td>
					</tr>
					<%
						}
					%>
					
				</table>
			</td>
			<td width="60%" align="center"  height="875px" valign="top">
			<!-- 서브메뉴 테이블 시작 -->
				<table border="1" width="100%" align="center" cellpadding="0" cellspacing="0">
				
					<tr>
						<td width="40%" height="30px" colspan="2" align="center">
							<input type="text" name="s_memberName" id="s_memberName" />
							<input type="button" value="조회" onclick="subMenuSearch();"/>
						</td>
						<td width="40%" height="30px" align="right" colspan='6'>
							<input type="button" value="추가" onclick="setNewMenuListes();"/>
							<input type="button" value="저장" onclick="modify();"/>
							<input type="button" value="삭제" onclick="delRow();"/>
						</td>
						<td width="1%"></td>
					</tr>
				
				
					<tr>
						<td width="7%" height="30px" align="center">
							<input type="checkbox" name="" value="" />
						</td>
						<td width="22%" height="30px" align="center">
							<span>메뉴아이디</span>
						</td>
						<td width="34%" height="30px" align="center">
							<span>메뉴명</span>
						</td>
						<td width="7%" height="30px" align="center">
							<span>순서</span>
						</td>
						<td width="7%" height="30px" align="center">
							<span>레벨</span>
						</td>
						<td width="22%" height="30px" align="center">
							<span>부모아이디</span>
						</td>
						<td width="1%" height="30px" align="center">
							
						</td>
					</tr>
					
					<%
						for(MenuListDAO subMenu : subMenuList)
						{
					%>
					
					<tr>
						<td width="7%" height="30px" align="center">
							<input type="checkbox" name="" value="" />
						</td>
						<td width="22%" height="30px" align="center">
							<span><%=subMenu.getMenuID() %></span>
						</td>
						<td width="34%" height="30px">
							<span><%=subMenu.getMenuName() %></span>
						</td>
						<td width="7%" height="30px" align="center">
							<span><%=subMenu.getMenuSeq() %></span>
						</td>
						<td width="7%" height="30px" align="center">
							<span><%=subMenu.getMenuLvl() %></span>
						</td>
						<td width="22%" height="30px" align="center">
							<span><%=subMenu.getParentID() %></span>
						</td>
						<td width="1%" height="30px" align="center">
							
						</td>
					</tr>
					
					<%
						}
					%>
					<!-- 서브메뉴 테이블 끝 -->
				</table>
			</td>
		</tr>
	</table>
</body>
</html>