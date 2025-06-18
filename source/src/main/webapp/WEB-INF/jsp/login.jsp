<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>

<!-- ここからヘッダー -->
<div class="header">
<h1 class="header-logo">Order Maker<br>簡単登録！機能豊富</h1>
</div>
<!-- ここまでヘッダー -->

<!-- ここからメイン -->
<div class="login">
<form action="/E2/LoginServlet" method="post">
    <table>
      <tr>
        <td>
          <!-- <label>名前<br> -->
          <input type="text" name="name" placeholder="名前" class="login-input">
          <!--</label>-->
        </td>
      </tr>
      <tr>
        <td>
         <!--  <label>パスワード<br> -->
          <input type="password" name="password" placeholder="パスワード" class="login-input">
          <!--</label>-->
        </td>
      </tr>
      <tr>
        <td>
        	<!-- エラーメッセージ表示 -->
			<c:if test="${not empty error}">
			    <p style="color:red;">${error}</p>
			</c:if>
        </td>
      </tr>
      <tr>
        <td>
          <input type="submit" name="submit" value="ログイン" class="button" style="background-color: #3a7d23; color: #FFFFFF;">
        </td>
      </tr>
      <tr>
      	<td>
      		<input type="submit" name="submit" value="新規登録" class="button">
      	</td>
      </tr>
    </table>
</form>
</div>
<!-- ここまでメイン -->
</body>
</html>