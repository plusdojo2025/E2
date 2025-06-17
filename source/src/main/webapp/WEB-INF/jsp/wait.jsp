<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/wait.css">
<link rel="stylesheet" href="css/customer.css">
</head>

<body>

	<header>
		<div class="header-left">
			<input type="submit" name="moveMenu" value="MENU" class="mb">
		</div>
		<div class="header-center">
			<p>○○店</p>
		</div>
		<div class="header-right"></div>
	</header>

	<main>
		<div class="number">
			<p>
				ご注文番号&emsp; <span>000</span>
			</p>
		</div>
		<br>
		<div class="sum-price">
			<p>お支払金額</p>
			<span class="price">&yen;0000</span>
		</div>
		<div class="message-top">
			<p>
				お会計の準備が出来ましたら、<br> この画面を店員にお見せください。
			</p>
		</div>
		<p class="status">未決済</p>

		<!--モーダル1つ目の中身-->
		<div class="modal modal-first">
			<div class="modal-container">
				<div class="number">
					ご注文番号&emsp;<span>000</span>
				</div>
				<div class="message">
					<div>
						ご注文が完了しました。<br> <br> 商品の準備が整うまで、<br> いましばらくお待ちください。
					</div>
				</div>
			</div>
		</div>

		<!--モーダル2つ目の中身-->
		<div class="modal modal-second">
			<div class="modal-second">
				<div class="number">
					ご注文番号&emsp;<span>000</span>
				</div>
				<div class="message">
					<div>
						商品が完成いたしました。<br> <br>商品提供口までお越しください。
					</div>
				</div>
			</div>
		</div>

		<!--モーダル3つ目の中身-->
		<div class="modal modal-third">
			<div class="modal-third">
				<div class="message">
					<div>
						<strong>お買い上げいただき<br> ありがとうございました！
						</strong>
						<div>
							<br>またのご利用を<br> お待ちしております。
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

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
	
	<script>
		
	</script>
</body>
</html>