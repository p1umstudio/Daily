<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>D:aily :: ProductDetail</title>
<link rel="stylesheet" type="text/css" href="resources/Lib/mainhome.css">
<link rel="stylesheet" type="text/css" href="resources/Lib/productForm.css">
</head>
<body>
	<!-- header (로그인 ,마이페이지,위시리스트) -->
	<jsp:include page="/WEB-INF/views/homeLayout/homeheader.jsp"></jsp:include>
	<!-- nav  (메뉴바)-->
	<jsp:include page="/WEB-INF/views/homeLayout/homemenubar.jsp"></jsp:include>
<form action="pdupdate" method="post" enctype="multipart/form-data">
	<table>
	<tr height="40"><td bgcolor="SkyBlue">PN.</td>
		<td><input type="text" name="productnum" value="${Product.productnum}" readonly></td></tr>
	
	<tr height="40"><td bgcolor="SkyBlue">상품명</td>
		<td><input name="name" value="${Product.name}"></td></tr>
	
	<tr height="40"><td bgcolor="SkyBlue">상품상세설명</td>
		<td><textarea name="content" rows="10" cols="30">${Product.content}</textarea></td>
	</tr>
	
	<tr height="40"><td bgcolor="SkyBlue">등록일</td>
		<td><input value="${Product.date}"readonly ></td></tr>	
		
	<tr height="40"><td bgcolor="SkyBlue">상품사진</td>
		<td><img src="${Product.image}" class="select_img">
		<input type="hidden" name="image" value="${Product.image}"><br>
		<input type="file" name="imagef" id="imagef" size="20">
		<script>
         $('#imagef').change(function(){
            if(this.files && this.files[0]) {
               var reader = new FileReader;
                   reader.onload = function(e) {
                   $(".select_img").attr("src", e.target.result)
                      .width(70).height(70); 
                   } // onload_function
                   reader.readAsDataURL(this.files[0]);
             } // if
         }); // change   
         </script>
        </td>
	</tr>	
		
	<tr height="40"><td bgcolor="SkyBlue">가격</td>
		<td><input type="number" name="price2" value="${Product.price2}"></td></tr>
		
	<tr height="40"><td bgcolor="SkyBlue">판매 여부</td>
		<td><input type="radio" name="state" id="state" value="T" checked>판매중 &nbsp;&nbsp;
			<input type="radio" name="state" id="state" value="F">판매중지</td>
	</tr>
	<tr height="40"><td bgcolor="SkyBlue">종류</td>
		<td><select name="kind" id="kind">
						<option value="">종류선택
						<option value='1'>상의
						<option value='2'>하의
						<option value='3'>아우터
						<option value='4'>가방
				</select></td>
	</tr>
	<tr height="40"><td bgcolor="SkyBlue">조회수</td>
		<td><input name="count" value="${Product.count}" readonly></td></tr>
	
	<tr height="40"><td bgcolor="SkyBlue">평점</td>
		<td><input name="score"  value="${Product.score}" readonly></td></tr>
	
	<tr height="40"><td bgcolor="SkyBlue">리뷰</td>
		<td></td></tr>
	<tr height="40"><td bgcolor="SkyBlue">상품qna</td>
		<td></td></tr>	
	
	<tr height="40"><td></td>
		<td><input type="submit" value="수정">&nbsp;&nbsp;
			<input type="reset" value="취소"></td>
		
  </table>
</form>



<!-- footer (고객센터) -->
	<jsp:include page="/WEB-INF/views/homeLayout/homefooter.jsp"></jsp:include>
</body>
</html>