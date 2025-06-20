<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ホーム画面</title>
<link rel="stylesheet" href="css/user.css">
<link rel="stylesheet" href="css/home.css">
</head>
<body>
	<header>
		<div class="header-left">
			<img src="image/Logo.png" height="50" alt="ロゴ">
		</div>
		<div class="header-center">
			<p class="header-p">ホーム画面</p>
		</div>
		<div class="header-right">
			<button class="log">
				<img src="image/iconLogOut.png" height="35" alt="ロゴ">
			</button>
		</div>
	</header>

	<main>
		<!--  <div class=QR-position>
			<button class="QR-button">QR表示</button>
		</div>-->

		<div class=regist-position>
			<button class=regist-button id="openModal">商品追加</button>
		</div>

		<!-- 写真ギャラリー部分 -->
		<div class="photo-gallery">
			<img src="image/Logo.png" alt="写真1" class="photo" data-photo-id="1">
			<img src="image/Logo.png" alt="写真2" class="photo" data-photo-id="2">
			<img src="image/iconCart.png" alt="写真3" class="photo"
				data-photo-id="3">
		</div>

		<!-- 商品詳細表示用モーダル -->
		<div id="editModal" class="edit-modal-overlay">
			<div class="modal-content">
			<div class="flaot-title">
			<span class="title">商品情報の編集</span>
			</div>
				<span class="modal-close" id="closeEditModal">×</span>
				<label>
				 <span class="filelabel" title="ファイルの選択">
				 <img id="modalImage" class="edit-modal-image" src="" alt="選択された画像"></span>
					<input type="file" name="datafile" class="filesend" accept=".jpg,.gif,.png,image/gif,image/jpeg,image/png">
				</label>
				<form action="#" method="post">

					<input type="hidden" name="photoId" id="modalPhotoId"> <label
						for="description">商品名</label><br> <input type="text"
						name="productName" id="productId"><br>
					<br> <label for="description">値段</label><br> <input
						type="text" name="productPrice" id="Price"><br>
					<br> <label>説明文</label><br> <input type="text"
						name="productExplanation" id="Explanation"><br>
					<br>
					<button type="submit" class="registration">登録</button>
				</form>

			</div>
		</div>
		
		<!-- 商品登録用モーダル -->
		<div id="addModal" class="add-modal-overlay">
			<div class="modal-content">
			<div class="flaot-title">
			<span>商品の追加</span>
			</div>
				<span class="modal-close" id="closeAddModal">×</span> 
				<label>
				<span class="filelabel" title="ファイルの選択">
				 <img id="modalImage" class="add-modal-image" src=""></span>
					<input type="file" name="datafile" class="filesend" accept=".jpg,.gif,.png,image/gif,image/jpeg,image/png">				
				</label>
				<form action="#" method="post">

					 <div class="column">
					<input type="hidden" name="photoId" id="modalPhotoId">
					 <label for="description">商品名</label><br>
					 <input type="text" name="productName" id="productId"><br>
					 
					<div id="name-price"><br> <label for="description">値段</label><br> <input
						type="text" name="productPrice" id="Price"><br></div>
					 </div>
						
					<br> <label>説明文</label><br> <input type="text"
						name="productExplanation" id="Explanation"><br>
					<br>
					<button type="submit" class="registration">登録</button>
				</form>

			</div>
		</div>
		
	</main>
	<footer>
		<div class="footer-center">
			<section>
				<a href="#" class="btn_03">注文確認</a>
			</section>
		</div>
	</footer>

	<script src="js/home.js"></script>
	<script src="js/main.js"></script>

</body>
</html>