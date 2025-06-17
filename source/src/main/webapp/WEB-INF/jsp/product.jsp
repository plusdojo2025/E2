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
	<!-- ここからヘッダー -->
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
	<!-- ここまでヘッダー -->

	<!-- ここからメイン -->
	<div class="container">
		
		<div class="img">
		<img src="image/Logo.png" class="eximage">
		</div>
		
		<div class="detail">
			<p class="name">商品名</p>
			<p class="box">商品説明あああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ</p>
		</div>

		<div class="detail">
			<span class="total">合計金額:<a>100</a>円</span>
		</div>
		<div class="detail-btn">
			<button onclick="decrease()">-</button>
			<span>1</span>
			<button onclick="increase()">+</button>
		</div>
		
		<div class="cart-btn">
			<input type="button" name="inCart" value="カートに追加">
		</div>
	</div>

	<!-- ここまでメイン -->

	<!-- ここからフッター -->
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
	<!-- ここまでフッター -->
</body>
</html>