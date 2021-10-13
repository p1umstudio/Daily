<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정하기</title>
</head>
<link rel="stylesheet" type="text/css" href="resources/Lib/mainhome.css">
<link rel="stylesheet" type="text/css"
	href="resources/Lib/servicecenter.css">
<script src="resources/Lib/jquery-3.6.0.min.js"></script>
<script src="resources/Lib/jq_headerfixed.js"></script>
<script src="resources/Lib/servicecenter/serviceincheck.js"></script>
<body>
	<!-- header (로그인 ,마이페이지,위시리스트) -->
	<div>
		<jsp:include page="../homeLayout/homeheader.jsp"></jsp:include>
	</div>
	<div>
		<jsp:include page="../homeLayout/homemenubar.jsp"></jsp:include>
	</div>
	<div>

		<!-- 고객센터 메뉴바 ,안내 -->
		<jsp:include page="../servicecenter/Layout/Servicecenterheader.jsp"></jsp:include>

		<!-- list -->
		<form action="qnaupdate" method="get" id="TCinCheck">
		<table>

			<tr height="40">
				<td bgcolor="SkyBlue">번호</td>
				<td><input type="text" name="qnanum" value="${Qnadetail.qnanum}" readonly></td>
			</tr>
			<tr height="40">
				<td bgcolor="SkyBlue">아이디</td>
				<td>${Qnadetail.id}</td>
			</tr>
			<tr height="40">
				<td bgcolor="SkyBlue">제목</td>
				<td><input type="text" name="title" id="title" value="${Qnadetail.title}"></td>
			</tr>
			<tr height="40">		
				<td bgcolor="SkyBlue">내용</td>
				<td><textarea rows="10" cols="40" name="content" id="content" >${Qnadetail.content}</textarea></td>
			</tr>
			<tr height="40">
				<td bgcolor="SkyBlue">등록일</td>
				<td>${Qnadetail.date}</td>
			</tr>
			<tr height="40">
				<td bgcolor="SkyBlue">공개여부</td>
				<td><input type="radio" name="secret" value='1' checked="checked">공개</td>
				<td><input type="radio" name="secret" value="2">비공개</td>
			</tr>
			<tr height="40">
				<td></td>
				<td>&nbsp;<input type="submit" value="전송">&nbsp;&nbsp;
					&nbsp;<input type="reset" value="취소">
				</td>
			</tr>
		</table>
		</form>
		
		<br>
		<hr>

		<c:if test="${loginInfo!=null}">
			<div class="list_item">
			<c:if test="${loginInfo==Qnadetail.id || Lv == '5'}">
				<a href="qnadelete?qnanum=${Qnadetail.qnanum}">글삭제</a>
			</c:if>
				<a href="qnalist">돌아가기</a>&nbsp;
			</div>
		</c:if>

		<c:if test="${message!=null}">
			<hr>
			<div style="background-color:#dbffff;">${message}</div>
		</c:if>

	</div>

	<!-- footer (고객센터,배송 및 반품,FAQ,법적고지,개인정보처리방침,일반 판매 조건 ) -->
	<div>
		<jsp:include page="../homeLayout/homefooter.jsp"></jsp:include>
	</div>
</body>

</html>