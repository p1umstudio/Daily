<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D:aily</title>
</head>
<link rel="stylesheet" type="text/css" href="resources/myLib/mainhome.css">
<script src="resources/myLib/jquery-3.6.0.min.js"></script>
<script src="resources/myLib/jq_headerfixed.js"></script>
<body>
  <!--서비스 바 (고객센터 매장위치) -->
  <div class="servicebar">
    <div class="servicebar_left_item">
      <div class="service_item">고객센터</div>
      <div class="service_item"><a href="kakaotest">매장위치</a></div>
    </div>
  </div>
  <!--헤더 (타이틀로고 로그인 ) -->
  <div class="header">
    <!--헤더Left (검색박스 search_box) -->
    <div class="header_left_item">
      <div>
        <input type="text" name="search" class="search_box" placeholder="상품을 검색해보세요">
      </div>
      <!--헤더Left (검색 버튼 search_button) -->
      <div class="button_left">
        <div>
          <input type="button" class="search_button">
        </div>
      </div>

    </div>
    <!--헤더center (타이틀로고 ) -->
    <div class="header_logo">
      D:aily
    </div>
    <!--헤더right (로그인 마이페이지 위시리스트 ) -->
    <div class="header_right_item">
      <div class="header_item"><a href="">로그인</a></div>
      <div class="header_item"><a href="">마이페이지</a></div>
      <div class="header_item"><a href="">위시리스트</a></div>
    </div>

    <!--nav 메뉴바 (cloth,perfume, Best, new item, sale) -->
  </div>
  <div class="nav">
    <div class="nav_center_item">
      <div class="nav_item"><a href="pdlist">Cloth</a></div>
      <div class="nav_item"><a href="">Perfume</a></div>
      <div class="nav_item"><a href="">Best</a></div>
      <div class="nav_item"><a href="">New Item</a></div>
      <div class="nav_item"><a href="">Sales</a></div>
    </div>
  </div>
  <br>
  <!--main 공간지정 -->
  <div class="main">
    <!--컨텐트 공간지정 -->
    <div class="content">
      <!--이미지 공간지정 -->
      <div class="img_box1">
        <img src="resources/img/young-woman-4266712_1920.jpg" id="main_img">
      </div>
      <!--부제목 공간지정 -->
      <div class="img_content_subtitle">
        cloth
      </div>
      <!--제목 공간지정 -->
      <div class="img_content_title">
        2021-2022 가을 컬렉션
      </div>
      <!--쇼핑버튼 공간지정 -->
      <div class="img_shopping">
        <button type="button" id="img_shopping1" name="button">
		<a href="">쇼핑하기</a>
        </button>
      </div>
    </div>

    <!--상품 간단 목록 리스트  공간지정 -->
    <div class="product">
      <div class="product_titlebar">
        <div class="product_title">
          Perfume
        </div>
        <div class="product_title_item">
          더보기
        </div>
      </div>
      <br>

      <div class="product_center_item">
        <div class="product_item_box">
          <div class="product_img_box">
            <img src="resources/img/black-1984277_1280.jpg" id="product_img1">
          </div>

          <div class="product_name">상품명 1</div>
          <div class="product_price">가격</div>
          <div class="product_review">리뷰 수</div>

        </div>
        <div class="product_item_box">
          <div class="product_img_box">
            <img src="resources/img/calvin-klein-5325443_1280.jpg" id="product_img2">
          </div>

          <div class="product_name">상품 2</div>
          <div class="product_price">가격</div>
          <div class="product_review">리뷰 수</div>
        </div>

        <div class="product_item_box">
          <div class="product_img_box">
            <img src="resources/img/essential-oil-3073901_1920.jpg" id="product_img3">
          </div>

          <div class="product_name">상품 3</div>
          <div class="product_price">가격</div>
          <div class="product_review">리뷰 수</div>
        </div>

        <div class="product_item_box">
          <div class="product_img_box">
            <img src="resources/img/mens-perfume-394683_1280.jpg" id="product_img4">
          </div>
          <div class="product_name">상품 4</div>
          <div class="product_price">가격</div>
          <div class="product_review">리뷰 수</div>
        </div>
      </div>
    </div>

    <br>

    <div class="content2">
      <div class="img_box2">
        <img src="resources/img/suit-690048_1280.jpg" id="main_img2">
      </div>
      <div class="img_content_subtitle">
        Best
      </div>
      <div class="img_content_title">
        2021-2022 Suit 컬렉션
      </div>
      <div class="img_shopping">
        <button type="button" id="img_shopping2" name="button">
         <a href="">쇼핑하기</a>
        </button>
      </div>
    </div>

    <div class="content3">
      <!--이미지 공간지정 -->
      <div class="img_box3_list">
        <div class="img_box3">
          <img src="resources/img/man-1866574_1280.jpg" id="main_img">
        </div>


      </div>
      <!--부제목 공간지정 -->
      <div class="img_content_subtitle">
        cloth
      </div>
      <!--제목 공간지정 -->
      <div class="img_content_title">
        2021-2022 가을 컬렉션
      </div>
      <!--쇼핑버튼 공간지정 -->
      <div class="img_shopping">
        <button type="button" id="img_shopping3" name="button">
           <a href="">쇼핑하기</a>
        </button>
      </div>
    </div>


  </div>

  <div style="background-color:black;">
    <div class="adventage">
      <div class="adventage_content">
        <div class="adventage_title">
          온라인 부띠끄 서비스
        </div>
        <div class="adventage_list">
          <div class="adventage_item">
            <img src="resources/img/adventimg1.png">
            <br><br>
            무료 배송 <br><br>

            디올은 모든 주문 건에 대해 <br>
            무료 배송 서비스를 제공합니다.
          </div>

          <div class="adventage_item">
            <img src="resources/img/adventimg2.png">
            <br><br>
            선물 포장<br><br>
            고객님의 기프트는<br>
            아이코닉 디올 박스에 담겨<br>
            작성하신 개인 메시지와<br>
            함께 배송됩니다.<br>
            내부 정책으로 인하여<br>
            패키지 구성이 변경되어<br>
            더 이상 쇼핑백이<br>
            제공되지 않습니다.<br>
            (2020년 11월 2일 출고 분부터 적용)<br>
          </div>

          <div class="adventage_item">
            <img src="resources/img/adventimg3.png"><br><br>
            7일 이내 무료 반품<br><br>
            제품 수령 후 7일 이내에<br>
            무료 반품이 가능합니다.<br><br>

            *환불기간<br><br>
            반품 날짜 도착일로부터<br>
            영업일 기준 3일 이내 진행<br><br>

            *반품 접수<br><br>
            고객 서비스 센터로 문의<br>
            02 - 3480 - 0104<br>
          </div>
        </div>
      </div>
    </div>
  </div>
  <hr>
  <div class="footer">
    <div class="footer_content">
      고객센터
    </div>
    <div class="footer_content">
      배송 및 반품
    </div>
    <div class="footer_content">
      FAQ
    </div>
    <div class="footer_content">
      법적고지
    </div>
    <div class="footer_content">
      개인정보처리방침
    </div>
    <div class="footer_content">
      일반 판매 조건
    </div>
    <hr>
    <div class="foter_info">
      Daily주식회사 | 경기도 성남시 분당구 구미동 7-2 5층 그린컴퓨터아카데미 |<br>
      사업자등록번호: 123-45-6789
      <br>
      COPYRIGHT © CHRISTIAN Daily COUTURE KOREA ALL RIGHTS RESERVED.
    </div>
  </div>
</body>

</html>