const total_price = document.getElementById('total_price');
const total_discount = document.getElementById('total_discount');
const discount_points_btn = document.getElementById('discount_points_btn');
const discount_points = document.getElementById('discount_points');
const discount_coupon = document.getElementById('discount_coupon');
const coupon = document.getElementById('coupon');

let coupon_value = null;

// 쿠폰 할인
const discount = (target) => {
	coupon_value = target.value;
	if(discount_points.value == null) {
		pay_price.value = (total_price.value - total_price.value * target.value);
	} else {
		pay_price.value = (total_price.value - total_price.value * coupon_value) - discount_points.value;
	}
		// 쿠폰 할인 적용 후 총 할인 금액 표시
		total_discount.value = (total_price.value - pay_price.value);
		discount_coupon.value = coupon.options[coupon.selectedIndex].text;
}

// 적립금 할인
discount_points_btn.addEventListener('click', ()=> {
	if(coupon_value == null) {
		pay_price.value = total_price.value - discount_points.value;
	} else {
		pay_price.value = (total_price.value - total_price.value * coupon_value) - discount_points.value;
	}
		// 적립금 할인 적용 후 총 할인 금액 표시
		total_discount.value = total_price.value - pay_price.value;
});



