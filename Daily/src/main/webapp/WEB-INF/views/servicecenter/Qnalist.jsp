<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Servicecenter</title>
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
	<div>

		<!-- 고객센터 메뉴바 ,안내 -->
		<jsp:include page="../servicecenter/Layout/Servicecenterheader.jsp"></jsp:include>

	
	
		<!-- list -->
		<table>


			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>제목</th>
				<th>등록일</th>
				<th hidden="hidden">공개여부</th>
			</tr>


			<c:forEach var="list" items="${Qnalist}" varStatus="status">

				<tr>
					<td>${list.qnanum}</td>
					<td><c:out value="${list.id}"></c:out></td>


					<!-- 로그인시에만 글을 볼수 있도록 -->
					<c:if test="${loginInfo!=null}">
					<td>
					<!-- 답글 계층도 x -->
						<c:if test="${list.step>0}">
							<c:forEach begin="1" end="${list.step}">
								<span>&nbsp;&nbsp;</span>
								<span style="color: Purple">re..</span>
							</c:forEach>
						</c:if>
						
						<c:choose>
							<c:when test="${list.secret eq 1}">
								<a href="qnadetail?qnanum=${list.qnanum}&id=${list.id}">${list.title}</a>
							</c:when>
							<c:when
								test="${ list.secret eq 2 && list.id == loginInfo || Lv == '5'}">
								<a href="qnadetail?qnanum=${list.qnanum}&id=${list.id}">비밀글
										입니다.</a>
							</c:when>
							<c:when test="${list.secret eq 2}"> 
								비밀글 입니다.
							</c:when>
						</c:choose>
						</td>
					</c:if>
					<!-- 비 로그인시 -->
					<c:if test="${loginInfo==null}">
						<c:if test="${list.secret eq 1}">
							<td><a href="qnadetail?qnanum=${list.qnanum}&id=${list.id}">${list.title}</a></td>
						</c:if>

						<c:if test="${list.secret eq 2}">
							<td>비밀글 입니다.</td>
						</c:if>
					</c:if>

					<td>${list.date}</td>
					<td hidden="hidden">${list.secret}</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<hr>

		<c:if test="${loginInfo!=null}">
			<div class="list_item">
				<a href="qnainsertf">문의글 쓰기</a>
			</div>

		</c:if>

		<!-- paging -->
		<div></div>


	</div>
	<!--main  -->
	<!-- footer (고객센터,배송 및 반품,FAQ,법적고지,개인정보처리방침,일반 판매 조건 ) -->
	<div>
		<jsp:include page="../homeLayout/homefooter.jsp"></jsp:include>
	</div>
</body>

</html>