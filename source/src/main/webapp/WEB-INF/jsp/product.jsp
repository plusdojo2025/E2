<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="dto.Product"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品詳細</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/customer.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/product.css">
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
		<div class="product-img">
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
				<button type="button" id="decrease" onclick="changeNum(-1)">-</button>
				<span id="piece">1</span>
				<button type="button" id="increase" onclick="changeNum(1)">+</button>
			</span>
		</div>
		<div class="cart-btn">
			<button type="button" id="addToCart">カートに追加</button>
		</div>
	</div>

	<footer>
		<div class="footer-left">
			<button class="fl">
				<img src="image/iconReturn.png" height="105" alt="戻る">
			</button>
		</div>
		<div class="footer-right">
			<form id="gotoCart"
				action="${pageContext.request.contextPath}/CartServlet" method="get">
				<input type="hidden" name="cart" id="cartParam" value="" />
				<button type="button" id="viewCartBtn" class="fr">
					<img src="<c:url value='/image/iconCart.png'/>" height="105"
						alt="カート"><span id="cartCount"
						style="position: absolute; top: 0.2vw; right: 0.5vw; color: red; font-size: 4vw; font-weight: bold;"></span>
				</button>
			</form>
		</div>
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

	    (function(){
	      const pieceElem = document.getElementById('piece');
	      const btnDec    = document.getElementById('decrease');
	      const btnInc    = document.getElementById('increase');
	      const btnAdd    = document.getElementById('addToCart');
	      const productId = ${product.productId};
	      const maxCount  = 10;
	      const minCount  = 0;

	      btnAdd.addEventListener('click', () => {
	        const qty = parseInt(pieceElem.textContent, 10);
	        if (qty <= 0) {
	          alert('数量を1以上にしてください');
	          return;
	        }

	        //カート情報をローカルストレージから取得
	        const cartKey = 'cart';
	        let cart = {};
	        try {
	          cart = JSON.parse(localStorage.getItem(cartKey)) || {};
	        } catch (e) {
	          cart = {};
	        }

	        //同じ商品があれば数量を加算、なければ新規設定
	        if (cart[productId]) {
	          cart[productId] += qty;
	        } else {
	          cart[productId] = qty;
	        }

	        //localStorage に保存
	        localStorage.setItem(cartKey, JSON.stringify(cart));

	        window.location.href = '${pageContext.request.contextPath}/MenuServlet';
	      });
	    })();
	    
	    document.addEventListener('DOMContentLoaded', () => {
	        //カート情報を取得（{ productId: quantity, … } のオブジェクト）
	        let cart = {};
	        try {
	          cart = JSON.parse(localStorage.getItem('cart')) || {};
	        } catch (_) {
	          cart = {};
	        }

	        //合計数を計算
	        let totalCount = 0;
	        for (let key in cart) {
	          totalCount += Number(cart[key]) || 0;
	        }

	        //バッジ要素に反映
	        const badge = document.getElementById('cartCount');
	        if (totalCount > 0) {
	          badge.textContent = totalCount;
	        } else {
	          //0のときは非表示にしたい場合
	          badge.style.display = 'none';
	        }
	      });
	    
		  document.getElementById('viewCartBtn').addEventListener('click', () => {
			  // localStorage から cart JSON を取得
			  let cart = localStorage.getItem('cart') || '{}';
			  // hidden input にセット
			  document.getElementById('cartParam').value = cart;
			  // フォーム送信
			  document.getElementById('gotoCart').submit();
			});
	</script>
</body>
</html>