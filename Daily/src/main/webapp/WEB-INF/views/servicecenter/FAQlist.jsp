<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
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
			</tr>
			<c:forEach var="list" items="${Faqlist}" varStatus="status">
				<tr>
					<td>${list.faqnum}</td>
					<td><c:out value="${list.id}"></c:out></td>
					<td><a href="faqdetail?faqnum=${list.faqnum}&id=${list.id}">${list.title}</a></td>
					<td>${list.date}</td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<hr>

		<c:if test="${loginInfo!=null && Lv == '5'}">
			<div class="list_item">
				<a href="faqinsertf">FAQ 글쓰기</a>
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