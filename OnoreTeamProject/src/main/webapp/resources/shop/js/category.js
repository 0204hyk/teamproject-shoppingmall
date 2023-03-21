const categoryAll = document.getElementById('ajax-all');
const derbyBtn = document.getElementById('ajax-derby');
const bootsBtn = document.getElementById('ajax-boots');
const loaferBtn = document.getElementById('ajax-loafer');
const sneakersBtn = document.getElementById('ajax-sneakers');

const onoreImg = document.getElementsByClassName('img-container')[0];
const info = document.getElementsByClassName('img-info')[0];

window.addEventListener('load', function() {
	let xhttp = new XMLHttpRequest();	
   	xhttp.addEventListener('readystatechange', (e) => {
 	
        if (xhttp.readyState == 4 && xhttp.status == 200) {
			let obj = JSON.parse(xhttp.responseText);
			
				for ( i = 0; i < obj.length; ++i) {
					let onoreImg = document.getElementsByClassName('img-info')[i];
					onoreImg.innerHTML += `<img src=${obj[i].product_thumbnail_1} class='imgs' />`;	
					let number = `${obj[i].product_num }`;
					
					// 상품 가격 변수에 저장 후 정규표현식으로 천원 단위 표현
					let price = `${obj[i].product_price}`;
					let total = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
					
					let onoreInfo = document.getElementsByClassName('img-info2')[i];
 					onoreInfo.innerHTML += `<span class='information'><h4>${obj[i].product_name}</h4><h5>${total}원</h5></span>`;
 					onoreImg.style.opacity = '1';
 					onoreInfo.style.visibility = 'hidden';
					
					onoreImg.addEventListener('mouseenter', (e) => {
						onoreImg.style.opacity = '0.3';
						onoreInfo.style.visibility = 'visible';
					});
					
					onoreImg.addEventListener('mouseleave', (e) => {
						onoreImg.style.opacity = '1';
						onoreInfo.style.visibility = 'hidden';
						
					});
					
					onoreImg.addEventListener('click', (e) => {
						location.href = contextPath + '/shop/detail?product_num=' + number;
					});
				}	
		}
	});
	

	xhttp.open('GET', contextPath + '/restful/all');
    xhttp.send();
});

categoryAll.addEventListener('click', (e) => {
	
	// 상품 카테고리 클릭 시 초기화
	const imgSize = document.getElementsByClassName('imgs').length;
	const imgInfo = document.getElementsByClassName('information').length;
	for (i = 0; i < imgSize; ++i) {
		let onoreImg = document.getElementsByClassName('img-info')[i];
		onoreImg.innerHTML = '';
	 	let onoreInfo = document.getElementsByClassName('img-info2')[i];
		onoreInfo.innerHTML = '';

	}
	
	let xhttp = new XMLHttpRequest();	
	
   	xhttp.addEventListener('readystatechange', (e) => {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
			let obj = JSON.parse(xhttp.responseText);
		
				for ( i = 0; i < obj.length; ++i) {
					let onoreImg = document.getElementsByClassName('img-info')[i];
			
					onoreImg.innerHTML = `<img src=${obj[i].product_thumbnail_1} class='imgs' />`;	
					let number = `${obj[i].product_num }`;
					let price = `${obj[i].product_price}`;
					let total = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
 					let onoreInfo = document.getElementsByClassName('img-info2')[i];
 					onoreInfo.innerHTML += `<span class='information'><h4>${obj[i].product_name}</h4><h5>${total}원</h5></span>`;
 					onoreImg.style.opacity = '1';
 					onoreInfo.style.visibility = 'hidden';
					
					onoreImg.addEventListener('mouseenter', (e) => {
						onoreImg.style.opacity = '0.3';
						onoreInfo.style.visibility = 'visible';
					});
					
					onoreImg.addEventListener('mouseleave', (e) => {
						onoreImg.style.opacity = '1';
						onoreInfo.style.visibility = 'hidden';
						
					});
					
					onoreImg.addEventListener('click', (e) => {
						location.href = contextPath + '/shop/detail/?product_num=' + number;
					});
				}	
		}
	});
	

	xhttp.open('GET', contextPath + '/restful/all');
    xhttp.send();
});


