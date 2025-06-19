/**
 * 
 */

//中嶋追加openModal addModal/編集 editModal
const editModal = document.getElementById('editModal');
const addModal = document.getElementById('addModal');
const closeAddModal = document.getElementById('closeAddModal');
const closeEditModal = document.getElementById('closeEditModal');
const photoElements = document.querySelectorAll('.photo');
const modalPhotoId = document.getElementById('modalPhotoId');
const openModal = document.getElementById('openModal');
console.log(closeAddModal.textContent);
// 写真クリック時に詳細表示
photoElements.forEach(photo => {
    photo.addEventListener('click', () => {
        const photoId = photo.getAttribute('data-photo-id');
        modalPhotoId.value = photoId;
        editModal.style.display = 'flex';
    });
});

//商品追加のボタンをクリック時に追加モーダルを表示 中嶋
openModal.addEventListener('click', () => {
	addModal.style.display = 'flex';
});

const modalImage = document.getElementById('modalImage'); // 詳細の画像のやーつ

photoElements.forEach(photo => {
    photo.addEventListener('click', () => {
        const photoId = photo.getAttribute('data-photo-id');
        modalPhotoId.value = photoId;

        // ここで画像を表示するのでいじるべからず
        const photoSrc = photo.getAttribute('src');
        modalImage.src = photoSrc;

        editModal.style.display = 'flex';
    });
});

// 閉じる処理
closeAddModal.addEventListener('click', () => {
    addModal.style.display = 'none';
});

closeEditModal.addEventListener('click', () => {
    editModal.style.display = 'none';
});

// モーダル外クリックで閉じる
window.addEventListener('click', (e) => {
    if (e.target === editModal) {
        editModal.style.display = 'none';
    }
});
// 追加 モーダル外クリックで閉じる　中嶋
window.addEventListener('click', (e) => {
    if (e.target === addModal) {
        addModal.style.display = 'none';
    }
    });