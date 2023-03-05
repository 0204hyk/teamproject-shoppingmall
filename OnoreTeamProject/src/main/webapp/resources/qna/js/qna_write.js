const input = document.getElementById('image');

input.addEventListener('change', (e) => {
const input = document.getElementById('file-list');
	
	   	 
	 for (var i = 0; i <= 2; i++) {
	   	if (i == 0) {
    		input.innerHTML = `<input type='file' name='file' class='img-input' id='image2' accept="image/*" onchange="PreviewImage2();"/><br>`;
	    } else if (i == 1) {
	    	input.innerHTML += `<input type='file' name='file' class='img-input' id='image3' accept="image/*" onchange="PreviewImage3();" />`;
	   	} else if (i == 2) {
	    	alert('첨부파일은 최대 3개까지 가능합니다.');
	   	}
	 }
	 
	 

});

const imageBox = document.getElementsByClassName('img-input')[0];

function PreviewImage() {
	
	var preview = new FileReader();
	preview.onload = function (e) {
	
		document.getElementById('user-image1').src = e.target.result;
		
	};
					
	preview.readAsDataURL(document.getElementById('image').files[0]);

	



};


function PreviewImage2() {

	var preview = new FileReader();
	preview.onload = function (e) {
	
		document.getElementById('user-image2').src = e.target.result;
		
	};
					
	preview.readAsDataURL(document.getElementById('image2').files[0]);

};

function PreviewImage3() {

	var preview = new FileReader();
	preview.onload = function (e) {
	
		document.getElementById('user-image3').src = e.target.result;
		
	};
					
	preview.readAsDataURL(document.getElementById('image3').files[0]);

};



function changeSelect() {
		
	const itemSelect = document.getElementById('select');
	var value = itemSelect.options[itemSelect.selectedIndex].value;
	var input = document.getElementById('inputs');
	var product_num = document.getElementById('p_num');
	if (value == '상품') {
		input.innerHTML += `<input type="search" name="product_name" id="product" placeholder="상품명을 입력하세요." /><input type="button" id="search" value="검색하기" />`;
		input.innerHTML += `<div id="searchInput"></div>`;
	
		const searchBtn = document.getElementById('search');
		searchBtn.addEventListener('click', (e) => {
			let xhttp = new XMLHttpRequest();	
   			xhttp.addEventListener('readystatechange', (e) => {
        		if (xhttp.readyState == 4 && xhttp.status == 200) {
					let obj = JSON.parse(xhttp.responseText);
					var value = document.getElementById('product');
 					var searchInput = document.getElementById('searchInput');
 					for (var i = 0; i < obj.length; ++i) {
 						searchInput.innerHTML += `<div class="selectProduct"><input type="hidden" value=${obj[i].product_num} /><img id="searchImg" src=${obj[i].product_thumbnail}  /> <span class="product_name">${obj[i].product_name}</span></div>`;
 					}
 					
 					
 					
 					var len = document.getElementsByClassName('selectProduct').length;
 				
 					for (var j = 0; j < len; ++j) {
 						var selected = document.getElementsByClassName('selectProduct')[j];
 						var product_name = document.getElementsByClassName('product_name')[j];
 				
 						selected.addEventListener('click', (e) => {
					
							product_num.value = (e.target.children[0].defaultValue);
							value.value = e.target.innerText;
							searchInput.innerHTML = '';
							
 						});
 						
 					}	

 					product.addEventListener('click', (e) => {
 						
 						searchInput.innerHTML = '';
 						
 					});
				}	
		
		});
		var value = document.getElementById('product');
		var val = value.value;
		xhttp.open('GET', '/project/restful/getProductName/' + val);
   	 	xhttp.send();

	});

	} else {
		input.innerHTML = '';
	}
}