derbyBtn.addEventListener('click', (e) => {
	
	const imgSize = document.getElementsByClassName('imgs').length;
	const imgInfo = document.getElementsByClassName('information').length;
	for (i = 0; i < imgSize; ++i) {
		let onoreImg = document.getElementsByClassName('img-info')[i];
		onoreImg.innerHTML = '';
	 	let onoreInfo = document.getElementsByClassName('img-info2')[i];
		onoreInfo.innerHTML = '';

	}
	
	
	let xhttp = new XMLHttpRequest();	
   	xhttp.addEventListener('readystatechange', (e) => {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
        	
			let obj = JSON.parse(xhttp.responseText);
	
				for ( i = 0; i < obj.length; ++i) {
					let onoreImg = document.getElementsByClassName('img-info')[i];
			
					onoreImg.innerHTML = `<img src=${obj[i].product_thumbnail_1} class='imgs' />`;	
					let number = `${obj[i].product_num }`;
					let price = `${obj[i].product_price}`;
					let total = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
 					let onoreInfo = document.getElementsByClassName('img-info2')[i];
 					onoreInfo.innerHTML += `<span class='information'><h4>${obj[i].product_name}</h4><h5>${total}원</h5></span>`;
					onoreImg.style.opacity = '1';
 					onoreInfo.style.visibility = 'hidden';
					
					onoreImg.addEventListener('mouseenter', (e) => {
						onoreImg.style.opacity = '0.3';
						onoreInfo.style.visibility = 'visible';
					});
					
					onoreImg.addEventListener('mouseleave', (e) => {
						onoreImg.style.opacity = '1';
						onoreInfo.style.visibility = 'hidden';
						
					});
					
					onoreImg.addEventListener('click', (e) => {
						location.href = contextPath + '/shop/detail/?product_num=' + number;
					});
				}	
		}
	});
	 

	xhttp.open('GET', contextPath + '/restful/derby');
    xhttp.send();
});


bootsBtn.addEventListener('click', (e) => {
	
	const imgSize = document.getElementsByClassName('imgs').length;
	const imgInfo = document.getElementsByClassName('information').length;
	for (i = 0; i < imgSize; ++i) {
		let onoreImg = document.getElementsByClassName('img-info')[i];
		onoreImg.innerHTML = '';
	 	let onoreInfo = document.getElementsByClassName('img-info2')[i];
		onoreInfo.innerHTML = '';

	}
	
	let xhttp = new XMLHttpRequest();	
	
   	xhttp.addEventListener('readystatechange', (e) => {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
			let obj = JSON.parse(xhttp.responseText);
		
				for ( i = 0; i < obj.length; ++i) {
					let onoreImg = document.getElementsByClassName('img-info')[i];
			
					onoreImg.innerHTML = `<img src=${obj[i].product_thumbnail_1} class='imgs' />`;	
					let number = `${obj[i].product_num }`;
					let price = `${obj[i].product_price}`;
					let total = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
 					let onoreInfo = document.getElementsByClassName('img-info2')[i];
 					onoreInfo.innerHTML += `<span class='information'><h4>${obj[i].product_name}</h4><h5>${total}원</h5></span>`;
					onoreImg.style.opacity = '1';
 					onoreInfo.style.visibility = 'hidden';
					
					onoreImg.addEventListener('mouseenter', (e) => {
						onoreImg.style.opacity = '0.3';
						onoreInfo.style.visibility = 'visible';
					});
					
					onoreImg.addEventListener('mouseleave', (e) => {
						onoreImg.style.opacity = '1';
						onoreInfo.style.visibility = 'hidden';
						
					});
					
					onoreImg.addEventListener('click', (e) => {
						location.href = contextPath + '/shop/detail/?product_num=' + number;
					});
				}	
		}
	});
	

	xhttp.open('GET', contextPath + '/restful/boots');
    xhttp.send();
});

