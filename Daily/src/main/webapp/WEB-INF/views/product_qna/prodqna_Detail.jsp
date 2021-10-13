<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Detail</title>
</head>
<link rel="stylesheet" type="text/css" href="resources/Lib/mainhome.css">
<link rel="stylesheet" type="text/css"
	href="resources/Lib/servicecenter.css">
<script src="resources/Lib/jquery-3.6.0.min.js"></script>
<script src="resources/Lib/jq_headerfixed.js"></script>
<script src="resources/Lib/prodqna/prodqna_ajax.js"></script>

<body>

		<!-- list -->
		<table>

			<tr height="40">
				<td bgcolor="SkyBlue">번호</td>
				<td>${pqnaDetail.prodqnanum}</td>
			</tr>
			<tr height="40">
				<td bgcolor="SkyBlue">상품명</td>
				<td>${pqnaDetail.product}</td>
			</tr>
			<tr height="40">
				<td bgcolor="SkyBlue">아이디</td>
				<td>${pqnaDetail.id}</td>
			</tr>
			<tr height="40">
				<td bgcolor="SkyBlue">제목</td>
				<td>${pqnaDetail.title}</td>
			</tr>
			<tr height="40">
				<td bgcolor="SkyBlue">내용</td>
				<td><textarea rows="10" cols="40" readonly>${pqnaDetail.content}</textarea></td>
			</tr>
			
			<tr height="40">
				<td bgcolor="SkyBlue">등록일</td>
				<td>${pqnaDetail.date}</td>
			</tr>
			<tr height="40">
				<td bgcolor="SkyBlue">공개여부</td>
				<c:if test="${pqnaDetail.secret eq 1}">
					<td>공개 글</td>
				</c:if>
				<c:if test="${pqnaDetail.secret eq 2}">
					<td>비공개 글</td>
				</c:if>
			</tr>
		</table>
	<div>
		<br>
		<hr>

		<c:if test="${loginInfo !=null}">
			<div class="list_item">
				<c:if test="${loginInfo==pqna_detail.id || Lv == '5' }">
						<a href="#resultArea" onclick=" pqnaupdatef('${pqnaUpdate.prodqnanum}')"></a>

					<a href="replyf?root=${pqnaDetail.root}&step=${pqnaDetail.step}">답글등록</a>&nbsp;
						<div id=""></div>
				</c:if>
				<a href="qnalist">돌아가기</a>&nbsp;
			</div>
		</c:if>

		<c:if test="${message!=null}">
			<hr>
			<div style="background-color: #dbffff;">${message}</div>
		</c:if>

	</div>

</body>

</html>