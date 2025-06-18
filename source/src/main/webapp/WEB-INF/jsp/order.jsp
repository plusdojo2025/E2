<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注文確認</title>
<link rel="stylesheet" href="css/user.css">
<link rel="stylesheet" href="css/order.css">
</head>
<body>

<%--新規追加欄　最終的にはこうなるので変更するべからず --%>

<c:if test="${empty orderList}">
        <p>注文はありません。</p>
    </c:if>

    <c:if test="${not empty orderList}">
        <table>
            <tr>
                <th>注文ID</th>
                <th>注文コード</th>
                <th>支払</th>
                <th>作成</th>
                <th>受渡</th>
                <th>合計金額</th>
                <th>注文日時</th>
            </tr>

            <c:forEach var="order" items="${orderList}">
                <tr>
                    <td>${order.orderId}</td>
                    <td>${order.urderCode}</td>
                    <td><c:choose><c:when test="${order.paid}">○</c:when><c:otherwise>×</c:otherwise></c:choose></td>
                    <td><c:choose><c:when test="${order.complete}">○</c:when><c:otherwise>×</c:otherwise></c:choose></td>
                    <td><c:choose><c:when test="${order.handed}">○</c:when><c:otherwise>×</c:otherwise></c:choose></td>
                    <td>${order.totalAmount}</td>
                    <td>${order.createdAt}</td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

<%-- ↓は既存のもの --%>
	<table>
		<thead>
			<tr>
				<th>注文番号</th>
				<th>金額</th>
				<th>支払</th>
				<th>作成</th>
				<th>受渡</th>
				<th>アップルパイ</th>
				<th>フルーツタルト</th>
				<th>フォンダンショコラ</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td>5500</td>
				<td>×</td>
				<td>×</td>
				<td>×</td>
				<td>0</td>
				<td>2</td>
				<td>3</td>
			</tr>
			<tr>
				<td>2</td>
				<td>500</td>
				<td>○</td>
				<td>×</td>
				<td>×</td>
				<td>0</td>
				<td>0</td>
				<td>1</td>
			</tr>
		</tbody>
	</table>

	<div class="order-detail-container">
		<%-- あとでstyle="display: none;"を追加する --%>
		<span class="close-button">&times;</span>
		<table class="order-info-table">
			<thead>
				<tr>
					<th class="order-info-header">1</th>
					<th class="order-info-header">1200円</th>
					<th class="order-info-header">3点</th>
				</tr>
				<tr>
					<th class="order-status-header">支払</th>
					<th class="order-status-header">作成</th>
					<th class="order-status-header">受渡</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="order-status">×</td>
					<td class="order-status">×</td>
					<td class="order-status">×</td>
				</tr>
			</tbody>
			<div class="order-product-table">
				<thead>
					<tr>
						<th class="order-product-header">アップルパイ</th>
						<th class="order-product-header">フルーツタルト</th>
						<th class="order-product-header">フォンダンショコラ</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>0</td>
						<td>1</td>
						<td>2</td>
					</tr>
				</tbody>
			</div>
		</table>
	</div>
</body>
</html>