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

<body class="wait-body">

	<header>
		<div class="header-left">
			<form action="${pageContext.request.contextPath}/MenuServlet"
				method="get"><input type="submit" name="moveMenu" value="MENU" class="mb" id="menuBtn"></form>
		</div>
		<div class="header-center">
			<p>
				<img src="image/logo3.png" class="img">
			</p>
		</div>
		<div class="header-right"></div>
	</header>

	<main>

		<div id="divArea">
			<div id="number" class="number">
				<p>ご注文番号</p>
				<h1>${orderId}</h1>
			</div>
			<div id="messageArea">
				<div class="sum-price">
					<p>お支払金額</p>
					<span class="price">&yen;${totalAmount}</span>
				</div>
				<div class="message-top">
					<p id="message">
						この画面を店員に<br>お見せください
					</p>
				</div>
				<div class="comp" id="compArea">
					<button id="compBtn" onclick="comp()">受取完了</button>
				</div>
			</div>
		</div>

	</main>
	<footer>
		<div class="footer-left"></div>
		<div class="footer-right"></div>
	</footer>

	<script>
  const orderId = ${orderId};
  const contextPath = '${pageContext.request.contextPath}';
  localStorage.clear();
  
  // サーバーに orderId を送り、int[] flags を受け取る
  function fetchFlags() {
    return fetch(contextPath + `/HandedUpdate`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8' },
      body: new URLSearchParams({ orderId })
    })
    .then(resp => resp.json());
  }
  
  function comp(){
      document.getElementById('message').innerHTML =
        'ご購入ありがとうございます！<br>またお越しください';
      document.getElementById('compBtn').style.display = 'none';
      document.getElementById('compArea').style.display = 'none';
      document.getElementById('menuBtn').style.display = 'block';
      clearInterval(pollId);
  }

  // 5秒ごとにポーリングして、受渡フラグだけでなく他のフラグも確認可
  function pollFlags() {
    fetchFlags().then(json => {
   	if (!json.success) {
           console.error('サーバーエラー:', json.error);
           return;
         }
         // JSON に必ず flags プロパティがある想定だが……
         const flags = json.flags;
         if (!Array.isArray(flags) || flags.length < 3) {
           console.error('不正なflags:', flags);
           return;
         }
         const [isPaid, isComplete, isHanded] = flags;
         
      // すべて0なら初期表示
      if (isPaid === 0 && isComplete === 0 && isHanded === 0) {
    	document.getElementById('message').innerHTML = 'この画面を店員に<br>お見せください';
      }
         
      // 支払済みならメッセージを更新
      if (isPaid === 1) {
        document.getElementById('message').innerHTML = 'お支払いが完了しました';
      }

      // 作成済み（complete）なら次のメッセージ
      if (isComplete === 1) {
        document.getElementById('message').innerHTML = '商品を準備中です';
      }

      // 受渡済みなら最終メッセージ
      if (isHanded === 1) {
        document.getElementById('message').innerHTML =
          '商品が完成いたしました！<br>カウンターまでお越しください';
        document.getElementById('compBtn').style.display = 'block';
        document.getElementById('compArea').style.display = 'block';
      }
    })
    .catch(err => console.error('通信エラー:', err));
  }

  let pollId;
  document.addEventListener('DOMContentLoaded', () => {
    // 初回チェック
    pollFlags();
    // 以降5秒ごとにチェック
    pollId = setInterval(pollFlags, 5000);
  });
</script>
</body>
</html>