<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="dto.Product"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/product.css">
<link rel="stylesheet" type="text/css" href="css/customer.css">
</head>
<body>

	<header>
		<div class="header-left">
			<form action="${pageContext.request.contextPath}/MenuServlet"
				method="get">
				<input type="submit" name="moveMenu" value="MENU" class="mb">
			</form>
		</div>
		<div class="header-center">
			<p>
				<img src="image/logo3.png" class="img">
			</p>
		</div>
		<div class="header-right"></div>
	</header>

	<div class="container">
		<div class="product_img">
			<img
				src="${pageContext.request.contextPath}/image/${product.imageUrl}"
				class="eximage" alt="${product.productName}">
		</div>
		<div class="detail">
			<p class="name">${product.productName}</p>
			<p class="box">${product.productDetail}</p>
		</div>
		<div class="detail">
			<span class="total"> 合計金額:<a id="price">${product.price}</a>円
			</span> <span class="detail-btn">
				<button onclick="changeNum(-1)">-</button> <span id="piece">1</span>
				<button onclick="changeNum(1)">+</button>
			</span>
		</div>
		<form class="cart-btn"
			action="${pageContext.request.contextPath}/MenuServlet" method="post">
			<input type="submit" name="inCart" value="カートに追加">
		</form>
	</div>

	<footer>
		<div class="footer-left">
			<button class="fl">
				<img src="image/iconReturn.png" height="105" alt="戻る">
			</button>
		</div>
		<form class="footer-right"
			action="${pageContext.request.contextPath}/CartServlet" method="post">
			<button class="fr" type="submit">
				<img src="image/iconCart.png" height="105" alt="カート">
			</button>
		</form>
	</footer>

	<script>
		const price = document.getElementById("price").innerHTML - 0;
		function changeNum(i) {
			var piece = document.getElementById("piece").innerHTML - 0;
			if (i == -1 && piece == 0 || i == 1 && piece == 10) {
				return
			}
			document.getElementById("piece").innerHTML = piece + i;
			document.getElementById("price").innerHTML = price * (piece + i);
		}
	</script>
</body>
</html>