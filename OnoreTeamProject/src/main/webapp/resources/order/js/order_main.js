const purchase_btn = document.getElementById("purchase_btn"); // 최종 결제 버튼 (여러 상품 주문)
const purchase_btn_2 = document.getElementById("purchase_btn_2"); // 최종 결제 버튼 (단일 상품 주문)
const payment_method = document.querySelector('input[name="pay_method"]:checked').value; // 결제 방식 radio
const order_name = document.getElementById('order_name'); // 주문 명 div
const orderer_name = document.getElementById('orderer_name'); 

const urlParams = new URL(location.href).searchParams;
const success = urlParams.get('success');

const orderer_name_msg = document.getElementById('orderer_name_msg');
const orderer_phone_msg = document.getElementById('orderer_phone_msg');
const orderer_email_msg = document.getElementById('orderer_email_msg');

const receiver_name_msg = document.getElementById('receiver_name_msg');
const receiver_zip_code_msg = document.getElementById('receiver_zip_code_msg');
const receiver_address_msg = document.getElementById('receiver_address_msg');
const receiver_detail_address_msg = document.getElementById('receiver_detail_address_msg');
const receiver_phone_msg = document.getElementById('receiver_phone_msg');

function toHomePage() {
	if(window.confirm('홈페이지로 이동하시겠습니까? 주문 정보가 사라집니다.')) {
		location.href = 'http://localhost:8888' + contextPath + '/main/';
	}
}

