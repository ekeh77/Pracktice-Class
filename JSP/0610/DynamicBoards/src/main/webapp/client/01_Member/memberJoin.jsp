<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ��������</title>
	<link rel="stylesheet" href="../Css/member.css">
	<script src="../JS/mem.js"></script>
</head>
<body>
 <body>
<body onload="init();">
	<div id="wrap">
		<form name="memberForm" id="memberForm" action="./memberJoin_ok.jsp">
			
			<!--���̵� -->
			<!-- ���̵� -->
			<div class="line">
				<span class="row1">���̵�</span>
				<span class="row2">				
					<span class="col1">
						<input type="text" name="userID" id="userID" class="textbox1"
						 onblur="chkValue('userID','idMsg');"/>
					</span>
					<span class="col2">
						@naver.com
					</span>				
				</span>
				<span id="idMsg" class="msg"></span>
			</div>

			<div class="line">
				<span class="row1">��й�ȣ</span>
				<span class="row2">
					<input type="text" name="userPass" id="userPass" class="textbox1"
					style="width:396px;"
					onblur="chkValue('userPass','passMsg');chkPass();"
					/>
				</span>
				<span id="passMsg" class="msg"></span>
			</div>

			<div class="line">
			
				<span class="row1">��й�ȣȮ��</span>
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
				<span class="row1">�̸�</span>
				<span class="row2">
					<input type="text" name="userName" id="userName" class="textbox1"
					style="width:396px;"/>
				</span>
				<span id="nameMsg" class="msg"></span>
			</div>
			
			
			<div class="line">
				<span class="row1">�������</span>
				<span id="userBirth">
					<span class="row2" >
						<input type="text" name="userYear" id="userYear" class="textbox1"
						style="width:120px;" placeholder="��(4��)"/>
					</span>
					<span class="empty"></span>
					<span class="row2" >
						<select id="userMonth" name="userMonth">
							<option value="">��</option>
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
						style="width:120px;" placeholder="��"/>
					</span>
				</span>
				<span id="birthMsg" class="msg"></span>
			</div>

			<div class="line" id="">
				<span class="row1">����</span>
				<span class="row2">
					<label>
						<input type="radio" id="userGender1" name="userGender" value="M" class="gender"/> <span class="rtxt">����</span>
					</label>
					<label>
						<input type="radio" id="userGender2" name="userGender" value="F" class="gender"/> <span class="rtxt">����</span>
					</label>
					<label>
						<input type="radio" id="userGender3" name="userGender" value="E" class="gender"/> <span class="rtxt">���þ���</span>
					</label>
					
				</span>
				<span id="passMsg" class="msg"></span>
			</div>

			<div class="line" id="">
				<span class="row1">���ɻ�</span>
				<span class="row2">
					<label>
						<input type="checkbox" id="userIntr1" name="userIntr" value="M" class="intr"/> <span class="rtxt">��</span>
					</label>
					<label>
						<input type="checkbox" id="userIntr2" name="userIntr" value="F" class="intr"/> <span class="rtxt">��</span>
					</label>
					<label>
						<input type="checkbox" id="userIntr3" name="userIntr" value="E" class="intr"/> <span class="rtxt">�ڵ�</span>
					</label>
					
				</span>
				<span id="passMsg" class="msg"></span>
			</div>
			
			<div class="line">
				<span class="row1"></span>
				<span class="row2">
					<select id="selectIntr" name="selectIntr" class="selectIntr">
						<option>�����ϼ���</option>
					</select>
				</span>
				<span id="nameMsg" class="msg"></span>
			</div>
		
			
			<div style="height:30px;"></div>

			<div class="line">
				<span class="row1">�޴���ȭ</span>
				<span class="row2" style="width:250px; float:left;">
					<input type="text" name="userPhone" id="userPhone" class="textbox1" style="width:245px;"/>
				</span>
				<a href="#" class="btn">
					������ȣ �ޱ�
				</a>
				<span id="nameMsg" class="msg"></span>
			</div>

			<div class="empty" style="clear:both;"></div>

			<div style="clear:both;" class="line">
				
				<btn href="#" class="btn" style="width:400px;" onclick="memberOK()">
					�����ϱ�
				</btn>
				
			</div>
		</form>
	</div>
 </body>
</body>
</html>