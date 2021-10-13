<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D:aily :: 비밀번호 변경</title>
<script src="resources/Lib/jquery-3.6.0.min.js"></script>
<script src="resources/Lib/member/member.js"></script>
<link rel="stylesheet" type="text/css" href="resources/Lib/mainhome.css">
<script>
</script>

</head>
<body>
	<div>
		<!-- changePW에 필요한 값들 -->
		<input type="hidden" id="id" value="${Info.id}">
		<input type="hidden" id="name" value="${Info.name}"> 
		<input type="hidden" id="phone" value="${Info.phone}"> 
		<!------------------------ -->
		<div>
			<span>비밀번호 변경</span>
		</div>
		<div>
			새로운 비밀번호 : <input type="password" id="pw"><br><br>
			비밀번호 재확인 : <input type="password" id="pw2">
		</div>
		<div id="menu">
			<input type="button" value="비밀번호 변경" class="btn" id='info_pwchange'><br>
		</div>
	</div>
</body>
</html>

