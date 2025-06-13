<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/recommend.css">
</head>
<body>
	<!-- ここからヘッダー -->
	<div class="header">
	<p>共通ヘッダーのところ</p>
	</div>
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
	<div class="footer">
	<p>共通フッターのところ
	</div>
	<!-- ここまでフッター -->
</body>
</html>