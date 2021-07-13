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
				border: 1px solid blue;
				float:left;
				text-align:center;
			}
			#list_content span{
				display:block;
				height:40px;
				padding:4px 0px 0px 0px;
				font-size: 20px;
				border: 1px solid blue;
				float:left;
				text-align:center;
			}
		</style>
	    <link rel="stylesheet" type="text/css" href="../css/easyui.css">
	    <link rel="stylesheet" type="text/css" href="../css/icon.css">
	     <link rel="stylesheet" type="text/css" href="../css/demo.css">
	     <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>
    	<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
    	<script>
   	
    		var menuList = null;
    		
    		$(document).ready(
    				
    			function(){
    				
    		         var ajaxObj = ({
    		               type:"post",
    		               async:"true",
    		               url:"/ServBoard/Admin_MenuList_combo",
    		               data:"",
    		               dataType:"json",
    		               success:function(data){

							menuList = data["MENUS"]            	   
    		            	   
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
	                  
	                  for(var i=0;i<programs.length;i++){
	                     
	                     var program = programs[i];
	                     var pid = program["PID"];
	                     var menuid = program["MENUID"];
	                     var pname = program["PNAME"];
	                     var purl = program["PURL"];
	                     var pfilename = program["PFILENAME"];
	                     
		        	    
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
		       	    	  
		       	       	 /* 
	                     if(menuid == menu["MENUID"]){
	                    	 strHTML_Combo.replace("++","selected");
	                     }
	                     else{
	                    	 strHTML_Combo.replace("++","");
	                     }
		       	    	  */
		       	    	  
	                     strHTML += '<div id="lists">';
	                     strHTML += '<span style="width:5%">';
	                     strHTML += '<input type="checkbox" class="easyui-checkbox" name="" id="">';
	                     strHTML += '</span>';
	                     strHTML += '<span style="width:20%">' + pid +'</span>';
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
   
   
   </script>
  	
</head>
<body>
	<div id="wrap">
		<div id="search">
			<input type="text" name="" id="" class="txt"/>
			<input type="button" value="조회" class="btn" onclick="setProgramList();"/>
			<input type="button" value="추가" class="btn"/>
			<input type="button" value="저장" class="btn"/>
			<input type="button" value="삭제" class="btn"/>
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
		</div>
	</div>
</body>
</html>