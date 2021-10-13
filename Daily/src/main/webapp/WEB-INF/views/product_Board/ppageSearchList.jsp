<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D:aily :: Product List</title>
<link rel="stylesheet" type="text/css" href="resources/Lib/mainhome.css">
<link rel="stylesheet" type="text/css"
	href="resources/Lib/servicecenter.css">
<script src="resources/Lib/jquery-3.6.0.min.js"></script>
<script src="resources/Lib/jq_headerfixed.js"></script>
</head>
<script>
	$(function() {
		$('#costsearch').change(function() {
			if ($(this).val() == 'n')
				$('#keyword').val('');
		}); //change

		$('#kindsearch').change(function() {
			if ($(this).val() == 'n')
				$('#keyword').val('');
		}); //change

		$('#scoresearch').change(function() {
			if ($(this).val() == 'n')
				$('#keyword').val('');
		}); //change

		$("#opsearchBtn").on(
				"click",
				function() {
					self.location = "poslist" + "${pageMaker.makeQuery(1)}"
							+ "&costsearch=" + $('#costsearch').val()
							+ "&kindsearch=" + $('#kindsearch').val()
							+ "&scoresearch=" + $('#scoresearch').val()
		});
		
		$("#keyopsearchBtn").on(
				"click",
				function() {
					self.location = "pkplist" + "${pageMaker.makeQuery(1)}"
							+ "&costsearch=" + $('#costsearch').val()
							+ "&kindsearch=" + $('#kindsearch').val()
							+ "&scoresearch=" + $('#scoresearch').val()
							+ "&keyword=" + $('#keyword').val()
		});
	})// ready
