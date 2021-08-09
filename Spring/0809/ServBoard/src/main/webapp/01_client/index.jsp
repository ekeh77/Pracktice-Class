<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

   <style type="text/css">
   
      #mainmenus, #submenus{
         clear:both;
      }
   
      .mainmenu{
         display:block;
         border:1px solid #555555;
         width:120px;
         height:25px;
         padding:7px 0px 0px 0px;
         float:left;
      }
      
      .submenu{
         display:block;
         border:1px solid #555555;
         width:150px;
         height:25px;
         padding:7px 0px 0px 0px;
      }
   
   </style>
   <script src="../js/jquery-3.6.0.min.js"></script>
   <script>
   
      $(document).ready(
         function(){
            setMainMenuList();
         }
      );
      
   
      var setMainMenuList = function(){
         
         //json.parse();          // string(text)을 json object 형태로 변환
         //json.stringfy();       // json object 형태의 테이터를 text로 변환
         var strHTML = "";
         var ajaxObj = ({
               type:"post",
               async:"true",
               url:"/ServBoard/Client_MainMenuList",
               data:"",
               dataType:"json",
               success:function(data){
   				
                  var menuLists = data["MAINMENULIST"];
                  for(var i=0;i<menuLists.length;i++){
                     
                     var menuList = menuLists[i];
                     var menuid = menuList["MENUID"];
                     var menuname = menuList["MENUNAME"];
                     
                     strHTML +="<span class='mainmenu'>";
                     strHTML +="<a href='javascript:setSubMenuList(&quot;" + menuid + "&quot;)'>" + menuname + "</a>";
                     strHTML +="</span>";
                  }
                  $("#mainmenus").html(strHTML);
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

      var setSubMenuList = function(mainmenuid){
         
         var strHTML = "";
         var ajaxObj = ({
            type:"post",
            async:"true",
            url:"/ServBoard/Client_SubMenuList",
            data:"mainmenuid=" + mainmenuid,
            dataType:"json",
            success:function(data){
               
               var submenus = data["SUBMENULIST"];
               for(var submenu of submenus){
                  
                  //T1.MENUID, T1.MENUNAME, T1.MENULVL, T1.MENUSEQ, T2.PURL, T2.PFILENAME 
                  var submenuid = submenu["MENUID"];
                  var submenuname = submenu["MENUNAME"];
                  var submenulvl = submenu["MENULVL"];
                  var submenuseq = submenu["MENUSEQ"];
                  var submenupurl = submenu["PURL"];
                  var submenupfilename = submenu["PFILENAME"];
                  
                  
                  strHTML += "<span class='submenu'>";
                  
                  if(submenupurl != null && submenupfilename != null){
                     strHTML += "<a href='/ServBoard/" + submenupurl + "?strURL=" + submenupfilename + "&menuID=" + submenuid + "' target='content'>" + submenuname + "</a>";
                  }
                  else{
                     strHTML += submenuname;
                  }
                  
                  strHTML += "</span>";
               }
               $("#submenus").html(strHTML);
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
   <table border="1" cellpadding="0" cellspacing="0" width="100%" align="center">
      <tr>
         <td width="20%" height="50px" align="center">
            <a href=""></a>
         </td>
         <td width="80%" height="50px" align="center">
            <div id="mainmenus">
            </div>
         </td>
      </tr>
      <tr>
         <td width="20%" height="880px" align="center" valign="top">
            <div id="submenus">
            </div>
         </td>
         <td width="80%" height="880px" align="center">
            <iframe width="100%" height="100%" name="content"></iframe>
         </td>
      </tr>
   </table>
</body>
</html>