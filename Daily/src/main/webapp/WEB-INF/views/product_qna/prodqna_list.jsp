<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product_qna list</title>
</head>
<link rel="stylesheet" type="text/css" href="resources/Lib/mainhome.css">
<link rel="stylesheet" type="text/css"
	href="resources/Lib/servicecenter.css">
<script src="resources/Lib/jquery-3.6.0.min.js"></script>
<script src="resources/Lib/jq_headerfixed.js"></script>
<script src="resources/Lib/prodqna/prodqna_ajax.js"></script>

<body>

	<!-- list -->
	<div class="container">
		<div class="row">
			<div class="col">
				<table>
					<tr>
						<th>번호</th>
						<th>아이디</th>
						<th>제목</th>
						<th>등록일</th>
						<th hidden="hidden">공개여부</th>
					</tr>


					<c:forEach var="list" items="${pqList}" >

						<tr>
							<td>${list.prodqnanum}</td>
							<td><c:out value="${list.id}"></c:out></td>


							<!-- 로그인시에만 글을 볼수 있도록 -->
							<c:if test="${loginInfo!=null}">
								<td>
									<!-- 답글 계층도 x --> <c:if test="${list.step>0}">
										<c:forEach begin="1" end="${list.step}">
											<span>&nbsp;&nbsp;</span>
											<span style="color: Purple">re..</span>
										</c:forEach>
									</c:if> <c:choose>
										<c:when test="${list.secret eq 1}">
											<a href="#resultArea"
												onclick="pqnaDetail('${list.prodqnanum}')">${list.title}</a>
											<a></a>
										</c:when>
										<c:when
											test="${ list.secret eq 2 && list.id == loginInfo || Lv == '5'}">
											<a href="#resultArea"
												onclick="pqnaDetail('${list.prodqnanum}')">비밀글입니다.</a>

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
									<td><a href="#">${list.title}</a></td>
								</c:if>

								<c:if test="${list.secret eq 2}">
									<td>비밀글 입니다.</td>
								</c:if>
							</c:if>

							<td>${list.date}</td>
							<td hidden="hidden">${list.secret}</td>

							<td><c:if test="${loginInfo!=null}">
								</c:if></td>
							<c:if test="${list.id == loginInfo || Lv == '5'}">

							</c:if>
						</tr>
					</c:forEach>
				</table>
				<br>
				<hr>


				<br> <br> <br>
				<div class="col nohide">
					<c:if test="${loginInfo!=null}">
						<div id="insertArea" class="list_item"></div>
					</c:if>
				</div>
			</div>


		</div>
	</div>



	<!-- paging -->
	<div></div>



</body>

</html>