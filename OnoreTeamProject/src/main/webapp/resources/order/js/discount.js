// 총 가격은 주문페이지에서 변할 일이 없기 때문에 parseInt한 채로 값만 받아준다.
const total_price = parseInt(document.getElementById('total_price').value); // 총 가격

const total_discount = document.getElementById('total_discount'); // 총 할인 금액
const discount_points = document.getElementById('discount_points'); // 적립금 입력 text
const discount_coupon = document.getElementById('discount_coupon'); // 쿠폰 hidden
const pay_price_lbl = document.getElementById('pay_price_lbl');
const pay_price_btn = document.getElementById('pay_price_btn');

const mem_points = document.getElementById('mem_points').innerText; // 보유 포인트
const accessible_points = document.getElementById('accessible_points').innerText; // 사용 가능한 포인트

const coupon = document.getElementById('coupon'); // 쿠폰 select
	
let coupon_value = null; // 쿠폰 option value 값

// 쿠폰 할인 (이미 적립금이 적용되어 있다면 초기화 시킨다.)
const discount = (target) => {
	coupon_value = target.value;
	
	// 결제 금액 표시
	pay_price_lbl.value = total_price - total_price * coupon_value; // lbl
	pay_price_btn.innerText = total_price - total_price * coupon_value; // btn
	
	// 적립금 초기화
	discount_points.value = 0;
	
	// 적용 쿠폰 이름 form 전달용
	discount_coupon.value = coupon.options[coupon.selectedIndex].text;
	
	// 쿠폰 할인 적용 후 총 할인 금액 표시
	total_discount.value = (total_price - parseInt(pay_price_lbl.value));
}


const discount_points_btn = document.getElementById('discount_points_btn'); // 적립금 적용 버튼
// 적립금 할인
discount_points_btn.addEventListener('click', ()=> {
	// parseInt 안하고 계산했더니 오류가 있어서 parse 처리
	const mp = parseInt(mem_points); // 회원 보유 포인트
	const dp = parseInt(discount_points.value); // 할인 적용할 포인트
	const ap = parseInt(accessible_points); // 사용 가능한 포인트
	
	// 할인 적용할 포인트(dp)가 회원 보유 포인트(mp)와 사용 가능한 포인트(ap) 보다 작아야한다.
	if(dp > mp) {
		alert('Not enough points');
		return;
	}
	
	if(dp > ap) {
		alert('You have exceeded your accessible points');
		return;
	}

	// 쿠폰 적용 유무에 따라 할인 금액 산정 방식이 달라야 한다.
	if(coupon_value == null) {
		pay_price_lbl.value = total_price - dp;
		pay_price_btn.innerText = total_price - dp;
	} else {
		// 총 할인 금액 (pay_price)
		const pp = (total_price - total_price * coupon_value) - dp;
	
		// 결제 금액이 0보다 낮거나 같으면 안됨
		if(pp > 0) {
			pay_price_lbl.value = pp;
			pay_price_btn.innerText = pp;
		} else {
			alert('The discount amount cannot be higher than the sales amount.');
			return;
		}
	}
	
	// 적립금 할인 적용 후 총 할인 금액 표시
	total_discount.value = total_price - parseInt(pay_price_lbl.value);
});