loaferBtn.addEventListener('click', (e) => {
	
	const imgSize = document.getElementsByClassName('imgs').length;
	const imgInfo = document.getElementsByClassName('information').length;
	for (i = 0; i < imgSize; ++i) {
		let onoreImg = document.getElementsByClassName('img-info')[i];
		onoreImg.innerHTML = '';
	 	let onoreInfo = document.getElementsByClassName('img-info2')[i];
		onoreInfo.innerHTML = '';

	}
	
	let xhttp = new XMLHttpRequest();	
	
   	xhttp.addEventListener('readystatechange', (e) => {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
			let obj = JSON.parse(xhttp.responseText);
		
				for ( i = 0; i < obj.length; ++i) {
					let onoreImg = document.getElementsByClassName('img-info')[i];
			
					onoreImg.innerHTML = `<img src=${obj[i].product_thumbnail_1} class='imgs' />`;	
					let number = `${obj[i].product_num }`;
					let price = `${obj[i].product_price}`;
					let total = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
 					let onoreInfo = document.getElementsByClassName('img-info2')[i];
 					onoreInfo.innerHTML += `<span class='information'><h4>${obj[i].product_name}</h4><h5>${total}원</h5></span>`;
 
 					onoreImg.style.opacity = '1';
 					onoreInfo.style.visibility = 'hidden';
					
					onoreImg.addEventListener('mouseenter', (e) => {
						onoreImg.style.opacity = '0.3';
						onoreInfo.style.visibility = 'visible';
					});
					
					onoreImg.addEventListener('mouseleave', (e) => {
						onoreImg.style.opacity = '1';
						onoreInfo.style.visibility = 'hidden';
						
					});
					
					onoreImg.addEventListener('click', (e) => {
						location.href = contextPath + '/shop/detail/?product_num=' + number;
					});
				}	
		}
	});
	

	xhttp.open('GET', contextPath + '/restful/loafers');
    xhttp.send();
});

sneakersBtn.addEventListener('click', (e) => {
	
	const imgSize = document.getElementsByClassName('imgs').length;
	const imgInfo = document.getElementsByClassName('information').length;
	for (i = 0; i < imgSize; ++i) {
		let onoreImg = document.getElementsByClassName('img-info')[i];
		onoreImg.innerHTML = '';
	 	let onoreInfo = document.getElementsByClassName('img-info2')[i];
		onoreInfo.innerHTML = '';

	}
	
	let xhttp = new XMLHttpRequest();	
	
   	xhttp.addEventListener('readystatechange', (e) => {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
			let obj = JSON.parse(xhttp.responseText);
		
				for ( i = 0; i < obj.length; ++i) {
					let onoreImg = document.getElementsByClassName('img-info')[i];
			
					onoreImg.innerHTML = `<img src=${obj[i].product_thumbnail_1} class='imgs' />`;	
					let number = `${obj[i].product_num }`;
					let price = `${obj[i].product_price}`;
					let total = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
 					let onoreInfo = document.getElementsByClassName('img-info2')[i];
 					onoreInfo.innerHTML += `<span class='information'><h4>${obj[i].product_name}</h4><h5>${total}원</h5></span>`;
 					onoreImg.style.opacity = '1';
 					onoreInfo.style.visibility = 'hidden';
					
					onoreImg.addEventListener('mouseenter', (e) => {
						onoreImg.style.opacity = '0.3';
						onoreInfo.style.visibility = 'visible';
					});
					
					onoreImg.addEventListener('mouseleave', (e) => {
						onoreImg.style.opacity = '1';
						onoreInfo.style.visibility = 'hidden';
						
					});
					
					onoreImg.addEventListener('click', (e) => {
						location.href = contextPath + '/shop/detail/?product_num=' + number;
					});
				}	
		}
	});
	

	xhttp.open('GET', contextPath + '/restful/sneakers');
    xhttp.send();
});	