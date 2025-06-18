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
		<div class="btn-area">
			<span class="btn"><input type="radio" name="selectAnswer1" id="radio1"><label for="radio1">Yes</label></span>
			<span class="btn"><input type="radio" name="selectAnswer1" id="radio2"><label for="radio2">No</label></span>
		</div>
	</div>

	<div class="quest">
		<p>酸っぱいのが食べたい気分？</p>
		<div class="btn-area">
			<span class="btn"><input type="radio" name="selectAnswer2" id="radio3"><label for="radio3">Yes</label></span>
			<span class="btn"><input type="radio" name="selectAnswer2" id="radio4"><label for="radio4">No</label></span>
		</div>
	</div>
	
	<div class="quest">
		<p>甘いのは好き？</p>
		<div class="btn-area">
			<span class="btn"><input type="radio" name="selectAnswer3" id="radio5"><label for="radio5">Yes</label></span>
			<span class="btn"><input type="radio" name="selectAnswer3" id="radio6"><label for="radio6">No</label></span>
		</div>
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