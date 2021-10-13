<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D:aily :: 아이디 찾기</title>
<script src="resources/Lib/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="resources/Lib/mainhome.css">
<style>
</style>
</head>
<body>
	<!-- 아이디 찾기 결과 form -->
	<div id="resultArea" class="border">
		<form action="changepw" method="post" id="form">
			<h1>비밀번호 변경</h1>
	<br>${vo.id}님 <br>
			<input type="hidden" name="id" id="id" value="${vo.id}">
			<input type="hidden" name="name" id="name" value="${vo.name}">
			<input type="hidden" name="phone" id="phone" value="${vo.phone}">
			<input type="password" name="pw" id="pw" placeholder="바꿀 비밀번호를 입력해주세요."><br>
			<br>
		<hr>
		<div id="loginmenu">
			<input type="submit" value="비밀번호 변경" class="btn"><br>
			<input type="button" value="회원가입" class="btn" onclick="location.href='msignuppage'">
			<input type="button" value="비밀번호 찾기" class="btn" onclick="location.href='mfindpwpage'">
		</div>
		</form>
	</div>
	
</body>
</html>

