<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header></header>
	<span class="cartProductDisplay">商品名</span>
	<!--<a id="minus" class="number-control">-</a>
<input type="number" id="number" value="1" max="99" min="1"/>
<a id="plus" class="number-control">+</a>-->
 <button type="button" name="button" class="btn-minus">
		<img src="">
	</button>
	<input type="number" min="0" max="99">
	<button type="button" name="button" class="btn-plus">
		<img src="">
	</button> 
	<span>商品価格</span>
	<br>

	<p>
		合計￥ <span class="totalMonetary">0000</span>
	</p>
	<form>
		<input type="submit" value="支払画面へ">
	</form>
	<footer></footer>
</body>
</html>