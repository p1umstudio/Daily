<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D:aily :: Product List</title>
<script src="resources/Lib/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="resources/Lib/mainhome.css">
<link rel="stylesheet" type="text/css" href="resources/Lib/productForm.css">
</head>
<body>

	<!-- header (로그인 ,마이페이지,위시리스트) -->

	<jsp:include page="/WEB-INF/views/homeLayout/homeheader.jsp"></jsp:include>

	<!-- nav  (메뉴바)-->
	<jsp:include page="/WEB-INF/views/homeLayout/homemenubar.jsp"></jsp:include>
	<!-- product main content(필터,메인상품,등등) -->

	<!--  상품등록 -->
	<div class="container">
		<div class="row">
			<c:if test="${loginInfo!=null && Lv == 5}">
				<div class="col-md-4 offset-sm-9">
					<button type="button" class="btn btn-primary"><a href="/productRegist">상품 등록</a></button>
				</div>
			</c:if>
		</div>
	</div>

	<div class="container">
		<div class="row-md text-center" style="float:none; margin:0 auto">
			<!-- list section  -->
			<div class="col" style="float:none; margin:0 auto">
				<div class="container my-5 content2">
					<div class=" product_titlebar">
						<div class="product_title">Perfume</div>
						<div class="product_title_item">더보기</div>
					</div>
					<br>

					<div class="row  text-center" style="float:none; margin:0 auto">

						<!-- 여기 div forEach -->
						<c:forEach var="list" items="${Product}">
							<div class="col-md-3" >
								<div class="row">
									<a href="pddetail?productnum=${list.productnum}&pname=${list.pname}">
										<img src="${list.image}" width="100%" height="100%">
									</a>

								</div>
								<div class="product_name">
									<a href="pddetail?productnum=${list.productnum}&pname=${list.pname}">
										${list.pname} </a>
								</div>
								<div class="product_price">
									<span>₩</span>
									<fmt:formatNumber value="${list.price2}"
										pattern="#,###,###,###" />
								</div>
								<div class="product_review">리뷰평점 :${list.score}</div>
							</div>
						</c:forEach>

					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/homeLayout/homefooter.jsp"></jsp:include>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>

</body>
</html>