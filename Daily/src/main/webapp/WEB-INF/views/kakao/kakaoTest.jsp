<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매장 위치</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=823225c9f117d22aaa31fc6556d5bca7"></script>
<script>
	
</script>
<style>
#mapArea {
	display: flex;
	justify-content: center;
}
</style>
</head>
<body>
	<!-- header (로그인 ,마이페이지,위시리스트) -->
	<div>
		<jsp:include page="../homeLayout/homeheader.jsp"></jsp:include>
	</div>
	<div>
		<jsp:include page="../homeLayout/homemenubar.jsp"></jsp:include>
	</div>
	<br>
	<div id="mapArea">
		<div id="map" style="width: 500px; height: 400px;"></div>
	</div>
	<Br>
	<div class="foter_info">
		greenComputerDaily<br> 경기도 성남시 분당구 구미동 7-2 5층 그린컴퓨터아카데미
	</div>

	<script>
		//37.34977961187868, 127.10683780465047

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.34977961187868,
					127.10683780465047), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 마커가 표시될 위치 
		var markerPosition = new kakao.maps.LatLng(37.34977961187868,
				127.10683780465047);

		// 마커\ 생성
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정
		marker.setMap(map);

		var iwContent = '<div style="padding:5px;">매장 : D:aily  <br><a href="https://map.kakao.com/link/map/D:aily 찾아오시는 길!,37.34977961187868, 127.10683780465047" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/D:aily 찾아오시는 길!,37.34977961187868, 127.10683780465047" style="color:blue" target="_blank">길찾기</a></div>', iwPosition = new kakao.maps.LatLng(
				37.34977961187868, 127.10683780465047); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성
		var infowindow = new kakao.maps.InfoWindow({
			position : iwPosition,
			content : iwContent
		});

		infowindow.open(map, marker);
	</script>
	<!-- footer (고객센터,배송 및 반품,FAQ,법적고지,개인정보처리방침,일반 판매 조건 ) -->
	<div>
		<jsp:include page="../homeLayout/homefooter.jsp"></jsp:include>
	</div>
</body>
</html>