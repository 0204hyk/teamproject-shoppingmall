const ajaxBtn1 = document.getElementById('ajax-boots');
const ajaxBtn2 = document.getElementById('ajax-loafers');



const ajaxOut1 = document.getElementById('img1');
const ajaxOut2 = document.getElementById('img2');
const ajaxOut3 = document.getElementById('img3');
const ajaxOut4 = document.getElementById('img4');
const ajaxOut5 = document.getElementById('img5');
const ajaxOut6 = document.getElementById('img6');

ajaxBtn1.addEventListener('click', (e) => {

    const xhttp = new XMLHttpRequest();

    xhttp.addEventListener('readystatechange', (e) => {
        if (xhttp.readyState == 4 && xhttp.status == 200) {
			const obj = JSON.parse(xhttp.responseText);
           	ajaxOut1.innerHTML = `<img src=${obj[0].product_thumbnail}/>`;
			ajaxOut2.innerHTML = `<img src=${obj[1].product_thumbnail}/>`;
			ajaxOut3.innerHTML = `<img src=${obj[2].product_thumbnail}/>`;
			ajaxOut4.innerHTML = `<img src=${obj[3].product_thumbnail}/>`;
			ajaxOut5.innerHTML = `<img src=${obj[4].product_thumbnail}/>`;
			ajaxOut6.innerHTML = `<img src=${obj[5].product_thumbnail}/>`;
        }
    });
	
	ajaxOut1.addEventListener('mouseenter', (e) => {
		const obj = JSON.parse(xhttp.responseText);

		console.log(`<fmt:formatNumber value=${obj[0].product_price} pattern='#,###'/>`);
		ajaxOut1.style.opacity = 0.3;
		ajaxOut1.innerHTML = `<img src=${obj[0].product_thumbnail}/>`;
	});
	
	ajaxOut2.addEventListener('mouseenter', (e) => {
		const obj = JSON.parse(xhttp.responseText);
		ajaxOut2.style.opacity = 0.3;
		ajaxOut2.innerHTML = `${obj[1].product_price}원<img src=${obj[1].product_thumbnail}/>`;
	});
	
	ajaxOut3.addEventListener('mouseenter', (e) => {
		const obj = JSON.parse(xhttp.responseText);
		ajaxOut3.style.opacity = 0.3;
		ajaxOut3.innerHTML = `${obj[2].product_price}원<img src=${obj[2].product_thumbnail}/>`;
	});
	
	ajaxOut4.addEventListener('mouseenter', (e) => {
		const obj = JSON.parse(xhttp.responseText);
		ajaxOut4.style.opacity = 0.3;
		ajaxOut4.innerHTML = `${obj[3].product_price}원<img src=${obj[3].product_thumbnail}/>`;
	});
	
	ajaxOut5.addEventListener('mouseenter', (e) => {
		const obj = JSON.parse(xhttp.responseText);
		ajaxOut5.style.opacity = 0.3;
		ajaxOut5.innerHTML = `${obj[4].product_price}원<img src=${obj[4].product_thumbnail}/>`;
	});
	
	ajaxOut6.addEventListener('mouseenter', (e) => {
		const obj = JSON.parse(xhttp.responseText);
		ajaxOut6.style.opacity = 0.3;
		ajaxOut6.innerHTML = `${obj[5].product_price}원<img src=${obj[5].product_thumbnail}/>`;
	});
	
	ajaxOut1.addEventListener('mouseleave', (e) => {
		const obj = JSON.parse(xhttp.responseText);
		ajaxOut1.style.opacity = 1;
		ajaxOut1.innerHTML = `<img src=${obj[0].product_thumbnail}/>`;
	});
	
	ajaxOut2.addEventListener('mouseleave', (e) => {
		const obj = JSON.parse(xhttp.responseText);
		ajaxOut2.style.opacity = 1;
		ajaxOut2.innerHTML = `<img src=${obj[1].product_thumbnail}/>`;
	});
	
	ajaxOut3.addEventListener('mouseleave', (e) => {
		const obj = JSON.parse(xhttp.responseText);
		ajaxOut3.style.opacity = 1;
		ajaxOut3.innerHTML = `<img src=${obj[2].product_thumbnail}/>`;
	});
	
	ajaxOut4.addEventListener('mouseleave', (e) => {
		const obj = JSON.parse(xhttp.responseText);
		ajaxOut4.style.opacity = 1;
		ajaxOut4.innerHTML = `<img src=${obj[3].product_thumbnail}/>`;
	});
	
	ajaxOut5.addEventListener('mouseleave', (e) => {
		const obj = JSON.parse(xhttp.responseText);
		ajaxOut5.style.opacity = 1;
		ajaxOut5.innerHTML = `<img src=${obj[4].product_thumbnail}/>`;
	});
	
	ajaxOut6.addEventListener('mouseleave', (e) => {
		const obj = JSON.parse(xhttp.responseText);
		ajaxOut6.style.opacity = 1;
		ajaxOut6.innerHTML = `<img src=${obj[5].product_thumbnail}/>`;
	});
	
	
	
    xhttp.open('GET', '/project/restful/boots');
    xhttp.send();
});

ajaxBtn2.addEventListener('click', (e) => {

    const xhttp = new XMLHttpRequest();
    xhttp.addEventListener('readystatechange', (e) => {
 
        if (xhttp.readyState == 4 && xhttp.status == 200) {
       		const obj = JSON.parse(xhttp.responseText);

           		ajaxOut1.innerHTML = `<img src=${obj[0].product_thumbnail}/>`;
           		ajaxOut2.innerHTML = `<img src=${obj[1].product_thumbnail}/>`;
           		ajaxOut3.innerHTML = `<img src=${obj[2].product_thumbnail}/>`;
           		ajaxOut4.innerHTML = `<img src=${obj[3].product_thumbnail}/>`;
           		ajaxOut5.innerHTML = `<img src=${obj[4].product_thumbnail}/>`;
           		ajaxOut6.innerHTML = `<img src=${obj[5].product_thumbnail}/>`;

        }
    });

    xhttp.open('GET', '/project/restful/loafers');

    xhttp.send();
});

