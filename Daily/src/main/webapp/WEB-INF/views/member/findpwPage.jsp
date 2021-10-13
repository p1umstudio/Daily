<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D:aily :: 비밀번호 변경</title>
<script src="resources/Lib/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/Lib/mainhome.css">
<style>
#form {
	text-align: center;
	margin: 0 auto;
}

.border {
	margin: 0 auto;
	width: 400px;
	height: 500px;
	border: 1px solid #000;
	border-radius: 10%;
}

.btn {
	width: 300px;
	margin: 10px;
}
</style>
</head>
<body>
	<!-- header (로그인 ,마이페이지,위시리스트) -->
	<div>
		<jsp:include page="../homeLayout/homeheader.jsp"></jsp:include>
	</div>
	<div>
		<jsp:include page="../homeLayout/homemenubar.jsp"></jsp:include>
	</div>
	<!-- 비밀번호 변경 -->
	<div id="resultArea" class="border">
		<form action="mfindpwcheck" method="post">
			<table>
				<span>비밀번호 찾기/변경</span>
				<tr>
					<td><input type="text" name="id" id="id" placeholder="아이디"></td>
				</tr>
				<tr>
					<td><input type="text" name="name" id="name"
						placeholder="가입자 성명"></td>
				</tr>
				<tr>
					<td><input type="text" name="phone" id="phone"
						placeholder="000-0000-0000"></td>
			</table>
			<hr>
			<div id="loginmenu">
				<input type="submit" value="비밀번호 변경" class="btn">
				<input type="button" value="로그인" class="btn" onclick="location.href='mloginpage'">
				<input type="button" value="회원가입" class="btn" onclick="location.href='msignuppage'">
			</div>

		</form>
	</div>
</body>
</html>