<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<input type="submit" name="moveMenu" value="MENU" class="mb">
	</div>
	<div class="header-center">
		<p>○○店</p>
	</div>
	<div class="header-right">
	</div>
</header>

<div class="container">
	<div class="img">
		<img src="image/azi.png" class="eximage">
	</div>
	<div class="detail">
		<p class="name">商品名</p>
		<p class="box">商品説明:天和、字一色、大四喜、四暗刻単騎</p>
	</div>
	<div class="detail">
		<span class="total">合計金額:<a>100</a>円</span>
		<span class="detail-btn">
			<button onclick="changeNum(-1)">-</button>
			<span id="piece">1</span>
			<button onclick="changeNum(1)">+</button>
		</span>
	</div>
	<div class="cart-btn">
		<input type="button" name="inCart" value="カートに追加">
	</div>
</div>

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
	function changeNum(i){
		var piece = document.getElementById("piece");
		if(i==-1&&piece.innerHTML-0==0||i==1&&piece.innerHTML-0==10){return}
		piece.innerHTML = piece.innerHTML-0 + i;
	}
</script>
</body>
</html>