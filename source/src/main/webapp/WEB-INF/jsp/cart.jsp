<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/cart.css">
</head>
<body>
	<main class="main">
		<header></header>
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
	<footer> 仮置き </footer>
	<script>
		
	</script>
</body>
</html>