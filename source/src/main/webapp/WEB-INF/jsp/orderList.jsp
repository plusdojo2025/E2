<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, dto.OrderDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>注文一覧</title>
  <style>
    .flag-cell { cursor: pointer; text-align: center; }
    #showAll { margin-bottom: 8px; }
  </style>
</head>
<body>
  <!-- 全件表示トグル -->
  <label>
    <input type="checkbox" id="showAll" />
    全件表示
  </label>

  <table id="orderTable" border="1" cellpadding="5" cellspacing="0">
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
          <td class="flag-cell"
              data-flag="paid">${order.paid ? "◯" : "✕"}</td>
          <td class="flag-cell"
              data-flag="complete">${order.complete ? "◯" : "✕"}</td>
          <td class="flag-cell"
              data-flag="handed">${order.handed ? "◯" : "✕"}</td>
          <c:forEach var="p" items="${productNames}">
            <td>
              <c:out value="${order.productQuantities[p] != null
                            ? order.productQuantities[p] : 0}" />
            </td>
          </c:forEach>
        </tr>
      </c:forEach>
    </tbody>
  </table>

  <script>
    document.addEventListener('DOMContentLoaded', () => {
      const showAll = document.getElementById('showAll');
      const table   = document.getElementById('orderTable');
      // 行フィルタ関数
      function applyFilter() {
        const show = showAll.checked;
        table.querySelectorAll('tbody tr').forEach(row => {
          const cells = row.querySelectorAll('.flag-cell');
          const allTrue = Array.from(cells)
                               .every(c => c.textContent === '◯');
          row.style.display = (allTrue && !show) ? 'none' : '';
        });
      }
      showAll.addEventListener('change', applyFilter);
      applyFilter(); // 初期状態

      // フラグ切替イベント
      table.querySelectorAll('.flag-cell').forEach(cell => {
        cell.addEventListener('click', () => {
          const row = cell.closest('tr');
          const orderId = row.dataset.orderId;
          const flag    = cell.dataset.flag;
          fetch(`${pageContext.request.contextPath}/toggleFlag`, {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: `orderId=${orderId}&flag=${flag}`
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