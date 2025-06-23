<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      <form action="/e2/MenuServlet" method="get">
        <input type="submit" name="moveMenu" value="MENU" class="mb">
      </form>
    </div>
    <div class="header-center">
      <p><img src="image/logo3.png" class="img" alt="Logo"></p>
    </div>
    <div class="header-right"></div>
  </header>

  <main>
    <div class="menu-container" id="menuArea">
      <c:forEach var="prod" items="${products}">
        <!-- data-product-id 属性を付与し、クリックでServletへ飛ばす -->
        <div class="product"
             data-product-id="${prod.productId}"
             onclick="location.href='${pageContext.request.contextPath}/ProductServlet?productId=${prod.productId}'">
          <div class="product-picture">
            <img src="${pageContext.request.contextPath}/image/${prod.imageUrl}"
                 alt="${prod.productName}"/>
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
      <button class="fr" onclick="location.href='${pageContext.request.contextPath}/cart'">
        <img src="image/iconCart.png" height="105" alt="カート">
      </button>
    </div>
  </footer>

</body>
</html>