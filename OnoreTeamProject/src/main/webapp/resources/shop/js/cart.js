
// 체크박스 체크 액션
const check_all = document.getElementById('check_all');
const check_boxes = document.getElementsByClassName('check');

// 상품 구매 금액
const product_total_price = document.getElementById('product_total_price');
// 총 상품 금액
const total_price = document.getElementById('total_price');
// 계산에 활용할 변하지 않는 총 상품 금액
const whole_price = document.getElementById('whole_price');

// 선택 상품 삭제시 필요한 장바구니 번호 리스트 (hidden)
const selected_list_1 = document.getElementById('selected_list_1');
// 선택 상품 주문시 필요한 장바구니 번호 리스트 (hidden)
const selected_list_2 = document.getElementById('selected_list_2');
// 전체 상품 주문시 필요한 장바구니 번호 리스트 (hidden)
const cart_num_list = document.getElementById('cart_num_list');


// 카트에 담은 상품별 금액 * 수량
const cart_product_prices = document.getElementsByClassName('cart_product_price');

// 계산한 총 금액을 담을 변수
let total = 0;

// 선택한 상품들을 모아놓을 리스트
let selected = [];
for(i = 0; i < check_boxes.length; i++) {
	selected[i] = check_boxes[i].value;	
}
selected_list_1.value = selected.toString();
selected_list_2.value = selected.toString();
cart_num_list.value = selected.toString();


// 전체 체크 액션
check_all.addEventListener('click', ()=> {
	selected = [];
	if(check_all.checked === true) {
		for(i = 0; i < check_boxes.length; i++) {
			check_boxes[i].checked = true;
			total += parseInt(cart_product_prices[i].innerText);
			selected[i] = check_boxes[i].value;
		}
	} else {
		for(i = 0; i < check_boxes.length; i++) {
			check_boxes[i].checked = false;
			total = 0;
		}
	}
	console.log(selected.toString());
	selected_list_1.value = selected.toString();
	selected_list_2.value = selected.toString();
	product_total_price.innerText = total;
	total_price.innerText = total;
});

// 개별 체크 액션
for(i = 0; i < check_boxes.length; i++) {
	check_boxes[i].addEventListener('click', () => {
		for(j = 0; j < check_boxes.length; j++) {
			if(check_boxes[j].checked === false) {
				check_all.checked = false;
				break;
			}
			check_all.checked = true;
		}
		
		total = 0;
		selected = [];
		for(j = 0; j < check_boxes.length; j++) {
			if(check_boxes[j].checked === true) {
				total += parseInt(cart_product_prices[j].innerText);
				if(check_boxes[j].value != null) {
					selected.push(check_boxes[j].value);
				}
			}
		}
		
		console.log(selected.toString());
		selected_list_1.value = selected.toString();
		selected_list_2.value = selected.toString();
		product_total_price.innerText = total;
		total_price.innerText = total;
	});
}


