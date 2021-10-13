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
	
	  <form class="" action="" method="get">
    <div class="container">
      <div class="row">
        <div class="col-md-3 me-5 border border-primary">
          <div class="text-center fs-1">
           상품명  ${~}
          </div>
          <div class="row">
            <input type="file" name="imagef" id="imagef">
          </div>
        </div>

        <div class="col align-self-center">

          <div class="row fs-4 pb-3">
            아이디 :
          </div>

          <div class="row fs-6 pb-3">
            댓글 : <textarea name="name" rows="8" cols="80"></textarea>
          </div>

          <div class="row ">
            <select class="form-select" aria-label="Default select example">
              <option value="1">⭐ 1점</option>
              <option value="2">⭐⭐ 2점</option>
              <option value="3">⭐⭐⭐ 3점</option>
              <option value="4">⭐⭐⭐⭐ 4점</option>
              <option value="5" selected>⭐⭐⭐⭐⭐ 5점</option>
            </select>
          </div>
        </div>
      </div>
      <div class="text-end my-4">
        <input type="submit" name="" value="등록">
        <input type="reset" name="" value="리셋">
      </div>
    </div>
  </form>

	
		

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>
</body>

</html>
