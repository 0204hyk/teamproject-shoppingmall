const purchase_btn = document.getElementById("purchase_btn");
const payment_method = document.querySelector('input[name="pay_method"]:checked').value;
const order_name = document.getElementById('order_name');
const pay_price = document.getElementById('pay_price');
const orderer_name = document.getElementById('orderer_name');

const urlParams = new URL(location.href).searchParams;
const success = urlParams.get('success');

if(is_purchased == null) {
	purchase_btn.addEventListener('click', (e) => {
			// // 해당 이벤트의 기본 동작을 막을 수 있다.
			// e.preventDefault();
			
			// // form태그에 이벤트를 붙인 것이므로 e.target은
			// // submit 이벤트가 발생한 해당 폼 태그를 의미한다.
			
			// // 폼 내부의 모든 요소들
			// const form = document.getElementById("order_form");
			// const elements = document.getElementById("order_form").elements;
	
			// const name_regex = /^[가-힣a-zA-Z]{2,}[a-zA-Z\s]{0,}$/;
			// const phone_regex =  /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/;
			// const email_regex = /^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/;
			
			// for(j = 0; j < elements.length; ++j) {
			// 	const element = elements[j];
			// 	// name 속성이 존재하는 태그들만 불러온다. (submit 버튼은 체크할 필요 없다)
			// 	if (element.name === '' || element.type === 'submit') {
			// 		console.log('continue.');
			// 		continue;
			// 	}
				
			// 	// 모든 입력항목은 비어있으면 안된다.(배송 요청사항, 할인 쿠폰, 적립금 제외)
			// 	if ((element.value == null || element.value == '')
			// 									&& element.name != 'receiver_req'
			// 									&& element.name != 'discount_coupon'
			// 									&& element.name != 'discount_points'
			// 									&& element.name != 'paid_price') {
			// 		window.alert(element.name + ' is empty!!');
					
			// 		// focus() : 해당 요소로 커서를 옮긴다.
			// 		element.focus();
			// 		return;
			// 	}
				
			// 	// 이름이 비어있지 않더라도 '-'없이 11글자가 아니라면 X
			// 	if(element.name == ('orderer_name') && element.value.length >= 2) {
			// 		const is_valid = name_regex.test(element.value);
			// 		if(is_valid == false) {
			// 			window.alert('Name must contains only letters')
			// 			element.focus();
			// 			return;
			// 		}
			// 	} else if ((element.name == ('orderer_name') || element.name == ('receiver_name')) && element.value.length < 2) {
			// 		window.alert('Name must be longer than 2');
			// 		element.focus();
			// 		return;
			// 	}
				
			// 	// 핸드폰 번호가 비어있지 않더라도 '-'없이 11글자가 아니라면 X
			// 	if (element.name == ('orderer_phone') && element.value.length == 11) {
			// 		const is_valid = phone_regex.test(element.value);
			// 		if(is_valid == false) {
			// 			window.alert('phone number must contains digits only')
			// 			element.focus();
			// 			return;
			// 		}
			// 	} else if (element.name == ('orderer_phone') && (element.value.length > 11 || element.value.length < 11)) {
			// 		window.alert("phone number must be 11 characters");
			// 		element.focus();
			// 		return;
			// 	}
				
			// 	// 이메일이 비어있지 않더라도 '@'부터 뒷 글자가 도메인 주소 형식이 아니면 X
			// 	if (element.name == ('orderer_email')) {
			// 		const is_valid = email_regex.test(element.value);
			// 		if(is_valid == false) {
			// 			window.alert("email must contains domain name after '@' ")
			// 			element.focus();
			// 			return;
			// 		}
			// 	}
			// }
			
			// 검사가 끝난 후 최종적으로 결제 진행
			tossPay();
		});
	} else if (is_purchased == 'true') {
		const purchase_submit = document.getElementById('purchase_submit');
		const form = document.getElementById('order_form');
		
		purchase_submit.addEventListener('click', () => {
			console.log(payment_key.value);
			console.log(order_id.value);
			console.log(amount.value);
			fetch('https://api.tosspayments.com/v1/payments/confirm', {
				method: 'POST',
				headers: { 
					'Authorization': 'Basic dGVzdF9za196WExrS0V5cE5BcldtbzUwblgzbG1lYXhZRzVSOg==',
					'Content-Type': 'application/json'
				},
				body: JSON.stringify({
					'paymentKey': payment_key.value,
					'orderId': order_id.value,
					'amount': amount.value
				})
			}).then((data) => {
				const xhttp = new XMLHttmpRequest();
				
				xhttp.addEventListener('readystatechange', (e) => {
					if (xhttp.readyState == 4 && xhttp.status == 200) {
						form.action = '/puchaseAPI/order/result';
						form.method = 'POST';
						form.submit();
					}
				});
				
				xhttp.open('POST', '/order/approve');
				
				const pay_data = {
					pay_id: 'pay_' + getToday(),
					order_id: order_id.value,
					pay_price: pay_price.value,
					pay_method: payment_method,
					refund_req: 0,
					refund_status: 0
				}
				
				xhttp.send(JSON.stringify(pay_data));
		})
		  .catch((error) => alert(error.json().code));  
	});
}
