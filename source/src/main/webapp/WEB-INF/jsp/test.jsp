<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
</head>
<body>
	<h1>テストページ</h1>
	<p>ログイン中：<c:out value="${user.get(0).userName}" default="user is null!" />様</p>
	<form></form>
</body>
</html>