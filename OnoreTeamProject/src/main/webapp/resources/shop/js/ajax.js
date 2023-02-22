const ajaxBtn1 = document.getElementById('ajax-boots');
const ajaxBtn2 = document.getElementById('ajax-loafers');


const ajaxOut1 = document.getElementById('img');
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
            for (var i = 0; i < obj.length; ++i) {
            	console.log('요청 성공!', obj);
				console.log(obj.length);
           		ajaxOut1.innerHTML = `<img src=${obj[0].product_thumbnail}/>`;
           		ajaxOut2.innerHTML = `<img src=${obj[1].product_thumbnail}/>`;
           		ajaxOut3.innerHTML = `<img src=${obj[2].product_thumbnail}/>`;
           		ajaxOut4.innerHTML = `<img src=${obj[3].product_thumbnail}/>`;
           		ajaxOut5.innerHTML = `<img src=${obj[4].product_thumbnail}/>`;
           		ajaxOut6.innerHTML = `<img src=${obj[5].product_thumbnail}/>`;
            }
        }
    });

    xhttp.open('GET', '/project/restful/boots');

    xhttp.send();
});

ajaxBtn2.addEventListener('click', (e) => {

    const xhttp = new XMLHttpRequest();
    xhttp.addEventListener('readystatechange', (e) => {
 
        if (xhttp.readyState == 4 && xhttp.status == 200) {
       		const obj = JSON.parse(xhttp.responseText);
            for (var i = 0; i < obj.length; ++i) {
            	console.log('요청 성공!', obj);
				console.log(obj.length);
           		ajaxOut1.innerHTML = `<img src=${obj[0].product_thumbnail}/>`;
           		ajaxOut2.innerHTML = `<img src=${obj[1].product_thumbnail}/>`;
           		ajaxOut3.innerHTML = `<img src=${obj[2].product_thumbnail}/>`;
           		ajaxOut4.innerHTML = `<img src=${obj[3].product_thumbnail}/>`;
           		ajaxOut5.innerHTML = `<img src=${obj[4].product_thumbnail}/>`;
           		ajaxOut6.innerHTML = `<img src=${obj[5].product_thumbnail}/>`;
            }
        }
    });

    xhttp.open('GET', '/project/restful/loafers');

    xhttp.send();
});

