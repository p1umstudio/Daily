<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D:aily :: 로그인</title>
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
<c:if test="${message != null}">
		<script> alert(${message}); </script>
</c:if>

<!-- header (로그인 ,마이페이지,위시리스트) -->
	<div>
		<jsp:include page="../homeLayout/homeheader.jsp"></jsp:include>
	</div>
	<div>
		<jsp:include page="../homeLayout/homemenubar.jsp"></jsp:include>
	</div>

<!-- 로그인 부분 -->
	<div id="resultArea" class="border">
		<form action="mlogin" method="post" id="form">
			<h1>로그인</h1>
			<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요."><br>
			<input type="password" name="pw" id="pw" placeholder="비밀번호를 입력해주세요."><br>
			<br>
			<hr>
			<div id="loginmenu">
				<input type="submit" value="로그인" class="btn"><br>
				<input type="button" value="회원가입" class="btn" onclick="location.href='msignuppage'">
				<input type="button" value="아이디/비밀번호 찾기" class="btn" onclick="location.href='mfindidpage'">

			</div>
		</form>
	</div>
	
	
</body>
</html>