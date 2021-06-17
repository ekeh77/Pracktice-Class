<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입폼</title>
	<link rel="stylesheet" href="../Css/member.css">
	<script src="../JS/mem.js"></script>
	<script>
	
		var httpRequest = null;
		
		function getHttpRequest(){
			
			//내장객체
			httpRequest = new XMLHttpRequest();
			
		}

		function chkID(){
			
			var userID = document.getElementById("userID").value;
			//백에서 데이터베이스에 연결해서 아이디가 중복되는지 확인
			getHttpRequest();
			
			httpRequest.onreadystatechange = a;
			httpRequest.open("GET","./ajax/chkID.jsp?userID=" + userID,true);//POST 보내는양이 많을 때 GET 보내는 양이 적을 때//true는 비동기 false는 동기
			httpRequest.send(null); //POST방식일 때 파라미터를 보낼 때 사용
					
		}
		
		function a(){ 
			//서버로부터 응답이 왔으므로 알맞은 작업을 수행 
			if (httpRequest.readyState == 4) //정상적으로 갔다옴
			{ 
				if (httpRequest.status == 200) //성공
				{
					//alert(httpRequest.responseText)
					var datas = httpRequest.responseXML;
					
					var resultTag = datas.getElementsByTagName("result");
					
					var result = resultTag[0].childNodes[0].nodeValue;
					
					if(result == "Y"){
						//중복이다
						document.getElementById("idMsg").innerHTML = "아이디가 중복이다";
					}
					else{
						//중복아니다
						document.getElementById("idMsg").innerHTML = "사용가능한 아이디입니다";
					}
					
				} 
				else { alert("실패: "+httpRequest.status); } 
			}

		}
		
	</script>
</head>
<body>
 <body>
<body onload="init();">
	<div id="wrap">
		<form name="memberForm" id="memberForm" action="./memberJoin_ok.jsp">
			
			<!--아이디 -->
			<!-- 아이디 -->
			<div class="line">
				<span class="row1">아이디</span>
				<span class="row2">				
					<span class="col1">
						<input type="text" name="userID" id="userID" class="textbox1"
						 onblur="chkValue('userID','idMsg');" onkeyup="chkID();"/>
					</span>
					<span class="col2">
						@naver.com
					</span>				
				</span>
				<span id="idMsg" class="msg"></span>
			</div>

			<div class="line">
				<span class="row1">비밀번호</span>
				<span class="row2">
					<input type="text" name="userPass" id="userPass" class="textbox1"
					style="width:396px;"
					onblur="chkValue('userPass','passMsg');chkPass();"
					/>
				</span>
				<span id="passMsg" class="msg"></span>
			</div>

			<div class="line">
			
				<span class="row1">비밀번호확인</span>
				<span class="row2">
					<input type="text" name="userPass_Re" id="userPass_Re" class="textbox1"
					style="width:396px;"
					onblur="chkValue('userPass_Re','passMsg_Re');chkPass();"
					/>
				</span>
				<span id="passMsg_Re" class="msg"></span>
			</div>

			<div style="height:30px;"></div>

			<div class="line">
				<span class="row1">이름</span>
				<span class="row2">
					<input type="text" name="userName" id="userName" class="textbox1"
					style="width:396px;"/>
				</span>
				<span id="nameMsg" class="msg"></span>
			</div>
			
			
			<div class="line">
				<span class="row1">생년월일</span>
				<span id="userBirth">
					<span class="row2" >
						<input type="text" name="userYear" id="userYear" class="textbox1"
						style="width:120px;" placeholder="년(4자)"/>
					</span>
					<span class="empty"></span>
					<span class="row2" >
						<select id="userMonth" name="userMonth">
							<option value="">월</option>
							<%
								String strHTML ="";
								for(int i=1;i<=12;i++){
									
									strHTML += "<option value='" + i + "'>" + i + "</option>";
									
								}
							%>
							
							<%=strHTML %>
						</select>
					</span>
					<span class="empty"></span>
					<span class="row2" >
						<input type="text" name="userDay" id="userDay" class="textbox1"
						style="width:120px;" placeholder="일"/>
					</span>
				</span>
				<span id="birthMsg" class="msg"></span>
			</div>

			<div class="line" id="">
				<span class="row1">성별</span>
				<span class="row2">
					<label>
						<input type="radio" id="userGender1" name="userGender" value="M" class="gender"/> <span class="rtxt">남자</span>
					</label>
					<label>
						<input type="radio" id="userGender2" name="userGender" value="F" class="gender"/> <span class="rtxt">여자</span>
					</label>
					<label>
						<input type="radio" id="userGender3" name="userGender" value="E" class="gender"/> <span class="rtxt">선택안함</span>
					</label>
					
				</span>
				<span id="passMsg" class="msg"></span>
			</div>

			<div class="line" id="">
				<span class="row1">관심사</span>
				<span class="row2">
					<label>
						<input type="checkbox" id="userIntr1" name="userIntr" value="M" class="intr"/> <span class="rtxt">돈</span>
					</label>
					<label>
						<input type="checkbox" id="userIntr2" name="userIntr" value="F" class="intr"/> <span class="rtxt">명예</span>
					</label>
					<label>
						<input type="checkbox" id="userIntr3" name="userIntr" value="E" class="intr"/> <span class="rtxt">코딩</span>
					</label>
					
				</span>
				<span id="passMsg" class="msg"></span>
			</div>
			
			<div class="line">
				<span class="row1"></span>
				<span class="row2">
					<select id="selectIntr" name="selectIntr" class="selectIntr">
						<option>선택하세요</option>
					</select>
				</span>
				<span id="nameMsg" class="msg"></span>
			</div>
		
			
			<div style="height:30px;"></div>

			<div class="line">
				<span class="row1">휴대전화</span>
				<span class="row2" style="width:250px; float:left;">
					<input type="text" name="userPhone" id="userPhone" class="textbox1" style="width:245px;"/>
				</span>
				<a href="#" class="btn">
					인증번호 받기
				</a>
				<span id="nameMsg" class="msg"></span>
			</div>

			<div class="empty" style="clear:both;"></div>

			<div style="clear:both;" class="line">
				
				<btn href="#" class="btn" style="width:400px;" onclick="memberOK()">
					가입하기
				</btn>
				
			</div>
		</form>
	</div>
 </body>
</body>
</html>