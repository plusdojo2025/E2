<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, dto.OrderDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>注文一覧</title>
<link rel="stylesheet" href="css/user.css">
<link rel="stylesheet" href="css/order.css">
<style>
.flag-cell {
	cursor: pointer;
	text-align: center;
}

#showAll {
	margin-bottom: 8px;
}

.check-text {
	font-size: 15px;
}
</style>
</head>
<body>
	<header>
		<div class="header-left">
			<img src="image/Logo.png" height="50" alt="ロゴ">
		</div>
		<div class="header-center">
			<h1 class="header-p">OrderMaker</h1>
		</div>
		<div class="header-right">
			<button class="log">
				<img src="image/iconLogOut.png" height="35" alt="ログアウトアイコン">
			</button>
		</div>
	</header>
	<!-- 全件表示トグル -->

	<div class="order-container">
		<label> <input type="checkbox" id="showAll" /> <span
			class="check-text">全件表示</span>
		</label>
		<table class="order-list" id="orderTable" border="1" cellpadding="5"
			cellspacing="0">
			<thead>
				<tr>
					<th>ID</th>
					<th>金額</th>
					<th>支払</th>
					<th>作成</th>
					<th>受渡</th>
					<c:forEach var="p" items="${productNames}">
						<th>${p}</th>
					</c:forEach>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="order" items="${orders}">
					<tr data-order-id="${order.orderId}">
						<td>${order.orderId}</td>
						<td>${order.totalAmount}</td>
						<td class="flag-cell" data-flag="paid">${order.paid ? "◯" : "✕"}</td>
						<td class="flag-cell" data-flag="complete">${order.complete ? "◯" : "✕"}</td>
						<td class="flag-cell" data-flag="handed">${order.handed ? "◯" : "✕"}</td>
						<c:forEach var="p" items="${productNames}">
							<td><c:out
									value="${order.productQuantities[p] != null && order.productQuantities[p] != 0
                            ? order.productQuantities[p] : ''}" />
							</td>
						</c:forEach>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<footer>
		<div class="footer-center">
			<section>
				<a href="<c:url value='/HomeServlet'/>" class="btn_03">ホームメニュー</a>
			</section>
		</div>
	</footer>
<script>
  const contextPath = '${pageContext.request.contextPath}';
  
  window.onload = function(){
	  window.setInterval(function(){
		  localStorage.setItem("isCheck",document.getElementById("showAll").checked);
		  window.location.reload();
	  }, 5000);
  }
  
  document.addEventListener('DOMContentLoaded', () => {
    const showAll = document.getElementById('showAll');
    const table   = document.getElementById('orderTable');

	  if(localStorage.getItem("isCheck") === "true"){
		  showAll.checked = true;
	  }else{
		  showAll.checked = false;
	  }
	  
    function applyFilter() {
      const show = showAll.checked;
      table.querySelectorAll('tbody tr').forEach(row => {
        const cells = row.querySelectorAll('.flag-cell');
        const allTrue = Array.from(cells).every(c => c.textContent === '◯');
        row.style.display = (allTrue && !show) ? 'none' : '';
      });
    }

    showAll.addEventListener('change', applyFilter);
    applyFilter();

    table.querySelectorAll('.flag-cell').forEach(cell => {
      cell.addEventListener('click', () => {
        const row = cell.closest('tr');
        const orderId = row.dataset.orderId;
        const flag    = cell.dataset.flag;

        console.log('orderId:', orderId);
        console.log('flag:', flag);

        const params = new URLSearchParams();
        params.append('orderId', orderId);
        params.append('flag', flag);

        fetch(contextPath+`/toggleFlag`, {
          method: 'POST',
          headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
          },
          body: params.toString()
        })
        .then(res => res.json())
        .then(json => {
          if (json.success) {
            cell.textContent = json.newValue ? '◯' : '✕';
            applyFilter();
          } else {
            alert('更新に失敗しました');
          }
        })
        .catch(() => alert('通信エラー'));
      });
    });
  });
</script>
</body>
</html>