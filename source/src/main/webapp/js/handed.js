/**
 * 
 */
 
 		var modal = document.getElementById('modal');
		var btn = document.getElementById('modal(1)');
		var btn2 = modal.getElementById('modal(2)');
		var messageDefalut = document.getElementById('message-defalut')


				//ボタンをクリックするとモーダル表示
		btn.onclick = function() {
			modal.style.display = 'flex';
		};
		
		btn.onclick = function(){
			messageDefalut.style.display = 'none'
		};
		
		

		// ×を押すとモーダルを閉じる
		btn2.onclick = function() {
			modal.style.display = 'none';
		};

		// モーダルの外側を触るとモーダルを閉じる
		window.onclick = function(event) {
			if (event.target == modal) {
				// Which means he clicked somewhere in the modal (background area), but not target = modal-content
				modal.style.display = 'none';
			}
		};