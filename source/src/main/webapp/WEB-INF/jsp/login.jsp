<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/login.css">
</head>
<body>

<!-- ここからヘッダー -->
<h1 class="header">Order Maker<br>簡単登録！機能豊富</h1>
<!-- ここまでヘッダー -->

<!-- ここからメイン -->
<div class="login">
<form>
    <table>
      <tr>
        <td>
          <!-- <label>名前<br> -->
          <input type="text" name="name" placeholder="名前" class="login-tb">
          <!--</label>-->
        </td>
      </tr>
      <tr>
        <td>
         <!--  <label>パスワード<br> -->
          <input type="password" name="password" placeholder="パスワード" class="login-tb">
          <!--</label>-->
        </td>
      </tr>
      <tr>
        <td>
          <input type="button" name="login" value="ログイン" class="button">
        </td>
      </tr>
      <tr>
      	<td>
      		<input type="button" name="userRegist" value="新規作成" class="button">
      	</td>
      </tr>
    </table>
</form>
</div>
<!-- ここまでメイン -->
</body>
</html>