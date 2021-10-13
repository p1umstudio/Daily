	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>D:aily :: 마이페이지</title>
	<script src="resources/Lib/jquery-3.6.0.min.js"></script>
	<script src="resources/Lib/member/member.js"></script>
	<style>
	.leftmenu {
		border: 1px solid #000;
	}
	/* .menu { */
	div {
		/* background-color: ; */
		/* border: 1px solid #000; */
		
	}
	
	#content {
		text-align: left;
	}
	
	#leftmenu {
		width: 10%;
		margin-left: 10%;
		float: left;
		background-color: #d5d5d5;
		text-align: center;
		float: left;
	}
	
	#rightmenu {
		width: 20%;
		float: left;
		background-color: blue;
		text-align: center;
	}
	
	#contentArea {
		width: 60%;
		height: 1000px;
		float: left;
		/* background-color: green; */
		background-size: 100% 100%;
		text-align: center;
	}
	</style>
	</head>
	<body>
		<top id="top" />
		<!-- header (로그인 ,마이페이지,위시리스트) -->
		<div>
			<jsp:include page="../homeLayout/homeheader.jsp"></jsp:include>
		</div>
		<div>
			<jsp:include page="../homeLayout/homemenubar.jsp"></jsp:include>
		</div>
	
		<!-- 왼쪽 메뉴  -->
		<div id="leftmenu" class="leftmenu">
			<div>MY PAGE</div>
			<br>
			<div class="myshopping">
				<div>MY 쇼핑</div>
				<div id="orderListPage">
					<a>주문/배송조회</a>
				</div>
				<div>취소/반품/교환/환불 내역</div>
			</div>
			<div class="myactivity">
				<div>MY 활동</div>
				<div id="myreviewpage">
					<a>리뷰관리</a>
				</div>
				<div id="wishlistpage">
					<a>위시리스트</a>
				</div>
			</div>
			<div class="myinfo">
				<div>MY 정보</div>
				<div id="infopage">
					<a>개인정보확인/수정</a>
				</div>
				<div id="info_pwchange_page">
					<a>비밀번호 변경</a>
				</div>
	
			</div>
		</div>
	
		<!-- 주요 내용 -->
		<div id="contentArea"></div>
		<!-- 오른쪽 컨트롤러 -->
		<div id="rightmenu">
			<table id="floating_menu"
				style="position: fixed; top: 45%; right: 3%;">
				<tr>
					<td colspan="2" style="text-align: center">
						<div
							style="border-radius: 15px; border: 1px solid #d7d7d7; padding: 10px;">
							<div>
								<a href="#top">위로 △</a>
							</div>
							<div>
								<a href="home">홈으로</a>
							</div>
							<div>
								<div>장바구니</div>
								<div id="cartArea">여기에 장바구니 table</div>
							</div>
							<div>
								<a href="#bottom">아래로 ▽</a>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
	
		<bottom id="bottom" />
	</body>
	</html>
