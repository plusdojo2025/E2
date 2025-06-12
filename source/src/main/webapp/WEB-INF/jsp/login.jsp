<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- ここからヘッダー -->
<h1>Order Maker<br>簡単登録！機能豊富</h1>
<!-- ここまでヘッダー -->

<!-- ここからメイン -->
<form>
    <table>
      <tr>
        <td>
          <label>名前<br>
          <input type="text" name="name">
          </label>
        </td>
      </tr>
      <tr>
        <td>
          <label>パスワード<br>
          <input type="password" name="password">
          </label>
        </td>
      </tr>
      <tr>
        <td>
          <input type="button" name="login" value="ログイン">
        </td>
      </tr>
      <tr>
      	<td>
      		<input type="button" name="userRegist" value="新規作成">
      	</td>
      </tr>
    </table>
    
<!-- ここからメイン -->
</form>
</body>
</html>