<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/product.css">
</head>
<body>
	<!-- ここからヘッダー -->
	<div class="header">
		<p>共通ヘッダーのところ</p>
	</div>
	<!-- ここまでヘッダー -->

	<!-- ここからメイン -->
	<div class="container">
		<div class="detail">
			<p>商品名</p>
			<p>商品説明</p>
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
	<div class="footer">
		<p>共通フッターのところ
	</div>
	<!-- ここまでフッター -->
</body>
</html>