<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D:aily :: Cart List</title>
<script src="resources/Lib/jquery-3.6.0.min.js"></script>
<script src="resources/Lib/jq_cart.js"></script>
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

	<!--  장바구니 리스트 -->
	<hr>
	<c:choose>
	  <c:when test="${map.count == 0}">
	  		<div align="center"><h2> 장바구니가 비어있습니다.</h2>
	  		<a href="pdlist"><button type="button" class="btn btn-primary">상품 보기</button></a>
	  		</div>
	  </c:when>
	  <c:otherwise>
			<form>
				<table>
					<tr align="center">
						<th>CN</th>
						<th> </th>
						<th>상품명</th>
						<th>상품금액</th>
						<th>수량</th>
						<th>총금액</th>
						<th>취소</th>
					</tr>
					<c:forEach var="row" items="${map.list}" varStatus="vs">
					 <tr align="center">
					 	<td id="cartnum${vs.index}">${row.cartnum}</td>
					 	<td><img src="${row.image}" width="100px" height="100px"></td>
					 	<td>${row.pname}</td>
					 	<td><span>₩</span>
							<fmt:formatNumber value="${row.price2}" pattern="#,###,###,###" />
					 	</td>
					 	<td><input type="number" name="quantity" id="quantity${vs.index}" value="${row.quantity}" min="1">
					 		<button onclick="btnUpdate(${vs.index})">수정</button>
							<input type="hidden" name="productnum" id="productnum" value="${row.productnum}">
					 	</td>
					 	<td><span>₩</span>
							<fmt:formatNumber value="${row.money}" pattern="#,###,###,###" />
					 	</td>
					 	<td>
					 	    <a href="deleteCart?cartnum=${row.cartnum}">삭제</a>
					 	</td>
					 </tr>
					</c:forEach>
					<tr>
						<td colspan="6" align="right">장바구니 금액 합계:
						<fmt:formatNumber value="${map.sumMoney}"
                            pattern="#,###,###" />
						</td>					
					</tr>
				</table>
				<hr>
				<div align="right"><input type="hidden" name="count" value="${map.count}">
           	    <button type="button" id="btnDelete">장바구니 비우기</button>
           	    <button type="submit" id="btnOrder" >모든 상품 주문하기</button>
           	   <a href="pdlist"><button type="button">상품 보기</button></a></div>
			</form>
	  </c:otherwise>
	</c:choose>

	<jsp:include page="/WEB-INF/views/homeLayout/homefooter.jsp"></jsp:include>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>

</body>
</html>