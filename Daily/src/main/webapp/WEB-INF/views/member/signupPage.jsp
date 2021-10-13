<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D:aily :: 회원가입</title>
<link rel="stylesheet" type="text/css" href="resources/Lib/mainhome.css">
<script src="resources/Lib/jquery-3.6.0.min.js"></script>
<script src="resources/Lib/member/Check.js"></script>
<script>
var id_Check = false;
var pw_Check = false;
var name_Check = false;
var phone_Check = false;

$(function() {
	$('#id').focus();
	$('#id').focusout(function() {
		id_Check = idCheck();
	}); // id_focusout  

	$('#pw').focusout(function() {
		pw_Check = pwCheck();
	}); //password_focusout

	$('#pw2').focusout(function() {
		pw2_Check=pw2Check();
	}); //password_focusout

	$('#name').focusout(function() {
		name_Check = nameCheck();
	}); //name

	$('#phone').focusout(function() {
		phone_Check = phoneCheck();
	}); //phone

}); //ready


function inCheck() {
	// 개별적 오류 확인 : switch 변수
	if (id_Check == false) {
		$('#idMessage').html('아이디를 확인해주세요.');
	}
	if (pw_Check == false) {
		$('#pwMessage').html('비밀번호를 확인해주세요 .');
	}
	if (pw2_Check == false) {
		$('#pw2Message').html('비밀번호를 확인해주세요 .');
	}
	if (name_Check == false) {
		$('#nameMessage').html('이름을 확인해주세요.');
	}
	if (phone_Check == false) {
		$('#phoneMessage').html('핸드폰 번호를 확인해주세요.');
	}
	
	
	if (id_Check && pw_Check && pw2_Check && name_Check && phone_Check) {
		alert('회원 가입이 되었습니다.');
		return true;
	} else
		return false;
} //inCheck


// ID 중복 확인하기
function idDupCheck() {
	if (id_Check == false) {
		id_Check = idCheck();
	} else {
		var url = "idCheck?id=" + $('#id').val();
		window.open(url, "_blank", "toolbar=no,menubar=yes,scrollbars=yes,resizable=yes,width=500,height=400");
	}
} //idDupCheck

</script>
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

	<!-- 회원가입 폼 -->
	<div id="resultArea" class="border">
		<span>Daily : 회원가입</span>
		<form action="msignup" method="post" id="signuppage" enctype="multipart/form-data">
			<table>
				<tr>
					<td>아이디</td>
				<td>
						<input type="text" name="id" id="id" size="10">&nbsp;&nbsp;
						<input type="button" value="ID중복확인" id="idDup" onclick="idDupCheck()">
						<br><span id=idMessage class="eMessage"></span>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>
						<input type="password" name="pw" id="pw" size="10">
						<br><span id=pwMessage class="eMessage"></span>
					</td>
				</tr>
				<tr>
					<td>비밀번호 재확인</td>
					<td>
						<input type="password" id="pw2" size="10">
						<br><span id=pw2Message class="eMessage"></span>
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" name="name" id="name" size="10">
						<br><span id=nameMessage class="eMessage"></span>
					</td>
					
				</tr>
				<tr>
					<td>핸드폰 번호</td>
					<td>
						<input type="text" name="phone" id="phone" size="10">
						<br><span id=phoneMessage class="eMessage"></span>
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<input type="text" name="address" id="address" size="10">
						<br><span id=addressMessage class="eMessage"></span>
					</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td>
						<input type="date" name="birth" id="birth">
						<br><span id="birthMessage" class="eMessage"></span>
					</td>
			</tr>
				<tr>
					<td></td>
					<td><input type="submit" id="submit" value="회원가입" onclick="return inCheck()"
					disabled ></td>
				</tr>
			</table>
		</form>
	</div>



</body>
</html>