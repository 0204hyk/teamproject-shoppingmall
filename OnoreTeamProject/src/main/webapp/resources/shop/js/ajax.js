const categoryAll = document.getElementById('ajax-all');
const derbyBtn = document.getElementById('ajax-derby');
const bootsBtn = document.getElementById('ajax-boots');
const loaferBtn = document.getElementById('ajax-loafer');
const snakersBtn = document.getElementById('ajax-snakers');

const imgOut1 = document.getElementById('img1');
const imgOut2 = document.getElementById('img2');
const imgOut3 = document.getElementById('img3');
const imgOut4 = document.getElementById('img4');
const imgOut5 = document.getElementById('img5');
const imgOut6 = document.getElementById('img6');
const imgOut7 = document.getElementById('img7');
const imgOut8 = document.getElementById('img8');
const imgOut9 = document.getElementById('img9');

const imgInfo = document.getElementsByClassName('img-info');

const xhttp = new XMLHttpRequest();



derbyBtn.addEventListener('click', (e) => {
	
   	xhttp.addEventListener('readystatechange', (e) => {
   
        if (xhttp.readyState == 4 && xhttp.status == 200) {
			const obj = JSON.parse(xhttp.responseText);
				for ( i = 0; i < obj.length; ++i) {
					const onoreImg = document.getElementsByClassName('img-container')[i];
					onoreImg.innerHTML += `<img src=${obj[i].product_thumbnail} class='imgs' />`;	
					const number = `${obj[i].product_num }`;
					
					const test = document.getElementsByClassName('test')[i];
 					test.innerHTML += `<h4>${obj[i].product_name}</h4>`; 
 					test.innerHTML += `<h5>${obj[i].product_price}원</h5>`;
 		
					test.style.display = 'none';
					
					
					
					onoreImg.addEventListener('mouseenter', (e) => {
						const image = document.getElementsByClassName('imgs');
						
					
						test.style.display = 'initial';
						

					});
					
					
					onoreImg.addEventListener('mouseleave', (e) => {
						onoreImg.style.opacity = '1';
						test.style.display = 'none';
						
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







	
	
	
	
	