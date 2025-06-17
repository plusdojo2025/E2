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
		<div class="header-left">
			<input type="submit" name="moveMenu" value="MENU" class="mb">
		</div>
		<div class="header-center">
			<p>○○店</p>
		</div>
		<div class="header-right"></div>
	</header>

	<main class="main">
		<div class="product-infomation">
			<span><img src="" alt="商品画像"></span> <span
				class="cart-product-display">商品名</span>
		</div>
		<!--<a id="minus" class="number-control">-</a>
<input type="number" id="number" value="1" max="99" min="1"/>
<a id="plus" class="number-control">+</a>-->
		<div class="price">
			<!--  -->
			<button type="button" name="button" class="btn-minus">
				<img src="">
			</button>
			<span>1</span>
			<button type="button" name="button" class="btn-plus">
				<img src="">
			</button>
			<span>商品価格</span>
		</div>
		<br>

		<div class="product-infomation">
			<span><img src="" alt="商品画像"></span> <span
				class="cart-product-display">商品名</span>
		</div>
		<div class="price">
			<!--  -->
			<button type="button" name="button" class="btn-minus">
				<img src="">
			</button>
			<span class="number">1</span>
			<button type="button" name="button" class="btn-plus">
				<img src="">
			</button>
			<span>商品価格</span>
		</div>
		<br>

		<div class="sum-price">
			<p>
				合計&emsp;&emsp;&yen;&nbsp;<span class="total-monetary">0000</span>
			</p>
		</div>
		<form>
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
		
	</script>
</body>
</html>