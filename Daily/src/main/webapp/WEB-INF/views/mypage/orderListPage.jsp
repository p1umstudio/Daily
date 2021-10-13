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
	<!-- list -->
	<hr>

	<c:choose>
		<c:when test="${complete == 'F'}">
			<h2>리뷰가 없습니다. 리뷰를 남겨주세요!</h2>
		</c:when>
		<c:otherwise>
			<form>
				<table class="wishlisttable">
					<tr align="center">
						<th>상품이미지</th>
						<th>상품명</th>
						<th>댓글내용</th>
						<th>날짜</th>
						<th></th>
					</tr>
					<c:forEach var="list" items="${myreview}" varStatus="status">
						<tr align="center">
							<td><img src="${list.image}" width="100px" height="100px"></td>
							<td>${list.pname}</td>
							<td>${list.content}</td>
							<td>${list.date}</td>
							<td><input type="button" id="${list.reviewnum}" class="deleteBtn" value="삭제"></td>
						</tr>
					</c:forEach>
				</table>
				<hr>
			</form>
		</c:otherwise>


	</c:choose>
<%-- 
	<table>
		<c:forEach var="list" items="${wishlist}" varStatus="status">
			<div>
				상품명 : ${list.pname} &nbsp;&nbsp; <input type="button"
					id="${list.wlnum}" class="deleteBtn" value="삭제">
			</div>
			<hr>
		</c:forEach>
	</table>
 --%>
</body>
</html>

