<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D:aily :: 개인정보확인/수정</title>
<script src="resources/Lib/jquery-3.6.0.min.js"></script>
<script src="resources/Lib/member/member.js"></script>
<script src="resources/Lib/member/Check.js"></script>
<script>
var phone_Check = false;

$(function() {
	$('#phone').focusout(function() {
		phone_Check = phoneCheck();
	}); 
}); 

function Check() {
	if (phone_Check == false) {
		$('#phoneMessage').html('핸드폰 번호를 확인해주세요.');
	}
	if (phone_Check) {
		alert('수정되었습니다.');
		return true;
	} else
		return false;
} //Check

</script>
</head>
<body>
	<div>
		<table>
			<tr height="40">
				<td>아이디</td>
				<td>
					<span>${Info.id }</span>
					<input type="hidden" id="id" value="${Info.id}">
				</td>
			</tr>
			<tr height="40">
				<td>이름</td>
				<td>
					<span>${Info.name }</span>
					<input type="hidden" id="name" value="${Info.name}" >
				</td>
			</tr>
			<tr height="40">
				<td>연락 가능 번호</td>
				<td>
					<input type="text" id="phone" value="${Info.phone}">
					<br><span id=phoneMessage class="eMessage"></span>
				</td>
			</tr>
			<tr height="40">
				<td>배송지</td>
				<td>
					<input type="text" id="address" value="${Info.address}">
				</td>
			</tr>
		</table>
	</div>
	<div id="menu">
		<input type="button" value="개인정보 변경" class="btn" id='info_change' onclick="return Check()"><br>
	</div>
</body>
</html>