if(purchase_btn != null) {
purchase_btn.addEventListener('click', (e) => {
	// 해당 이벤트의 기본 동작을 막을 수 있다.
	e.preventDefault();
			
	// form태그에 이벤트를 붙인 것이므로 e.target은
	// submit 이벤트가 발생한 해당 폼 태그를 의미한다.
			
	// 폼 내부의 모든 요소들
	const form = document.getElementById("order_form");
	const elements = document.getElementById("order_form").elements;
	
	const name_regex = /^[가-힣a-zA-Z]{2,}[a-zA-Z\s]{0,}$/;
	const phone_regex =  /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/;
	const email_regex = /^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/;
			
	for(j = 0; j < elements.length; ++j) {
		const element = elements[j];
		// name 속성이 존재하는 태그들만 불러온다. (submit 버튼은 체크할 필요 없다)
		if (element.name === '' || element.type === 'submit') {
			 console.log('continue.');
			 continue;
		}
				
		// 모든 입력항목은 비어있으면 안된다.(배송 요청사항, 할인 쿠폰, 적립금 제외)
		if ((element.value == null || element.value == '')
			 									&& element.name != 'receiver_req'
			 									&& element.name != 'discount_coupon'
			 									&& element.name != 'discount_points'
			 									&& element.name != 'paid_price'
			 									&& element.name != 'payment_key'
			 									&& element.name != 'order_id'
			 									&& element.name != 'amount') {
			window.alert(element.name + ' is empty!!');
					
			 //focus() : 해당 요소로 커서를 옮긴다.
			 element.focus();
			 return;
		}
		
		if (element.value == '' && element.name == 'orderer_name') {
			orderer_name_msg.innerText = '이름을 입력하세요';
			element.focus();
			return;
		}
		
		if (element.value == '' && element.name == 'orderer_phone') {
			orderer_phone_msg.innerText = '번호를 입력하세요';
			element.focus();
			return;
		}
		
		if (element.value == '' && element.name == 'orderer_email') {
			orderer_email_msg.innerText = '이메일을 입력하세요';
			element.focus();
			return;
		}
				
		if (element.value == '' && element.name == 'receiver_name') {
			receiver_name_msg.innerText = '수령인을 입력하세요';
			element.focus();
			return;
		}
				
		if (element.value == '' && element.name == 'receiver_zip_code') {
			receiver_zip_code_msg.innerText = '우편번호를 입력하세요';
			element.focus();
			return;
		}
				
		if (element.value == '' && element.name == 'receiver_address') {
			receiver_address_msg.innerText = '주소를 입력하세요';
			element.focus();
			return;
		}
				
		if (element.value == '' && element.name == 'receiver_detail_address') {
			receiver_detail_address_msg.innerText = '상세 주소를 입력하세요';
			element.focus();
			return;
		}
				
		if (element.value == '' && element.name == 'receiver_phone') {
			receiver_phone_msg.innerText = '전화번호를 입력하세요';
			element.focus();
			return;
		}
				
		// 이름이 비어있지 않더라도 '-'없이 11글자가 아니라면 X
		if(element.name == ('orderer_name') && element.value.length >= 2) {
			const is_valid = name_regex.test(element.value);
			if(is_valid == false) {
			orderer_name_msg.innerText = '잘못된 이름입니다. 다시 입력해 주세요';
			 	element.focus();
			 	return;
			 }
		} else if (element.name == ('orderer_name') && element.value.length < 2) {
			 orderer_name_msg.innerText = '잘못된 이름입니다. 다시 입력해 주세요';
			 element.focus();
			 return;
		}
				
		// 핸드폰 번호가 비어있지 않더라도 '-'없이 11글자가 아니라면 X
		if (element.name == ('orderer_phone') && element.value.length == 11) {
			const is_valid = phone_regex.test(element.value);
			if(is_valid == false) {
				orderer_phone_msg.innerText = '잘못된 번호입니다. 다시 입력해 주세요';
			 	//window.alert('phone number must contains digits only')
			 	element.focus();
			 	return;
			 }
		} else if (element.name == ('orderer_phone') && (element.value.length > 11 || element.value.length < 11)) {
			orderer_phone_msg.innerText = '잘못된 번호입니다. 다시 입력해 주세요';
			 element.focus();
			 return;
		}
		
				
		// 이메일이 비어있지 않더라도 '@'부터 뒷 글자가 도메인 주소 형식이 아니면 X
		if (element.name == ('orderer_email')) {
			 const is_valid = email_regex.test(element.value);
			 if(is_valid == false) {
			 	orderer_email_msg.innerText = '잘못된 이메일입니다. 다시 입력해 주세요';
			 	element.focus();
			 	return;
			 }
		}
		
		// 이름이 비어있지 않더라도 '-'없이 11글자가 아니라면 X
		if(element.name == ('receiver_name') && element.value.length >= 2) {
			const is_valid = name_regex.test(element.value);
			if(is_valid == false) {
			receiver_name_msg.innerText = '잘못된 이름입니다. 다시 입력해 주세요';
			 	element.focus();
			 	return;
			 }
		} else if (element.name == ('receiver_name') && element.value.length < 2) {
			 receiver_name_msg.innerText = '잘못된 이름입니다. 다시 입력해 주세요';
			 element.focus();
			 return;
		}
		
		// 핸드폰 번호가 비어있지 않더라도 '-'없이 11글자가 아니라면 X
		if (element.name == ('receiver_phone') && element.value.length == 11) {
			const is_valid = phone_regex.test(element.value);
			if(is_valid == false) {
				receiver_phone_msg.innerText = '잘못된 번호입니다. 다시 입력해 주세요';
			 	element.focus();
			 	return;
			 }
		} else if (element.name == ('receiver_phone') && (element.value.length > 11 || element.value.length < 11)) {
			receiver_phone_msg.innerText = '잘못된 번호입니다. 다시 입력해 주세요';
			 element.focus();
			 return;
		}
		
		// 이메일이 비어있지 않더라도 '@'부터 뒷 글자가 도메인 주소 형식이 아니면 X
		if (element.name == ('receiver_email')) {
			 const is_valid = email_regex.test(element.value);
			 if(is_valid == false) {
			 	receiver_email_msg.innerText = '잘못된 이메일입니다. 다시 입력해 주세요';
			 	element.focus();
			 	return;
			 }
		}
		
		orderer_name_msg.innerText = '';
		orderer_phone_msg.innerText = '';
		orderer_email_msg.innerText = '';
		receiver_name_msg.innerText = '';
		receiver_zip_code_msg.innerText = '';
		receiver_address_msg.innerText = '';
		receiver_detail_address_msg.innerText = '';
		receiver_phone_msg.innerText = '';
	}
	tossPay();	
});
} else if (purchase_btn_2 != null) {
purchase_btn_2.addEventListener('click', (e) => {
	// 해당 이벤트의 기본 동작을 막을 수 있다.
	e.preventDefault();
			
	// form태그에 이벤트를 붙인 것이므로 e.target은
	// submit 이벤트가 발생한 해당 폼 태그를 의미한다.
			
	// 폼 내부의 모든 요소들
	const form = document.getElementById("order_form");
	const elements = document.getElementById("order_form").elements;
	
	const name_regex = /^[가-힣a-zA-Z]{2,}[a-zA-Z\s]{0,}$/;
	const phone_regex =  /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/;
	const email_regex = /^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/;
			
	for(j = 0; j < elements.length; ++j) {
		const element = elements[j];
		// name 속성이 존재하는 태그들만 불러온다. (submit 버튼은 체크할 필요 없다)
		if (element.name === '' || element.type === 'submit') {
			 console.log('continue.');
			 continue;
		}
				
		// 모든 입력항목은 비어있으면 안된다.(배송 요청사항, 할인 쿠폰, 적립금 제외)
		//if ((element.value == null || element.value == '')
		//	 									&& element.name != 'receiver_req'
		//	 									&& element.name != 'discount_coupon'
		//	 									&& element.name != 'discount_points'
		//	 									&& element.name != 'paid_price') {
			//window.alert(element.name + ' is empty!!');
					
			 // focus() : 해당 요소로 커서를 옮긴다.
			// element.focus();
			 //return;
		//}
		
		if (element.value == '' && element.name == 'orderer_name') {
			orderer_name_msg.innerText = '이름을 입력하세요';
			element.focus();
			return;
		}
		
		if (element.value == '' && element.name == 'orderer_phone') {
			orderer_phone_msg.innerText = '번호를 입력하세요';
			element.focus();
			return;
		}
		
		if (element.value == '' && element.name == 'orderer_email') {
			orderer_email_msg.innerText = '이메일을 입력하세요';
			element.focus();
			return;
		}
				
		if (element.value == '' && element.name == 'receiver_name') {
			receiver_name_msg.innerText = '수령인을 입력하세요';
			element.focus();
			return;
		}
				
		if (element.value == '' && element.name == 'receiver_zip_code') {
			receiver_zip_code_msg.innerText = '수령인을 입력하세요';
			element.focus();
			return;
		}
				
		if (element.value == '' && element.name == 'receiver_address') {
			receiver_address_msg.innerText = '주소를 입력하세요';
			element.focus();
			return;
		}
				
		if (element.value == '' && element.name == 'receiver_detail_address') {
			receiver_detail_address_msg.innerText = '상세 주소를 입력하세요';
			element.focus();
			return;
		}
				
		if (element.value == '' && element.name == 'receiver_phone') {
			receiver_phone_msg.innerText = '전화번호를 입력하세요';
			element.focus();
			return;
		}
				
		// 이름이 비어있지 않더라도 '-'없이 11글자가 아니라면 X
		if(element.name == ('orderer_name') && element.value.length >= 2) {
			const is_valid = name_regex.test(element.value);
			if(is_valid == false) {
			orderer_name_msg.innerText = '잘못된 이름입니다. 다시 입력해 주세요';
			 	element.focus();
			 	return;
			 }
		} else if (element.name == ('orderer_name') && element.value.length < 2) {
			 orderer_name_msg.innerText = '잘못된 이름입니다. 다시 입력해 주세요';
			 element.focus();
			 return;
		}
				
		// 핸드폰 번호가 비어있지 않더라도 '-'없이 11글자가 아니라면 X
		if (element.name == ('orderer_phone') && element.value.length == 11) {
			const is_valid = phone_regex.test(element.value);
			if(is_valid == false) {
				orderer_phone_msg.innerText = '잘못된 번호입니다. 다시 입력해 주세요';
			 	//window.alert('phone number must contains digits only')
			 	element.focus();
			 	return;
			 }
		} else if (element.name == ('orderer_phone') && (element.value.length > 11 || element.value.length < 11)) {
			orderer_phone_msg.innerText = '잘못된 번호입니다. 다시 입력해 주세요';
			 element.focus();
			 return;
		}
		
				
		// 이메일이 비어있지 않더라도 '@'부터 뒷 글자가 도메인 주소 형식이 아니면 X
		if (element.name == ('orderer_email')) {
			 const is_valid = email_regex.test(element.value);
			 if(is_valid == false) {
			 	orderer_email_msg.innerText = '잘못된 이메일입니다. 다시 입력해 주세요';
			 	element.focus();
			 	return;
			 }
		}
		
		// 이름이 비어있지 않더라도 '-'없이 11글자가 아니라면 X
		if(element.name == ('receiver_name') && element.value.length >= 2) {
			const is_valid = name_regex.test(element.value);
			if(is_valid == false) {
			receiver_name_msg.innerText = '잘못된 이름입니다. 다시 입력해 주세요';
			 	element.focus();
			 	return;
			 }
		} else if (element.name == ('receiver_name') && element.value.length < 2) {
			 receiver_name_msg.innerText = '잘못된 이름입니다. 다시 입력해 주세요';
			 element.focus();
			 return;
		}
		
		// 핸드폰 번호가 비어있지 않더라도 '-'없이 11글자가 아니라면 X
		if (element.name == ('receiver_phone') && element.value.length == 11) {
			const is_valid = phone_regex.test(element.value);
			if(is_valid == false) {
				receiver_phone_msg.innerText = '잘못된 번호입니다. 다시 입력해 주세요';
			 	element.focus();
			 	return;
			 }
		} else if (element.name == ('receiver_phone') && (element.value.length > 11 || element.value.length < 11)) {
			receiver_phone_msg.innerText = '잘못된 번호입니다. 다시 입력해 주세요';
			 element.focus();
			 return;
		}
		
		// 이메일이 비어있지 않더라도 '@'부터 뒷 글자가 도메인 주소 형식이 아니면 X
		if (element.name == ('receiver_email')) {
			 const is_valid = email_regex.test(element.value);
			 if(is_valid == false) {
			 	receiver_email_msg.innerText = '잘못된 이메일입니다. 다시 입력해 주세요';
			 	element.focus();
			 	return;
			 }
		}
		
		orderer_name_msg.innerText = '';
		orderer_phone_msg.innerText = '';
		orderer_email_msg.innerText = '';
		receiver_name_msg.innerText = '';
		receiver_zip_code_msg.innerText = '';
		receiver_address_msg.innerText = '';
		receiver_detail_address_msg.innerText = '';
		receiver_phone_msg.innerText = '';
	}
	tossPay2();	
});
}
