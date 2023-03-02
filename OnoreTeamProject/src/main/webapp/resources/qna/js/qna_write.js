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
		
	if (value == '상품') {
		input.innerHTML += `<input type="text" name="product_name" id="product" placeholder="상품명을 입력하세요."/><input type="button" id="search" value="검색하기" />`;
		const searchBtn = document.getElementById('search');
		searchBtn.addEventListener('click', (e) => {
			let xhttp = new XMLHttpRequest();	
   			xhttp.addEventListener('readystatechange', (e) => {
        		if (xhttp.readyState == 4 && xhttp.status == 200) {
					let obj = JSON.parse(xhttp.responseText);
					var value = document.getElementById('product');
 				
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




