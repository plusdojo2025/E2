<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/recommend.css">
<link rel="stylesheet" type="text/css" href="css/customer.css">
</head>
<body>
	<!-- ここからヘッダー -->
<header>
<div class="header-left">
<input type="submit" name="moveMenu" value="MENU" class="mb">
</div>
<div class="header-center">
<p>○○店</p>
</div>
<div class="header-right">
</div>
</header>
	<!-- ここまでヘッダー -->

	<!-- ここからメイン -->
	<div class="quest">
		<p>辛いのは好き？</p>
		<span class="btn"><input type="button" name="selectAnswer" value="Yes"></span>
		<span class="btn"><input type="button" name="selectAnswer" value="No"></span>
	</div>

	<div class="quest">
	<p>酸っぱいのが食べたい気分？</p>
	<span class="btn"><input type="button" name="selectAnswer" value="Yes"></span>
	<span class="btn"><input type="button" name="selectAnswer" value="No"></span>
	</div>
	
	<div class="quest">
	<p>甘いのは好き？</p>
	<span class="btn"><input type="button" name="selectAnswer" value="Yes"></span>
	<span class="btn"><input type="button" name="selectAnswer" value="No"></span>
	</div>
	
	<br>

	<div class="result">
	<input type="button" name="moveRecommendResult" value="決定">
	</div>
	<!-- ここまでメイン -->
	
	<!-- ここからフッター -->
<footer>
<div class="footer-left">
<button class="fl">
<img src="image/iconReturn.png" height="105" alt="戻る">
</button>
</div>
<div class="footer-right">
<button class="fr">
<img src="image/iconCart.png" height="105" alt="カート">
</button>
</div>
</footer>
	<!-- ここまでフッター -->
</body>
</html>