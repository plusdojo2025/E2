<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注文確認</title>
<link rel="stylesheet" href="css/user.css">
<link rel="stylesheet" href="css/order.css">
</head>
<body>
    <header>
        <div class="header-left">
            <img src="image/Logo.png" height="50" alt="ロゴ">
        </div>
        <div class="header-center">
            <p class="header-p">注文確認</p>
        </div>
        <div class="header-right">
            <button class="log">
                <img src="image/iconLogOut.png" height="35" alt="ログアウトアイコン">
            </button>
        </div>
    </header>

    <div class="order-container">
        <table class="order-list">
            <thead>
                <tr>
                    <th>注文番号</th>
                    <th>金額</th>
                    <th>支払</th>
                    <th>作成</th>
                    <th>受渡</th>
                    <th>ちくわ</th>
                    <th>大根</th>
                    <th>水</th>
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
                    <td>0</td>
                    <td>1</td>
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
                <tr>
                    <td>3</td>
                    <td>50000</td>
                    <td>○</td>
                    <td>×</td>
                    <td>×</td>
                    <td>0</td>
                    <td>0</td>
                    <td>1</td>
                </tr>
            </tbody>
        </table>
        <br>
        <div class="order-detail-modal">
            <span class="close-button">&times;</span><br>
            <div class="order-detail-modal-content">
                <%-- あとでstyle="display: none;"を追加する --%>
                <div class="order-info-header">
                    <span>1</span>
                    <span>1200円</span>
                    <span>3点</span>
                </div>
                <table class="order-info-table">
                    <thead>
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
                </table>
                <table class="order-product-table">
                    <thead>
                        <tr>
                            <th>ちくわ</th>
                            <th>大根</th>
                            <th>水</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>0</td>
                            <td>1</td>
                            <td>2</td>
                        </tr>
                    </tbody>
                </table>
                <table class="order-product-table">
                    <thead>
                        <tr>
                            <th>ちくわ</th>
                            <th>大根</th>
                            <th>水</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>0</td>
                            <td>1</td>
                            <td>2</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <footer>
        <div class="footer-center">
            <section>
                <a href="#" class="btn_03">ホームメニュー</a>
            </section>
        </div>
    </footer>
</body>
</html>