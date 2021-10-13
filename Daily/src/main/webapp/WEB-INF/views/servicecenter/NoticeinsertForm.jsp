<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<link rel="stylesheet" type="text/css" href="resources/Lib/mainhome.css">
<link rel="stylesheet" type="text/css"
	href="resources/Lib/servicecenter.css">
<script src="resources/Lib/jquery-3.6.0.min.js"></script>
<script src="resources/Lib/jq_headerfixed.js"></script>
<script src="resources/Lib/servicecenter/serviceincheck.js"></script>
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


		<form action="ntcinsert" method="get" id="TCinCheck">
			<table>
				<tr height="40">
					<td bgcolor="Silver">ID</td>
					<td><input type="text" name="id" value="${loginInfo}" readonly></td>
				</tr>
				<tr height="40">
					<td bgcolor="Silver">제목</td>
					<td><input type="text" name="title" id="title"></td>
				</tr>
				<tr height="40">
					<td bgcolor="Silver">내용</td>
					<td><textarea name="content" id="content" rows="10" cols="40"></textarea></td>
				</tr>

				<tr height="40">
					<td></td>
					<td><input type="submit" value="전송">&nbsp;&nbsp; <input
						type="reset" value="취소"></td>
				</tr>
			</table>

		</form>
	</div>
		<hr>
		<div style="background-color: #dbffff;">
			<c:if test="${message!=null}">
				${message}
			</c:if>
		</div>

	<a href="ntclist">돌아가기</a>&nbsp;
	<div>
		<jsp:include page="../homeLayout/homefooter.jsp"></jsp:include>
	</div>
</body>
</html>