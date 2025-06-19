 
//商品データ取得
fetch('/E2/MenuServlet')
    .then(response => response.json())
    .then(data => {
	
	let productList = JSON.parse(JSON.stringify(data));
	
	console.log(productList);
	
	productList.forEach(obj => { disp(obj) });
})
.catch(error => console.error('Error:', error));
 
 function disp(obj){
	//メニュー表示エリア取得
 	const menuArea = document.getElementById("menuArea");
 	
 	const productDiv = document.createElement("div");
 	productDiv.classList.add("product");
 	
 	const imgDiv = document.createElement("div");
 	imgDiv.classList.add("product-picture");
 	
 	const imgTag = document.createElement("img");
 	imgTag.src = "image/" + obj.imageUrl;
 	
 	const infoDiv = document.createElement("div");
 	infoDiv.classList.add("product-info");
 	
 	const nameElem = document.createElement("p");
 	nameElem.textContent = obj.productName;
 	nameElem.classList.add("product-name");
 	
 	const expElem = document.createElement("p");
 	expElem.textContent = obj.productDetail;
 	expElem.classList.add("product-detail");
 	
 	const priceElem = document.createElement("p");
 	priceElem.textContent = obj.price + "円";
 	priceElem.classList.add("product-price");
 	
 	imgDiv.appendChild(imgTag);
 	infoDiv.appendChild(nameElem);
 	infoDiv.appendChild(expElem);
 	infoDiv.appendChild(priceElem);
 	productDiv.appendChild(imgDiv);
 	productDiv.appendChild(infoDiv);
 	menuArea.appendChild(productDiv);
}