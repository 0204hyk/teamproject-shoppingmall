
// 선택한값 보여주는 함수
const showValue = (target) => {
    const value = target.value;
    console.log(value);
}

const sizes = document.getElementById('size');
const heels = document.getElementById('heel');
const soles = document.getElementById('sole');

const op = document.getElementById('select');
const cntinfo = document.getElementById('cntinfo');
const priceinfo = document.getElementById('priceinfo');

const prices = document.getElementById('price').innerText;
const price = prices.replace(/[^0-9]/g, '');
const price2 = prices.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');

const name = document.getElementById('product_name').innerText;

const order_cnt = document.getElementById('order_cnt');

const cnt = document.getElementById('result');

const plus = document.getElementById('plus');
const minus = document.getElementById('minus');

const prd_num = document.getElementById('product_num').value;
const mem_id = document.getElementById('mem_id').innerText;

const order = document.getElementById('order');
const cart = document.getElementById('cart');

const cart_product_price = document.getElementById('cart_product_price');
const dialog = document.getElementById('cart_dialog');

function close_dialog() {
	dialog.close();
}

function count(type) {

    let number = cnt.innerText; 

    if (type === 'plus') {

        number = parseInt(number) + 1;

    } else if (type === 'minus') {
        if(number > 1) {
            number = parseInt(number) - 1; 
        } else {
            number = 1;
        }
       
    }

    cnt.innerText = number;

    cntinfo.innerHTML = number + "개";
    priceinfo.innerHTML = (number * price).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '원';
    cart_product_price.value = number * price;
    order_cnt.value = number;
    console.log(order_cnt);
};

sizes.addEventListener('click', ()=> {
	if (mem_id === '') {
			if(confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")) {
				location.href=contextPaht + '/login'
			} else {
				event.preventDefault();
			}
		}
}); 

const review_btn = document.getElementById('review');
const qna_btn = document.getElementById('qna');

review_btn.addEventListener('click', (e) => {
	if (mem_id === '') {
			if(confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")) {
				location.href='/project/login'
			} else {
				e.preventDefault();
				e.stopPropagation(); 
			}
	} else {
		location.href='../review/write?product_num=' + prd_num 
	}
	
});

qna_btn.addEventListener('click', (e) => {
	if (mem_id === '') {
			if(confirm("로그인이 필요한 서비스입니다. 로그인 하시겠습니까?")) {
				location.href='/project/login'
			} else {
				e.preventDefault();
				e.stopPropagation(); 
			}
	} else {
		location.href='../qna/qna_write?product_num=' + prd_num 
	}
	
});

let size = sizes.options[sizes.selectedIndex].value;
let heel = heels.options[heels.selectedIndex].value;
let sole = soles.options[soles.selectedIndex].value;

// 사이즈
sizes.addEventListener('change', (e) => {
    size = sizes.options[sizes.selectedIndex].value;
    if (size != 'default') {
        heels.removeAttribute("disabled");
        // 힐
        heels.addEventListener('change', (e) => {
            heel = heels.options[heels.selectedIndex].value;
            if (heel != 'default') {
                soles.removeAttribute("disabled");
                // 밑창
                soles.addEventListener('change', (e) => {
                    sole = soles.options[soles.selectedIndex].value;
                    if (sole != 'default') {
                       
                       /* op.innerHTML ="<div id='box'>" + "<hr>" + "<span>" + name + "&nbsp;&nbsp;[" + size + "/" + heel + "/" + sole + "]</span>" 
                        + "<br>" + "<div id='a'>" + price + " 원 &nbsp;&nbsp;&nbsp;&nbsp; <i class='fa-solid fa-xmark fa-lg' id='cancel'></i> </div>" 
                        + "</div>"
                        ;
                        cnt.style.display = "";

                        console.log(cnt.innerText); */

						plus.removeAttribute("disabled");
						minus.removeAttribute("disabled");
						
                        cntinfo.innerHTML = cnt.innerText + "개";
                        priceinfo.innerHTML = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '원';
                        cart_product_price.value = price;

						cart.removeAttribute("disabled");
						order.removeAttribute("disabled");

                    } else {
                    	cart.setAttribute("disabled", "true");
						order.setAttribute("disabled", "true");
                    }
                });
            } else {
            	soles.selectedIndex = 0;
            	soles.setAttribute("disabled", "true");
            	cart.setAttribute("disabled", "true");
				order.setAttribute("disabled", "true");
            }
        });
    } else {
        heels.selectedIndex = 0;
        soles.selectedIndex = 0;
    	heels.setAttribute("disabled", "true");
    	soles.setAttribute("disabled", "true");
    	cart.setAttribute("disabled", "true");
		order.setAttribute("disabled", "true");
    }
});

