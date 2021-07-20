<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<style>
			#list_title span{
				display:block;
				height:40px;
				padding:4px 0px 0px 0px;
				font-size: 20px;
				border: 1px solid black;
				float:left;
				text-align:center;
			}
			#list_content span{
				display:block;
				height:40px;
				padding:4px 0px 0px 0px;
				font-size: 20px;
				border: 1px solid black;
				float:left;
				text-align:center;
			}
			#list_content span input{
				border-width:0px;
				padding-left: 10px;
			}
			input:focus{
				outline:none;
			}
			.selecteMenu{
			display:block;
			background-color:#444444;
			color:#fefefe;
			font-weight:bolder;
			padding-top: 10px;
			width:100%;
			height:100%;
			}
		</style>
	    <link rel="stylesheet" type="text/css" href="../css/easyui.css">
	    <link rel="stylesheet" type="text/css" href="../css/icon.css">
	     <link rel="stylesheet" type="text/css" href="../css/demo.css">
	     <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
    	<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
    	<script>
   	
    		var menuList = null;
    		var rowCount = 0;
    		var isAdd = false;
    		var selectedMenuID = [];
    		
    		
    		$(document).ready(
    				
    			function(){
    				
    		         var ajaxObj = ({
    		               type:"post",
    		               async:"true",
    		               url:"/ServBoard/Admin_MenuList_combo",
    		               data:"",
    		               dataType:"json",
    		               success:function(data){
    		            	
							menuList = data["MENUS"];
							alert(menuList);
							setProgramList();  
							
    		               },
    		               error : function(xhr,status,error) {
    		                   //오류 발생 시 처리
    		                   alert("err");
    		               },
    		               complete:function(data,textStatus) {
    		                  
    		               }
    		         });
    		         $.ajax(ajaxObj);
    			}	
    			
    		);
    	
	      var setProgramList = function(){
	    	 /* 
	    	  //콤보박스
   	    	  var strHTML_Combo = "";
   	    	  strHTML_Combo += "<select name=''>";
   	    	  for(var menu of menuList){
   	    		  
   	    		  strHTML_Combo += "<option value='" + menu["MENUID"] + "++'>" + menu["MENUNAME"] + "</option>";

   	    	  }
   	    	  strHTML_Combo += "</select>";
	    	  */
	         //json.parse();          // string(text)을 json object 형태로 변환
	         //json.stringfy();       // json object 형태의 테이터를 text로 변환
	         var strHTML = "";
	         
	         var ajaxObj = ({
	               type:"post",
	               async:"true",
	               url:"/ServBoard/Admin_ProgramList",
	               data:"",
	               dataType:"json",
	               success:function(data){
						
	                  var programs = data["PROGRAMS"];
	                  
	                  rowCount = programs.length;
	                  
	                  for(var i=0;i<programs.length;i++){
	                     
	                     var program = programs[i];
	                     var pid = program["PID"];
	                     var menuid = program["MENUID"];
	                     var pname = program["PNAME"];
	                     var purl = program["PURL"];
	                     var pfilename = program["PFILENAME"];
	                     
	                     selectedMenuID[i] = menuid;
	                     
		        	    	/*
		       	    	  //콤보박스
		       	    	  var strHTML_Combo = "";
		       	    	  strHTML_Combo += "<select name=''>";
		       	    	  for(var menu of menuList){
		       	    		  
		       	    		  strHTML_Combo += "<option value='" + menu["MENUID"] + "'"
		       	    		  if(menuid == menu["MENUID"]){
		       	    			  strHTML_Combo += " selected";
		       	    		  }
		       	    		  strHTML_Combo += ">" + menu["MENUNAME"] + "</option>";
		       	    		  
		       	    	  }
		       	    	  strHTML_Combo += "</select>";
		       	    	  */
		       	    	  
		       	       	 /* 
	                     if(menuid == menu["MENUID"]){
	                    	 strHTML_Combo.replace("++","selected");
	                     }
	                     else{
	                    	 strHTML_Combo.replace("++","");
	                     }
		       	    	  */
		       	    	var strHTML_Combo = createCobo(menuid, i);
		       	    	 
		       	    	  
	                     strHTML += '<div id="lists'+ i +'">';
	                     strHTML += '<span style="width:5%">';
	                     strHTML += '<input type="checkbox" class="easyui-checkbox" name="chk" id="" value="' + pid + '">';
	                     strHTML += '</span>';
	                     strHTML += '<span style="width:20%"><input type="text" name="pid" value="' + pid + '" style="width:100%; height:100%;" readonly/></span>';
	                     strHTML += '<span style="width:20%"><input type="text" name="pname" value="' + pname + '" style="width:100%; height:100%;"/></span>';
	                     strHTML += '<span style="width:20%">' + strHTML_Combo + '</span>';
	                     strHTML += '<span style="width:20%"><input type="text" name="purl" value="' + purl + '" style="width:100%; height:100%;" /></span>';
	                     strHTML += '<span style="width:15%"><input type="text" name="pfilename" value="' + pfilename + '" style="width:100%; height:100%;" /></span>';
	                     strHTML += '</div>';
	                  }
	                  
	                  $("#list_content").html(strHTML);
	                  
	               },
	               error : function(xhr,status,error) {
	                   //오류 발생 시 처리
	                   alert("err");
	               },
	               complete:function(data,textStatus) {
	                  
	               }
	         });
	         $.ajax(ajaxObj);
	      }
   		
	      
	      var serchPList = function(){
	    	  
	    	  var serchValue = $("#serchVal").val();
	    	  
	         var strHTML = "";
	         var ajaxObj = ({
	               type:"post",
	               async:"true",
	               url:"/ServBoard/Admin_ProgramList",
	               data:"serchValue=" + serchValue,
	               dataType:"json",
	               success:function(data){

	                  var programs = data["PROGRAMS"];
	                  
	                  rowCount = programs.length;
	                  
	                  for(var i=0;i<programs.length;i++){
	                     
	                     var program = programs[i];
	                     var pid = program["PID"];
	                     var menuid = program["MENUID"];
	                     var pname = program["PNAME"];
	                     var purl = program["PURL"];
	                     var pfilename = program["PFILENAME"];
	                     
	                     selectedMenuID[i] = menuid;
	                     
		        	    	/*
		       	    	  //콤보박스
		       	    	  var strHTML_Combo = "";
		       	    	  strHTML_Combo += "<select name=''>";
		       	    	  for(var menu of menuList){
		       	    		  
		       	    		  strHTML_Combo += "<option value='" + menu["MENUID"] + "'"
		       	    		  if(menuid == menu["MENUID"]){
		       	    			  strHTML_Combo += " selected";
		       	    		  }
		       	    		  strHTML_Combo += ">" + menu["MENUNAME"] + "</option>";
		       	    		  
		       	    	  }
		       	    	  strHTML_Combo += "</select>";
		       	    	  */
		       	    	  
		       	       	 /* 
	                     if(menuid == menu["MENUID"]){
	                    	 strHTML_Combo.replace("++","selected");
	                     }
	                     else{
	                    	 strHTML_Combo.replace("++","");
	                     }
		       	    	  */
		       	    	var strHTML_Combo = createCobo(menuid, i);
		       	    	 
		       	    	  
	                     strHTML += '<div id="lists'+ i +'">';
	                     strHTML += '<span style="width:5%">';
	                     strHTML += '<input type="checkbox" class="easyui-checkbox" name="chk" id="" value="' + pid + '">';
	                     strHTML += '</span>';
	                     strHTML += '<span style="width:20%"><input type="text" name="pid" value="' + pid + '" style="width:100%; height:100%;" readonly/></span>';
	                     strHTML += '<span style="width:20%"><input type="text" name="pname" value="' + pname + '" style="width:100%; height:100%;"/></span>';
	                     strHTML += '<span style="width:20%">' + strHTML_Combo + '</span>';
	                     strHTML += '<span style="width:20%"><input type="text" name="purl" value="' + purl + '" style="width:100%; height:100%;" /></span>';
	                     strHTML += '<span style="width:15%"><input type="text" name="pfilename" value="' + pfilename + '" style="width:100%; height:100%;" /></span>';
	                     strHTML += '</div>';
	                  }
	                  
	                  $("#list_content").html(strHTML);
	                  
	               },
	               error : function(xhr,status,error) {
	                   //오류 발생 시 처리
	                   alert("err");
	               },
	               complete:function(data,textStatus) {
	                  
	               }
	         });
	    	  $.ajax(ajaxObj);
	      }
	      
	      var createCobo = function(menuid, i){
	    	  
	      	  //콤보박스
   	    	  var strHTML_Combo = "";
	      	  
   	    	  strHTML_Combo += "<select name='pmenuid' onchange='chkMenu(" + i + ", this, &quot;" + menuid + "&quot;);'>";
   	    	  strHTML_Combo += "<option value=''>선택해주세요</option>";
   	    	  for(var menu of menuList){
   	    		  
   	    		  strHTML_Combo += "<option value='" + menu["MENUID"] + "'"
   	    		  if(menuid == menu["MENUID"]){
   	    			  strHTML_Combo += " selected ";
   	    		  }
   	    		  strHTML_Combo += ">" + menu["MENUNAME"] + "</option>";
   	    		  
   	    	  }
   	    	  strHTML_Combo += "</select>";
   	    	  
	    	  return strHTML_Combo;
	    	  
	      }
	      
	      var chkMenu = function(i, objSelect, orgMenuid){
	    	 
	    	 if(selectedMenuID.includes(objSelect.value)){
	    		 alert("같은 URL이 포함되어있습니다");
	    		 objSelect.value = orgMenuid;
	    	 }
	    	 else{
	    		 
	    		 selectedMenuID[i] = objSelect.value;
	    		 
	    	 }
	    	  
	      }
	      
	      var addRow = function(){
	    	  
	    	  var strHTML_Combo = createCobo("",rowCount);
	    	  
	    	  var strHTML = "";
	    	  
              strHTML += '<div name="lists' + rowCount + '">';
              strHTML += '<span style="width:5%"></span>';
              strHTML += '<span style="width:20%"><input type="text" name="pid" value="자동생성" readonly style="width:100%; height:100%" /></span>';
              strHTML += '<span style="width:20%"><input type="text" name="pname" style="width:100%; height:100%;"/></span>';
              strHTML += '<span style="width:20%">' + strHTML_Combo + '</span>';
              strHTML += '<span style="width:20%"><input type="text" name="purl" style="width:100%; height:100%;" /></span>';
              strHTML += '<span style="width:15%"><input type="text" name="pfilename" style="width:100%; height:100%;" /></span>';
              strHTML += '</div>';
	    	  
              rowCount += 1;
              
              if(!isAdd){
            	  
              	$("#list_content").append(strHTML);
              	isAdd = true;
              }
              else{
            	  
            	alert("추가는 하나만 가능합니다");
            	  
              }
              
	      }
   		
	      var saveRow = function(){
	    	  isAdd = false;
	    	  var form = document.getElementById("list_Form");
	    	  form.submit();
	    	  
	      }
	      
	      var delRow = function(){
	    	  
	    	  var form = document.getElementById("list_Form");
	    	  form.action = "/ServBoard/Admin_DelProgramList"
	    	  form.submit();
	    	  
	      }
	      
   </script>
  	
