<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="kr">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU"
	crossorigin="anonymous">

<title>Product details</title>
</head>

<body>
	<br>
	<br>

		<div class="container">
			<div class="row">
				<div class="col-md-3 me-5">
					<div class="text-center fs-1">상품명 ${~}</div>
					<div class="row">
						<img src="testimg.png" alt="">
					</div>
				</div>

				<div class="col align-self-center">

					<div class="row fs-4 pb-3">아이디 : ${~}</div>

					<div class="row fs-6 pb-3">댓글 : ${~}</div>

					<div class="row ">
						별점
					</div>
				</div>
			</div>
		</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>
</body>

</html>
