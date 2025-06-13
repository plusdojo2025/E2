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
	<p>商品名</p>
	<input type="text" name="productExplain">


	<br>

	<p>合計金額</p>

	<br>

	<div>
		<button onclick="decrease()">-</button>
		<span>1</span>
		<button onclick="increase()">+</button>
	</div>

	<br>
	<input type="button" name="inCart" value="カートに追加">

	<!-- ここまでメイン -->
	
	<!-- ここからフッター -->
	<div class="footer">
	<p>共通フッターのところ
	</div>
	<!-- ここまでフッター -->
</body>
</html>