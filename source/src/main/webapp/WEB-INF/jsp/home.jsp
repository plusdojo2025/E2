<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ホーム画面</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/user.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/home.css">
<style>
.modal-overlay {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
}

.modal-content {
	background: #fff;
	padding: 20px;
	margin: 50px auto;
	width: 300px;
	position: relative;
}

.modal-close {
	position: absolute;
	top: 5px;
	right: 10px;
	cursor: pointer;
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

	<main>
		<div class="regist-position">
			<button id="openAdd">商品追加</button>
		</div>

		<div class="photo-gallery">
			<c:forEach var="p" items="${products}">
				<img class="photo" src="image/${p.imageUrl}"
					data-id="${p.productId}" data-name="${p.productName}"
					data-price="${p.price}" data-detail="${p.productDetail}"
					data-image="${p.imageUrl}" alt="${p.productName}">
			</c:forEach>
		</div>
	</main>

	<!-- 編集モーダル -->
	<div id="editModal" class="modal-overlay">
		<div class="modal-content">
			<span class="modal-close" id="closeEdit">×</span>
			<form id="editForm"
				action="${pageContext.request.contextPath}/productAction"
				method="post" enctype="multipart/form-data">
				<input type="hidden" name="actionType" value="update"> <input
					type="hidden" name="productId" id="editId"> <input
					type="hidden" name="currentImage" id="currentImage"> <label>画像<br>
					<img id="editImg" src="" width="100"><br> <input
					type="file" name="datafile">
				</label><br> <label>商品名<br> <input type="text"
					name="productName" id="editName">
				</label><br> <label>価格<br> <input type="text"
					name="productPrice" id="editPrice">
				</label><br> <label> 売り切れ<input type="checkbox"
					name="isSoldOut" id="editSold">
				</label><br> <label>説明<br> <textarea name="productDetail"
						id="editDetail"></textarea>
				</label><br>
				<button type="submit">更新</button>
				<button type="submit" onclick="this.form.actionType.value='delete'">削除</button>
			</form>
		</div>
	</div>

	<!-- 追加モーダル -->
	<div id="addModal" class="modal-overlay">
		<div class="modal-content">
			<span class="modal-close" id="closeAdd">×</span>
			<form id="addForm"
				action="${pageContext.request.contextPath}/productAction"
				method="post" enctype="multipart/form-data">
				<input type="hidden" name="actionType" value="add"> <label>画像<br>
					<input type="file" name="datafile"></label><br> <label>商品名<br>
					<input type="text" name="productName"></label><br> <label>価格<br>
					<input type="text" name="productPrice"></label><br> <label>売り切れ<input
					type="checkbox" name="isSoldOut"></label><br> <label>説明<br>
					<textarea name="productDetail"></textarea></label><br>
				<button type="submit">追加</button>
			</form>
		</div>
	</div>

	<footer>
		<div class="footer-center">
			<section>
				<a href="<c:url value='/OrderServlet'/>" class="btn_03">注文確認</a>
			</section>
		</div>
	</footer>

	<script>
    // モーダル開閉 & フィールド埋め込み
    document.addEventListener('DOMContentLoaded', () => {
      const editModal = document.getElementById('editModal');
      const addModal  = document.getElementById('addModal');
      const photos    = document.querySelectorAll('.photo');

      photos.forEach(img => {
        img.addEventListener('click', () => {
          // 編集モーダルにデータをセット
          document.getElementById('editId').value       = img.dataset.id;
          document.getElementById('editName').value     = img.dataset.name;
          document.getElementById('editPrice').value    = img.dataset.price;
          document.getElementById('editDetail').value   = img.dataset.detail;
          document.getElementById('currentImage').value = img.dataset.image;
          document.getElementById('editImg').src        = 'image/' + img.dataset.image;
          document.getElementById('editSold').checked   = img.dataset.sold === 'true';
          editModal.style.display = 'block';
        });
      });

      document.getElementById('openAdd').onclick = () => addModal.style.display = 'block';
      document.getElementById('closeEdit').onclick = () => editModal.style.display = 'none';
      document.getElementById('closeAdd').onclick  = () => addModal.style.display  = 'none';

    });
    

  	// モーダルの外側をクリックで閉じる
  	
		window.addEventListener('click', (event) => {
		    if (event.target == editModal) {
		        if (editModal) {
		        	editModal.style.display = 'none';
		        }
		    }
		    if (event.target == addModal) {
		        if (addModal) {
		        	addModal.style.display = 'none';
		        }
		    }
		});
  </script>
</body>
</html>