</script>
<body>

	<!-- header (로그인 ,마이페이지,위시리스트) -->

	<jsp:include page="/WEB-INF/views/homeLayout/homeheader.jsp"></jsp:include>

	<!-- nav  (메뉴바)-->
	<jsp:include page="/WEB-INF/views/homeLayout/homemenubar.jsp"></jsp:include>
	<!-- product main content(필터,메인상품,등등) -->

	<!--  상품등록 -->
	<div class="container">
		<div class="row">
			<c:if test="${loginInfo !=null && Lv == '5'}">
				<div class="list_item">
					<a href="/productRegist">상품 등록</a>
				</div>
			</c:if>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<!-- filter side  -->
			<div class="col-lg-3 my-3">
				<div class="container border border-primary"
					style="text-align: center;">


					<div class="row" id="searchBar">
						<p></p>
						<p><b>가격대</b></p>
						<select class="form-select form-select"
							aria-label=".form-select-lg example" name="costsearch"
							id="costsearch">
							<option value="n"
								<c:out value="${pageMaker.spage.costsearch==null ? 'selected':''}"/>>가격대를
								선택하세요
							<option>
							<option value="c1"
								<c:out value="${pageMaker.spage.costsearch=='c1' ? 'selected':''}"/>>10,000원
								~ 30,000원</option>
							<option value="c2"
								<c:out value="${pageMaker.spage.costsearch=='c2' ? 'selected':''}"/>>30,000원
								~ 40,000원</option>
							<option value="c3"
								<c:out value="${pageMaker.spage.costsearch=='c3' ? 'selected':''}"/>>40,000원
								~ 50,000원</option>
							<option value="c4"
								<c:out value="${pageMaker.spage.costsearch=='c4' ? 'selected':''}"/>>50,000원
								~ 이상</option>
						</select> <br> <br>

						<p></p>
						<p><b>종류</b></p>
						<select class="form-select form-select"
							aria-label=".form-select-lg example" name="kindsearch"
							id="kindsearch">
							<option value="n"
								<c:out value="${pageMaker.spage.kindsearch==null ? 'selected':''}"/>>종류를
								선택하세요</option>
							<option value="k1"
								<c:out value="${pageMaker.spage.kindsearch=='k1' ? 'selected':''}"/>>상의</option>
							<option value="k2"
								<c:out value="${pageMaker.spage.kindsearch=='k2' ? 'selected':''}"/>>하의</option>
							<option value="k3"
								<c:out value="${pageMaker.spage.kindsearch=='k3' ? 'selected':''}"/>>아우터</option>
							<option value="k4"
								<c:out value="${pageMaker.spage.kindsearch=='k4' ? 'selected':''}"/>>가방</option>
							<option value="k5"
								<c:out value="${pageMaker.spage.kindsearch=='k5' ? 'selected':''}"/>>향수</option>
						</select> <br> <br>

						<p></p>
						<p><b>평점</b></p>
						<select class="form-select form-select"
							aria-label=".form-select-lg example" name="scoresearch"
							id="scoresearch">
							<option value="n"
								<c:out value="${pageMaker.spage.scoresearch==null ? 'selected':''}"/>>평점대를
								선택하세요</option>
							<option value="s1"
								<c:out value="${pageMaker.spage.scoresearch=='s1' ? 'selected':''}"/>>1점</option>
							<option value="s2"
								<c:out value="${pageMaker.spage.scoresearch=='s2' ? 'selected':''}"/>>2점</option>
							<option value="s3"
								<c:out value="${pageMaker.spage.scoresearch=='s3' ? 'selected':''}"/>>3점</option>
							<option value="s4"
								<c:out value="${pageMaker.spage.scoresearch=='s4' ? 'selected':''}"/>>4점</option>
							<option value="s5"
								<c:out value="${pageMaker.spage.scoresearch=='s5' ? 'selected':''}"/>>5점</option>
						</select>

						<div class="col my-3">
							<c:if test="${keyword == null}">
								<button id="opsearchBtn" class="btn btn-primary">검색</button>
							</c:if>
							<c:if test="${keyword != null}">
								<button id="keyopsearchBtn" class="btn btn-primary">검색</button>
							</c:if>
						</div>

					</div>

				</div>
			</div>

			<!-- list section  -->
			<div class="col-sm my-3">
				<div class="container my-5 content2">
					<br>
					<div class="row align-items-center">
						<!-- 여기 div forEach -->
						<c:forEach var="list" items="${spList}">
							<div class="col-sm">
								<div class="row">
									<a
										href="pddetail?productnum=${list.productnum}&pname=${list.pname}">
										<img src="${list.image}" id="product_img1" width="100%"
										height="100%">
									</a>

								</div>
								<div class="product_name">
									<a
										href="pddetail?productnum=${list.productnum}&pname=${list.pname}">
										${list.pname} </a>
								</div>
								<div class="product_price">
									<span>$</span>
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

	<!-- paging -->

	<div align="center">
		<c:if test="${keyword == null}">
		<!-- 1)  First << ,  Prev <  처리 -->
		<c:if test="${pageMaker.prev && pageMaker.spageNo>1}">
			<a href="poslist${pageMaker.searchQuery(1)}" class="FF">FF</a>&nbsp;
		<a href="poslist${pageMaker.searchQuery(pageMaker.spageNo-1)}"
				class="Prev">Prev</a>
		</c:if>

		<!-- 2) sPageNo ~ ePageNo 까지, displayPageNo 만큼 표시 -->
		<c:forEach var="i" begin="${pageMaker.spageNo}"
			end="${pageMaker.epageNo}">
			<c:if test="${i==pageMaker.spage.currPage}">
				<font size="5" color="Orange">${i}</font>&nbsp;
		</c:if>
			<c:if test="${i!=pageMaker.spage.currPage}">
				<a href="poslist${pageMaker.searchQuery(i)}" class="i_page">${i}</a>&nbsp;
		</c:if>
		</c:forEach>
		&nbsp;
		<!-- 3) Next >  ,  Last >>  처리 -->
		<c:if test="${pageMaker.next && pageMaker.epageNo>0}">
			<a href="poslist${pageMaker.searchQuery(pageMaker.epageNo+1)}"
				id="Next" class="Next">Next</a>&nbsp;
		<a href="poslist${pageMaker.searchQuery(pageMaker.lastPageNo)}"
				id="LL" class="LL">LL</a>&nbsp;&nbsp;
		</c:if>
	</c:if>
	<c:if test="${keyword !=null}">
	<!-- 1)  First << ,  Prev <  처리 -->
		<c:if test="${pageMaker.prev && pageMaker.spageNo>1}">
			<a href="pkplist${pageMaker.searchQuery(1)}" class="FF">FF</a>&nbsp;
		<a href="pkplist${pageMaker.searchQuery(pageMaker.spageNo-1)}"
				class="Prev">Prev</a>
		</c:if>

		<!-- 2) sPageNo ~ ePageNo 까지, displayPageNo 만큼 표시 -->
		<c:forEach var="i" begin="${pageMaker.spageNo}"
			end="${pageMaker.epageNo}">
			<c:if test="${i==pageMaker.spage.currPage}">
				<font size="5" color="Orange">${i}</font>&nbsp;
		</c:if>
			<c:if test="${i!=pageMaker.spage.currPage}">
				<a href="pkplist${pageMaker.searchQuery(i)}" class="i_page">${i}</a>&nbsp;
		</c:if>
		</c:forEach>
		&nbsp;
		<!-- 3) Next >  ,  Last >>  처리 -->
		<c:if test="${pageMaker.next && pageMaker.epageNo>0}">
			<a href="pkplist${pageMaker.searchQuery(pageMaker.epageNo+1)}"
				id="Next" class="Next">Next</a>&nbsp;
		<a href="pkplist${pageMaker.searchQuery(pageMaker.lastPageNo)}"
				id="LL" class="LL">LL</a>&nbsp;&nbsp;
		</c:if>
	
	</c:if>
	</div>

	<jsp:include page="/WEB-INF/views/homeLayout/homefooter.jsp"></jsp:include>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>
</body>
</html>