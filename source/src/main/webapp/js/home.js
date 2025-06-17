/**
 * 
 */
 
const modal = document.getElementById('modal');
const closeModal = document.getElementById('closeModal');
const photoElements = document.querySelectorAll('.photo');
const modalPhotoId = document.getElementById('modalPhotoId');

// 写真クリック時に詳細表示
photoElements.forEach(photo => {
    photo.addEventListener('click', () => {
        const photoId = photo.getAttribute('data-photo-id');
        modalPhotoId.value = photoId;
        modal.style.display = 'flex';
    });
});

const modalImage = document.getElementById('modalImage'); // 詳細の画像のやーつ

photoElements.forEach(photo => {
    photo.addEventListener('click', () => {
        const photoId = photo.getAttribute('data-photo-id');
        modalPhotoId.value = photoId;

        // ここで画像を表示するのでいじるべからず
        const photoSrc = photo.getAttribute('src');
        modalImage.src = photoSrc;

        modal.style.display = 'flex';
    });
});

// 閉じる処理
closeModal.addEventListener('click', () => {
    modal.style.display = 'none';
});

// モーダル外クリックで閉じる
window.addEventListener('click', (e) => {
    if (e.target === modal) {
        modal.style.display = 'none';
    }
});