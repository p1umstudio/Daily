<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nav</title>
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="resources/Lib/mainhome.css">
</head>
<body>
	<!--nav 메뉴바 (cloth,perfume, Best, new item, sale) -->
	<div class="nav">
		<div class="nav_center_item">
			<div class="nav_item group">
				<a class="dropdown nav_item"> Best </a> <br> <br>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item"
						href="poslist?costsearch=n&kindsearch=k1&scoresearch=5">Best Shirt</a></li>
					<li><a class="dropdown-item"
						href="poslist?costsearch=n&kindsearch=k2&scoresearch=5">Best Pants</a></li>
					<li><a class="dropdown-item"
						href="poslist?costsearch=n&kindsearch=k3&scoresearch=5">Best Outer</a></li>
				</ul>
			</div>
			
			<div class="nav_item group">
				<a class="dropdown nav_item" href="pdlist"> Cloth </a> <br> <br>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item"
						href="poslist?costsearch=n&kindsearch=k1&scoresearch=n">Shirt</a></li>
					<li><a class="dropdown-item"
						href="poslist?costsearch=n&kindsearch=k2&scoresearch=n">Pants</a></li>
					<li><a class="dropdown-item"
						href="poslist?costsearch=n&kindsearch=k3&scoresearch=n">Outer</a></li>
				</ul>
			</div>

			<div class="nav_item group">
				<a class="dropdown nav_item"> Perfume </a> <br> <br>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="pdregistf">Menu item</a></li>
					<li><a class="dropdown-item"
						href="poslist?costsearch=n&kindsearch=k5&scoresearch=n">Women Perfume</a></li>
					<li><a class="dropdown-item"
						href="poslist?costsearch=n&kindsearch=k5&scoresearch=n">Men Perfume</a></li>
				</ul>
			</div>

			<div class="nav_item group">
				<a class="dropdown nav_item"> New Item </a> <br> <br>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="#">Menu item</a></li>
					<li><a class="dropdown-item" href="#">Menu item</a></li>
					<li><a class="dropdown-item" href="#">Menu item</a></li>
				</ul>
			</div>

			<div class="nav_item group">
				<a class="dropdown nav_item text-danger">Sales</a><br><br>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="#">Menu item</a></li>
					<li><a class="dropdown-item" href="#">Menu item</a></li>
					<li><a class="dropdown-item" href="#">Menu item</a></li>
				</ul>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>

</body>
</html>