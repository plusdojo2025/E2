<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品一覧</title>
<link rel="stylesheet" href="css/customer.css" />
<link rel="stylesheet" href="css/menu.css" />
</head>
<body>

	<header>
		<div class="header-left">
			<input type="submit" name="moveMenu" value="MENU" class="mb">
		</div>
		<div class="header-center">
			<p>○○店</p>
		</div>
		<div class="header-right"></div>
	</header>

	<main>
		<div class="menu-container">
			<div class="product">
				<div class="product-picture">
					<img src="image/Logo.png" alt="商品画像">
				</div>
				<div class="product-info">
					<p class="product-name">商品名</p>
					<p>商品説明</p>
					<p class="product-price">値段</p>
				</div>
			</div>
			<div class="product">
				<div class="product-info">
					<p class="product-name">商品名</p>
					<p>商品説明</p>
					<p class="product-price">値段</p>
				</div>
			</div>
			<div class="product">
				<div class="product-picture">
					<img src="image/Logo.png" alt="商品画像">
				</div>
				<div class="product-info">
					<p class="product-name">商品名</p>
					<p>商品説明</p>
					<p class="product-price">値段</p>
				</div>
			</div>
		</div>
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
</body>
</html>