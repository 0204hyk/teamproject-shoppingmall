const ajaxBtn1 = document.getElementById('ajax-boots');
const ajaxOut = document.getElementById('ajax-out');

ajaxBtn1.addEventListener('click', (e) => {

    const xhttp = new XMLHttpRequest();
    xhttp.addEventListener('readystatechange', (e) => {
 
        if (xhttp.readyState == 4 && xhttp.status == 200) {
       		const obj = JSON.parse(xhttp.responseText);
            for (var i = 0; i < obj.length; i++) {
            	console.log('요청 성공!', obj);
           		ajaxOut.innerHTML += <img src="obj[i].product_path + obj.[i].product_thumbnail" />;
            }
        }

    });

    xhttp.open('GET', '/project/restful/test1');

    xhttp.send();
});


