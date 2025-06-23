<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/cart.css">
<link rel="stylesheet" href="css/customer.css">
</head>

<body>

	<header>
		<img src="image/crepe.png">
		<div class="header-left">
			<form action="${pageContext.request.contextPath}/MenuServlet"
				method="get">
				<input type="submit" name="moveMenu" value="MENU" class="mb">
			</form>
		</div>
		<div class="header-center">
			<p>○○店</p>
		</div>
		<div class="header-right"></div>
	</header>

	<main class="main">
		<div class="product-infomation">
			<span><img src="image/Logo.png" alt="商品画像" class="product-img"
				align="top"></span> <span class="cart-product-display">商品名</span>

		</div>

		<div id="btn-wrapper">
			<div class="detail-btn">
				<button onclick="changeNum(-1)">-</button>
				<span id="piece">1</span>
				<button onclick="changeNum(1)">+</button>
				<span class="product-sum">商品価格</span>
			</div>
		</div>
		<br>

		<div class="product-infomation">
			<span><img src="image/Logo.png" alt="商品画像" class="product-img"
				align="top"></span> <span class="cart-product-display">商品名</span>
		</div>

		<div id="btn-wrapper">
			<div class="detail-btn">
				<button onclick="changeNum(-1)">-</button>
				<span id="piece">1</span>
				<button onclick="changeNum(1)">+</button>
				<span class="product-sum">商品価格</span>
			</div>
		</div>
		<br>

		<div class="sum-price">
			<p>
				合計&emsp;&emsp;&yen;&nbsp;<span class="total-monetary">0000</span>
			</p>
		</div>
		<form action="${pageContext.request.contextPath}/HandedServlet"
			method="post">
			<div class="pay-ment">
				<a><input type="submit" value="支払画面へ"></a>
			</div>
		</form>
	</main>

	<footer>
		<div class="footer-left">
			<button class="fl">
				<img src="image/iconReturn.png" height="105" alt="戻る">
			</button>
		</div>
		<div class="footer-right">
			<button class="fr">
				<img src="image/iconCart.png" height="105" alt="カート">
			</button>
		</div>
	</footer>

	<script>
		'use strict'
	</script>
</body>
</html>