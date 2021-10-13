<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D:aily :: 아이디 찾기</title>
<script src="resources/Lib/jquery-3.6.0.min.js"></script>
<script src="resources/Lib/member/login.js"></script>
<style>
form {
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

img {
	margin-top: 20px;
	margin-bottom: 80px;
}

input {
	width: 300px;
	margin: 10px;
}
</style>
</head>
<body>
	<div>
		<span>아이디 찾기</span><br>
		<td>${findid.name}님의아이디는"${findid.id}"입니다</td>
	</div>
	<br>
	<div>
		<span id="loginform">로그인</span> <span id="findpw">비밀번호 찾기</span>
	</div>
	<br><br>
	<hr>
	<div id="loginmenu">
		<input type="button" value="로그인" class="btn" onclick="location.href='mloginpage'">
		<input type="button" value="회원가입" class="btn" onclick="location.href='msignuppage'">
		<input type="button" value="비밀번호 찾기" class="btn" onclick="location.href='mfindpwpage'">
	</div>
</body>
</html>
		
	