<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D:aily :: 아이디 찾기</title>
<script src="resources/Lib/jquery-3.6.0.min.js"></script>
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


	<!-- 아이디 찾기 -->
	<div id="resultArea" class="border">
		<form action="mfindid" method="post" id="form">
			<h1>아이디 찾기</h1>
			<input type="text" name="name" id="name" placeholder="이름을 입력해주세요."><br>
			<input type="text" name="phone" id="phone" placeholder="핸드폰번호를 입력해주세요."><br> <br>
			<hr>
			<div id="loginmenu">
				<input type="submit" value="아이디 찾기" class="btn"><br>
				<input type="button" value="회원가입" class="btn" onclick="location.href='msignuppage'">
				<input type="button" value="비밀번호 찾기" class="btn" onclick="location.href='mfindpwpage'">
			</div>
		</form>
	</div>
</body>
</html>