</head>
<body>


	<div id="wrap">
	
	<table border="1" width="100%" align="center" cellpadding="0" cellspacing="0">
		<tr>
		<td width="100%" height="70px" align="center">
		<!-- 메뉴구성 테이블 시작 -->
		<table border="1" width="80%" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td width="16%" height="40" align="center">
					<a href="/ServBoard/Admin_AuthList"><span>권한관리</span></a>
				</td>
				<td width="16%" height="40" align="center">
					<a href="/ServBoard/Admin_MemList"><span>회원관리</span></a>
				</td>
				<td width="16%" height="40" align="center">
					<a href="/ServBoard/Admin_MenuList"><span>메뉴관리</span></a>
				</td>
				<td width="16%" height="40" align="center">
					<span class="selecteMenu">프로그램관리</span>
				</td>
				<td width="16%" height="40" align="center">
					<a href="/ServBoard/02_admin/auth_menus.jsp"><span>권한별상세관리</span></a>
				</td>
		</tr>
		</table>
	</table>
		<div id="search">
			<input type="text" name="serchVal" id="serchVal" class="txt"/>
			<input type="button" value="조회" class="btn" onclick="serchPList();"/>
			<input type="button" value="추가" class="btn" onclick="addRow();"/>
			<input type="button" value="저장" class="btn" onclick="saveRow();"/>
			<input type="button" value="삭제" class="btn" onclick="delRow();"/>
		</div>
		<div id="list">
			<div id="list_title">
				<span style="width:5%">
					<input type="checkbox" name="" id="" class="easyui-checkbox"/>
				</span>
				<span style="width:20%">프로그램아이디</span>
				<span style="width:20%">프로그램명</span>
				<span style="width:20%">연결메뉴</span>
				<span style="width:20%">Servlet URL</span>
				<span style="width:15%">JSP 파일명</span>
			</div>
			<form method="post" action="/ServBoard/Admin_ModProgramList" id="list_Form" name="list_Form">
				<div id="list_content">
				<!-- 
					<div id="lists">
						<span style="width:5%">
							<input type="checkbox" name="" id="" class="easyui-checkbox"/>
						</span>
						<span style="width:20%">프로그램아이디</span>
						<span style="width:20%">프로그램명</span>
						<span style="width:20%">연결메뉴</span>
						<span style="width:20%">Servlet URL</span>
						<span style="width:15%">JSP 파일명</span>
					</div>
					 -->
				</div>
			</form>
		</div>
	</div>
</body>
</html>