const detailView = document.getElementById('detailView');
const detail = document.getElementsByClassName('mid')[0];

const reviewView= document.getElementById('reviewView');
const review = document.getElementsByClassName('review')[0];

const qnaView= document.getElementById('qnaView');
const qna = document.getElementsByClassName('qna')[0];

/* detailView.addEventListener('click', () => {
    window.scrollBy({top: detail.getBoundingClientRect().top, behavior: 'smooth'});
});

reviewView.addEventListener('click', () => {
    window.scrollTo({top: qna.getBoundingClientRect().top, behavior: 'smooth'});
});

qnaView.addEventListener('click', () => {
    window.scrollBy({top: qna.getBoundingClientRect().top, behavior: 'smooth'});
}); */

function move(name) {
	window.scrollBy({top: name.getBoundingClientRect().top, behavior: 'smooth'});
}

const nowish = document.getElementById('nowish'); // 빈하트
const wish = document.getElementById('wish'); // 가득찬하트

nowish.addEventListener('click', (e) => {
	if(mem_id !== '') {
	    const xhttp = new XMLHttpRequest();
	    xhttp.addEventListener('readystatechange', (e) =>{
	        if (e.target.readyState == 4 && e.target.status == 200) {
	        	console.log('찜하기');
	            nowish.style.display="none";
	            wish.style.display="";
	        }
	    });
	    
	    xhttp.open('POST', contextPath + '/wish');
	    xhttp.setRequestHeader('Content-type', 'application/json');
	    
	     const obj = {
	    	product_num : prd_num,
	    	mem_id : mem_id
	    }
	    
	    xhttp.send(JSON.stringify(obj));
	    
    	} else {
	    	if(confirm('로그인이 필요한 서비스입니다 로그인 하시겠습니까?')) {
				location.href=contextPath + '/login';
			}
	     }
});

wish.addEventListener('click', (e) => {
    const xhttp = new XMLHttpRequest();
    xhttp.addEventListener('readystatechange', (e) =>{
    	 console.log('readyState: ', xhttp.readyState);
        console.log('httpStatus: ', xhttp.status);
        if (e.target.readyState == 4 && e.target.status == 200) {
            wish.style.display="none";
            nowish.style.display="";
        }
    });
  
    xhttp.open('POST', contextPath + '/nowish');
    
    xhttp.setRequestHeader('Content-type', 'application/json');
    
    const obj = {
    	product_num : prd_num,
    	mem_id : mem_id
    }
    
    xhttp.send(JSON.stringify(obj));
});

const tb_1 = document.getElementById('tb_1'); // 버튼
const tbi_1 = document.getElementById('tbi_1').value; // img

const tb_2 = document.getElementById('tb_2');
const tbi_2 = document.getElementById('tbi_2').value;

const test = document.getElementById('test');

tb_1.addEventListener('click', (e) =>{
	test.setAttribute('src', tbi_1);
});


tb_2.addEventListener('click', (e) =>{
	test.setAttribute('src', tbi_2);
});

const tb_3 = document.getElementById('tb_3');
const tbi_3 = document.getElementById('tbi_3').value;


tb_3.addEventListener('click', (e) =>{
	test.setAttribute('src', tbi_3)
});