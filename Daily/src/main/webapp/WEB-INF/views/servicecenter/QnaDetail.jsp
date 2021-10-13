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

<body>
	<!-- header (로그인 ,마이페이지,위시리스트) -->
	<div>
		<jsp:include page="../homeLayout/homeheader.jsp"></jsp:include>
	</div>
	<div>
		<jsp:include page="../homeLayout/homemenubar.jsp"></jsp:include>
	</div>
	<jsp:include page="../servicecenter/Layout/Servicecenterheader.jsp"></jsp:include>

	<div class="tablebox">

		<!-- 고객센터 메뉴바 ,안내 -->

		<!-- list -->
		<table>

			<tr height="40">
				<td bgcolor="SkyBlue">번호</td>
				<td>${Qnadetail.qnanum}</td>
			</tr>
			<tr height="40">
				<td bgcolor="SkyBlue">아이디</td>
				<td>${Qnadetail.id}</td>
			</tr>
			<tr height="40">
				<td bgcolor="SkyBlue">제목</td>
				<td>${Qnadetail.title}</td>
			</tr>
			<tr height="40">
				<td bgcolor="SkyBlue">내용</td>
				<td><textarea rows="10" cols="40" readonly>${Qnadetail.content}</textarea></td>
			</tr>
			
			<tr height="40">
				<td bgcolor="SkyBlue">등록일</td>
				<td>${Qnadetail.date}</td>
			</tr>
			<tr height="40">
				<td bgcolor="SkyBlue">공개여부</td>
				<c:if test="${Qnadetail.secret eq 1}">
					<td>공개 글</td>
				</c:if>
				<c:if test="${Qnadetail.secret eq 2}">
					<td>비공개 글</td>
				</c:if>
			</tr>
		</table>
	</div>
	<div>
		<br>
		<hr>

		<c:if test="${loginInfo !=null}">
			<div class="list_item">
				<c:if test="${loginInfo==Qnadetail.id || Lv == '5' }">
					<a href="qnadetail?qnanum=${Qnadetail.qnanum}&jcode=Update">문의글
						수정</a>
					<a href="qnadelete?qnanum=${Qnadetail.qnanum}">글삭제</a>

					<a href="replyf?root=${Qnadetail.root}&step=${Qnadetail.step}">답글등록</a>&nbsp;
				</c:if>
				<a href="qnalist">돌아가기</a>&nbsp;
			</div>
		</c:if>

		<c:if test="${message!=null}">
			<hr>
			<div style="background-color: #dbffff;">${message}</div>
		</c:if>

	</div>

	<!-- footer (고객센터,배송 및 반품,FAQ,법적고지,개인정보처리방침,일반 판매 조건 ) -->
	<div>
		<jsp:include page="../homeLayout/homefooter.jsp"></jsp:include>
	</div>
</body>

</html>