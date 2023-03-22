
// 체크박스 체크 액션
const check_all = document.getElementById('check_all');
const check_boxes = document.getElementsByClassName('check');

// 상품 구매 금액
const product_total_price = document.getElementById('product_total_price');
// 총 상품 금액
const total_price = document.getElementById('total_price'); // hidden
const total_price_txt = document.getElementById('total_price_txt'); // span
// 계산에 활용할 변하지 않는 총 상품 금액
const whole_price = document.getElementById('whole_price');

// 선택 상품 삭제시 필요한 장바구니 번호 리스트 (hidden)
const selected_list_1 = document.getElementById('selected_list_1');
// 선택 상품 주문시 필요한 장바구니 번호 리스트 (hidden)
const selected_list_2 = document.getElementById('selected_list_2');
// 전체 상품 주문시 필요한 장바구니 번호 리스트 (hidden)
const cart_num_list = document.getElementById('cart_num_list');

// 선택 상품 삭제 버튼
const delete_selected_btn = document.getElementById('delete_selected_btn');
// 장바구니 비우기 버튼
const delete_all_btn = document.getElementById('delete_all_btn');
// 선택 상품 주문 버튼
const order_selected_btn = document.getElementById('order_selected_btn');
// 모든 상품 주문 버튼
const order_all_btn = document.getElementById('order_all_btn');

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
console.log(cart_num_list.value);


// 전체 체크 액션
check_all.addEventListener('click', ()=> {
	selected = [];
	if(check_all.checked === true) {
		for(i = 0; i < check_boxes.length; i++) {
			check_boxes[i].checked = true;
			total += parseInt(cart_product_prices[i].value);
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
	product_total_price.innerText = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '원';
	total_price_txt.innerText = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '원';
	total_price.value = total;
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
				total += parseInt(cart_product_prices[j].value);
				if(check_boxes[j].value != null) {
					selected.push(check_boxes[j].value);
				}
			}
		}
		
		console.log(selected.toString());
		selected_list_1.value = selected.toString();
		selected_list_2.value = selected.toString();
		product_total_price.innerText = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '원';
		total_price_txt.innerText = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '원';
		total_price.value = total;
	});
}
// 제거 폼
const delete_form = document.getElementById('delete_form');
// 선택 상품 지우기
delete_selected_btn.addEventListener('click', (e) => {
	if(selected.toString() == '' || selected == []) {
		alert('제거할 상품을 선택해 주세요');
	} else {
		delete_form.action = contextPath + '/shop/delete_selected_cart';
		delete_form.method = 'POST';
		delete_form.submit();
	}
});

// 장바구니 비우기
delete_all_btn.addEventListener('click', () => {
	if(cart_num_list.value == '') {
		alert('장바구니가 이미 비어있습니다.');
	} else {
		delete_form.action = contextPath + '/shop/delete_all_cart';
		delete_form.method = 'POST';
		delete_form.submit();
	}
});

// 선택 상품 주문 폼
const order_selected_form = document.getElementById('order_selected_form');
// 선택 상품 주문
order_selected_btn.addEventListener('click', () => {
	if(selected.toString() == '' || selected == []) {
		alert('주문할 상품을 선택해 주세요');
	} else {
		order_selected_form.action = contextPath + '/order/from_cart';
		order_selected_form.method = 'POST';
		order_selected_form.submit();
	}
});

// 모든 상품 주문 폼
const order_all_form = document.getElementById('order_all_form');
// 모든 상품 주문
order_all_btn.addEventListener('click', () => {
	if(cart_num_list.value == '') {
		alert('주문할 상품이 없습니다.');
	} else {
		order_all_form.action = contextPath + '/order/from_cart';
		order_all_form.method = 'POST';
		order_all_form.submit();
	}
});
