<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			<form action="${pageContext.request.contextPath}/MenuServlet"
				method="get">
				<input type="submit" name="moveMenu" value="MENU" class="mb">
			</form>
		</div>
		<div class="header-center">
			<p>
				<img src="image/logo3.png" class="img" alt="Logo">
			</p>
		</div>
		<div class="header-right"></div>
	</header>

	<main>
		<div class="menu-container" id="menuArea">
			<c:forEach var="prod" items="${products}">
				<div class="product" data-product-id="${prod.productId}"
					onclick="location.href='${pageContext.request.contextPath}/ProductServlet?productId=${prod.productId}'">
					<div class="product-picture">
						<img
							src="${pageContext.request.contextPath}/image/${prod.imageUrl}"
							alt="${prod.productName}" />
					</div>
					<div class="product-info">
						<p class="product-name">${prod.productName}</p>
						<p class="product-detail">${prod.productDetail}</p>
						<p class="product-price">${prod.price}円</p>
					</div>
				</div>
			</c:forEach>
		</div>
	</main>

	<footer>
		<div class="footer-left">
			<button class="fl" onclick="history.back();">
				<img src="image/iconReturn.png" height="105" alt="戻る">
			</button>
		</div>
		<div class="footer-right">
			<button class="fr" id="cartBtn" style="position: relative;">
				<img src="${pageContext.request.contextPath}/image/iconCart.png"
					height="105" alt="カート"> <span id="cartCount"
					style="position: absolute; top: 0.2vw; right: 0.5vw; color: red; font-size: 4vw; font-weight: bold;"></span>
			</button>
		</div>
	</footer>
	<script>
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
  
  const cartBtn = document.getElementById("cartBtn");
  cartBtn.addEventListener('click', () => {
  	window.location.href = '${pageContext.request.contextPath}/CartServlet';
  })
</script>
</body>
</html>