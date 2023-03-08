// 오늘 날짜 구하기
function getToday(){
  let date = new Date();
  let year = date.getFullYear();
  let month = ("0" + (1 + date.getMonth())).slice(-2);
  let day = ("0" + date.getDate()).slice(-2);
  let hour = ("0" + date.getHours()).slice(-2);
  let minute = ("0" + date.getMinutes()).slice(-2);
  let second = ("0" + date.getSeconds()).slice(-2);
  let millisec = ("00" + date.getMilliseconds()).slice(-3);
  
  return year + month + day + hour + minute + second + millisec;
}

const order_id = document.getElementById('order_id');
const order_num = document.getElementById('order_num');
const pay_price = document.getElementById('pay_price');
const pay_method = document.getElementById('pay_method');
const payment_key = document.getElementById('payment_key');
const amount = document.getElementById('amount');

const purchase_url = window.location.protocol + "//" + window.location.host + "/project/order/purchase";

function purchase_submit() {
		console.log(payment_key.value);
		console.log(order_id.value);
		console.log(amount.value);
		const form = document.getElementById('purchase_form');
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
				}),
			}).then((response) => {
				const xhttp = new XMLHttpRequest();
				
				xhttp.addEventListener('readystatechange', (e) => {
					if(xhttp.readyState == 4 && xhttp.status == 200) {
						if(xhttp.responseText == 'purchase_success') {
							form.submit();
						} else {
							alert('purchase_failed');
						}
					}
				});
				
				xhttp.open('POST', purchase_url);
				
				xhttp.setRequestHeader('content-type', 'application/json');
				
				const pay_data = {
					pay_id: 'pay_' + getToday(),
					order_num: order_num.value,
					pay_price: pay_price.value,
					pay_method: pay_method.value,
					pay_status: 1,
					refund_req: 0,
					refund_status: 0
				}
				console.log(pay_data);
				
				xhttp.send(JSON.stringify(pay_data));
			})
			.catch((error) => {
		  		alert(error);
		  	});
	}