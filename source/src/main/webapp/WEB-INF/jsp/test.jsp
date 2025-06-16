<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
<link rel="stylesheet" href="css/test.css">
</head>
<body>
	<nav class="menu">
	    <div class="hamburger">
	      <span></span>
	      <span></span>
	      <span></span>
	    </div>
	    <ul>
	      <li><a href="#">ホーム</a></li>
	      <li><a href="#">注文確認</a></li>
	      <li><a href="#">私たちについて</a></li>
	      <li><a href="#">制作事例</a></li>
	      <li><a href="#">お問い合わせ</a></li>
	    </ul>
	</nav>
	<h1>テストページ</h1>
	<p>ログイン中：<c:out value="${user.get(0).userName}" default="user is null!" />様</p>
	<form></form>
	<script
  src="https://code.jquery.com/jquery-3.6.3.js" integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM=" crossorigin="anonymous"></script>
	<script src="js/test.js"></script>
</body>
</html>