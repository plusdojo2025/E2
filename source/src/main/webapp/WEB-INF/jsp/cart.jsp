<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>カート</title>
<link rel="stylesheet" href="<c:url value='/css/customer.css' />">
<link rel="stylesheet" href="<c:url value='/css/cart.css' />">
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
			<p><img src="image/logo3.png" class="img"></p>
		</div>
		<div class="header-right"></div>
	</header>

	<main class="main">
    <c:choose>
      <c:when test="${empty cartItems}">
        <p>カートに商品が入っていません。</p>
      </c:when>
      <c:otherwise>
        <c:forEach var="item" items="${cartItems}">
          <div class="cart-item"
               data-id="${item.product.productId}"
               data-price="${item.product.price}">
            <img class="cart-img"
                 src="<c:url value='/image/${item.product.imageUrl}'/>"
                 alt="${item.product.productName}" />

            <div>
              <p class="name">${item.product.productName}</p>
              <p>
                単価：${item.product.price}円<br/>
                小計：<span id="subtotal-${item.product.productId}">
                  ${item.product.price * item.quantity}
                </span>円
              </p>
              <div class="quantity-controls">
                <button type="button"
                        onclick="changeQty(${item.product.productId}, -1)">－</button>
                <span id="qty-${item.product.productId}">
                  ${item.quantity}
                </span>
                <button type="button"
                        onclick="changeQty(${item.product.productId}, 1)">＋</button>
              </div>
            </div>
          </div>
        </c:forEach>

        <!-- ここを HandedServlet に POST -->
        <form id="checkoutForm"
              action="<c:url value='/HandedServlet'/>"
              method="post" onsubmit="return checkTotalQty()">
          <input type="hidden" name="cart" id="cartData" value=""/>
          <div style="margin-top: 2rem;">
            <input type="submit" value="支払画面へ"/>
          </div>
        </form>
      </c:otherwise>
    </c:choose>
  </main>

	<footer>
		<div class="footer-left">
			<button class="fl" onclick="history.back();">
				<img src="image/iconReturn.png" height="105" alt="戻る">
			</button>
		</div>
	</footer>
	<script>
    // localStorage cart の読み書き
    function loadCart() {
      try { return JSON.parse(localStorage.getItem('cart')) || {}; }
      catch { return {}; }
    }
    function saveCart(cart) {
    	  const el = document.getElementById('cartData');
    	  if (el) el.value = JSON.stringify(cart);
    	  localStorage.setItem('cart', JSON.stringify(cart));
    }

    // 数量変更
    function changeQty(id, delta) {
      const qtyEl = document.getElementById('qty-' + id);
      let qty = parseInt(qtyEl.textContent, 10) || 0;
      qty = Math.max(0, Math.min(10, qty + delta));
      qtyEl.textContent = qty;

      const container = document.querySelector('.cart-item[data-id="' + id + '"]');
      const price = parseInt(container.dataset.price, 10);
      document.getElementById('subtotal-' + id).textContent = price * qty;

      const cart = loadCart();
      cart[id] = qty;
      saveCart(cart);
    }
    
    // 支払画面へ遷移する前に呼ぶチェック関数
    function checkTotalQty() {
      const cart = loadCart();
      // cart の各 productId に対する数量を足し合わせる
      const total = Object.values(cart).reduce((sum, qty) => sum + qty, 0);
      if (total > 10) {
        alert("同時に注文できるのは10個までです。");
        return false;
      }else if(total <= 0){
    	alert("商品を一つ以上選択してください");
        return false;
      }
      return true;
    }

    // 初期表示時に hidden input にセット
    document.addEventListener('DOMContentLoaded', () => {
      saveCart(loadCart());
    });
  </script>
</body>
</html>