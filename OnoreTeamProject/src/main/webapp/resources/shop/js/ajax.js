const categoryAll = document.getElementById('ajax-all');
const derbyBtn = document.getElementById('ajax-derby');
const bootsBtn = document.getElementById('ajax-boots');
const loaferBtn = document.getElementById('ajax-loafer');
const snakersBtn = document.getElementById('ajax-snakers');


const xhttp = new XMLHttpRequest();

derbyBtn.addEventListener('click', (e) => {
	
   	xhttp.addEventListener('readystatechange', (e) => {
   
        if (xhttp.readyState == 4 && xhttp.status == 200) {
			const obj = JSON.parse(xhttp.responseText);
				for ( i = 0; i < obj.length; ++i) {
					const onoreImg = document.getElementsByClassName('img-container')[i];
					onoreImg.innerHTML += `<img src=${obj[i].product_thumbnail} class='imgs' />`;	
					const number = `${obj[i].product_num }`;
					
					const info = document.getElementsByClassName('img-info')[i];
 					info.innerHTML += `<h4>${obj[i].product_name}원</h4>`; 
 	
 					info.innerHTML += `${obj[i].product_price}`;
 			
					info.style.display = 'none';
					
					// category.css .test를 img-info로 바꾸면 z-index 적용.
					
					onoreImg.addEventListener('mouseenter', (e) => {
						const image = document.getElementsByClassName('imgs');
						info.style.display = 'initial';
					});
					
					
					onoreImg.addEventListener('mouseleave', (e) => {
						info.style.display = 'none';
						
					});
					
					onoreImg.addEventListener('click', (e) => {
						console.log(number);
						location.href = '/product/shop/detail/' + number;
					});
				}	
		}
	});
	

	xhttp.open('GET', '/project/restful/boots');
    xhttp.send();
});

bootsBtn.addEventListener('click', (e) => {
	
	xhttp.addEventListener('readystatechange', (e) => {
		if (xhttp.readyState == 4 && xhttp.status == 200) {
			const obj = JSON.parse(xhttp.responseText);
				for ( i = 0; i < obj.length; ++i) {
					const onoreImg = document.getElementsByClassName('img-container')[i];
					onoreImg.innerHTML += `<img src=${obj[i].product_thumbnail} class='imgs' />`;	
					const number = `${obj[i].product_num }`;
					
					const info = document.getElementsByClassName('img-info')[i];
 					info.innerHTML += `<h4>${obj[i].product_name}</h4>`; 
 					info.innerHTML += `<fmt:formatNumber value="${obj[i].product_price}" pattern="#,###"/>원`;
 					
					info.style.display = 'none';
					
					// category.css .test를 img-info로 바꾸면 z-index 적용.
					
					onoreImg.addEventListener('mouseenter', (e) => {
						const image = document.getElementsByClassName('imgs');
						info.style.display = 'initial';
					});
					
					
					onoreImg.addEventListener('mouseleave', (e) => {
						info.style.display = 'none';
						
					});
					
					onoreImg.addEventListener('click', (e) => {
						console.log(number);
						location.href = '/product/shop/detail/' + number;
					});
				}	
		}
	
	

	});
	xhttp.open('GET', '/project/restful/loafers');
    xhttp.send();

});





	
	
	
	
	