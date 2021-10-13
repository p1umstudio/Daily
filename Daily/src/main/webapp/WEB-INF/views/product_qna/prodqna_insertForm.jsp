<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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


	<div>

		<form action="pqnaInsert" method="get" id="TCinCheck">
			<table>
				<tr height="40">
					<td bgcolor="Silver">번호</td>
					<td><input type="text" name="prodqnanum" id="prodqnanum" value="${product.prodqnanum}" readonly></td>
				</tr>
				<tr height="40">
					<td bgcolor="Silver">상품명</td>
					<td><input type="text" name="name" id="name" value="${product.name}" readonly></td>
				</tr>
				<tr height="40">
					<td bgcolor="Silver">ID</td>
					<td><input type="text" name="id" id="id" value="${loginInfo}" readonly></td>
				</tr>
				<tr height="40">
					<td bgcolor="Silver">제목</td>
					<td><input type="text" name="title" id="title">
					</td>
				</tr>
				<tr height="40">
					<td bgcolor="Silver">내용</td>
					<td><textarea name="content" id="content" rows="10" cols="40"></textarea>
					</td>
				</tr>
				<tr height="40">
					<td bgcolor="Silver">등록일</td>
					<td><input type="text" name="title" id="title" value="${pqnaInsertForm.date}" readonly>
					</td>
				</tr>

				<tr>
					<td bgcolor="Silver">공개여부</td>
					<td><input type="radio" name="secret" value='1' checked="checked">공개
					<input type="radio" name="secret" value="2">비공개</td>
				</tr>

				<tr height="40">
					<td></td>
					<td><input type="submit" value="전송">&nbsp;&nbsp; <input
						type="reset" value="취소"></td>
				</tr>
			</table>

		</form>
		<hr>
		<div>
			<c:if test="${message!=null}"> 
				<script>${message}</script>
			</c:if>
		</div>
	</div>
	<a href="pqnaList">돌아가기</a>&nbsp;
</body>
</html>