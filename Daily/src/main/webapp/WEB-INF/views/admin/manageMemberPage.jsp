<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D:aily :: 위시리스트</title>
<script src="resources/Lib/jquery-3.6.0.min.js"></script>
<script src="resources/Lib/member/member.js"></script>
<link rel="stylesheet" type="text/css" href="resources/Lib/mainhome.css">
<style>
.wishlisttable {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

.wishlisttable th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
}
</style>
</head>
<body>
	<!-- header (로그인 ,마이페이지,위시리스트) -->
	<jsp:include page="/WEB-INF/views/homeLayout/homeheader.jsp"></jsp:include>
	<!-- nav  (메뉴바)-->
	<jsp:include page="/WEB-INF/views/homeLayout/homemenubar.jsp"></jsp:include>
	<!-- content -->
	<hr>
	<form>
		<table class="wishlisttable">
			<tr align="center">
				<th>아이디</th>
				<th>이름</th>
				<th>핸드폰번호</th>
				<th>주소</th>
				<th>생일</th>
				<th>활동상태</th>
				<th></th>
			</tr>
			<c:forEach var="list" items="${memberList}" varStatus="status">
				<tr align="center">
					<td>${list.id}</td>
					<td>${list.name}</td>
					<td>${list.phone}</td>
					<td>${list.address}</td>
					<td>${list.birth}</td>
					<td>${list.state}
						<c:if test="${list.state=='T'}">
							활동계정
						</c:if>
						<c:if test="${list.state!='T'}">
							비활동계정
						</c:if>
					</td>
					<td><input type="button" id="${list.id}" class="wishdeleteBtn" value="활동 전환"></td>
				</tr>
			</c:forEach>
		</table>
		<hr>
	</form>


</body>
</html>

