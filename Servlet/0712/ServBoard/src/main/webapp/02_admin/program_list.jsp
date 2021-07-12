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
</head>
<body>
	<div id="wrap">
		<div id="search">
			<input type="text" name="" id="" class="txt"/>
			<input type="button" value="조회" class="btn"/>
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
			</div>
		</div>
	</div>
</body>
</html>