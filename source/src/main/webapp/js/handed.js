/**
 * 
 */
 
 		const modalFirst = document.getElementById('modalFirst');
 		const modalSecond = document.getElementById('modalSecond');
 		const modalThird = document.getElementById('modalThird');
		const btn = document.getElementById('modal(1)');
		const btn2 = document.getElementById('modal(2)');
		const btn3 = document.getElementById('modal(3)');
		const messageDefault = document.getElementById('messageDefault');
//		const messageDefaultNumber = document.getElemntById('messageDefaultNumber');
		const number = document.getElementById('number');
		const modalClose = document.getElementById('modalClose');

		//btmを押すとモーダルとデフォルト文の切り替わり
		btn.addEventListener('click', () => {
			modalFirst.style.display = 'block';
			messageDefault.style.display = 'none';
		});
		
		//切り替わった後に表示されるbtn2を押すとモーダル1とモーダル2が切り替わる
		btn2.addEventListener('click', () => {
			modalSecond.style.display = 'flex';
			modalFirst.style.display = 'none';
		});
		
		//切り替わった後に表示されるbtn2を押すとモーダル1とモーダル2が切り替わる
		btn3.addEventListener('click', () => {
			modalThird.style.display = 'flex';
			modalSecond.style.display = 'none';
			number.style.display='none';
		});


		// OKを押すとモーダルを閉じる
		modalClose.addEventListener('click', () => {
			modalThird.style.display = 'none';
			messageDefault.style.display = 'block';
			number.style.display ='block';
		});

		// モーダルの外側を触るとモーダルを閉じる
		window.addEventListener('click', (e) => {
    if (e.target === modalThird) {
        modalThird.style.display = 'none';
        messageDefault.style.display = 'block';
		number.style.display ='block';
    }
    });