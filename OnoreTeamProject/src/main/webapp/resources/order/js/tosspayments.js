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

const payment_key = document.getElementById('payment_key');
const order_id = document.getElementById('order_id');
const amount = document.getElementById('amount');
const btn_container = document.getElementById('purchased_btn_container');
let removedObj = null;

let is_purchased = null;

// 결제 API function
function tossPay() {
 if(payment_method == 'card') {
    tossPayments.requestPayment('카드',{
      amount: pay_price.value,
      orderId: 'order_' + getToday(),
      orderName: order_name.innerText, //order_name은 span이라서 innerText로 받음
      customerName: orderer_name.value,
    })
    // 결제 성공 설정
    .then (function (data) {
    	payment_key.value = data.paymentKey;
    	order_id.value = data.orderId;
    	paid_price.value = data.amount;
    	amount.value = data.amount;
    	
    	// 결제 성공시 button을 submit으로 교체    	
    	const purchase_btn = document.getElementById('purchase_btn');
    	
    	removedObj = btn_container.removeChild(purchase_btn);
    	
    	const submit_btn = document.createElement("input");
    	submit_btn.setAttribute("type", "submit");
    	submit_btn.setAttribute("id", "purchase_submit");
    	submit_btn.setAttribute("class", "btn btn-lg btn-dark w-100");
    	submit_btn.setAttribute("value", "주문 완료");
    	btn_container.appendChild(submit_btn);
    	is_purchased = 'true';
    }) // 결제 실패 설정
    .catch(function (error) {
	  if (error.code === 'USER_CANCEL') {
	    // 결제 고객이 결제창을 닫았을 때 에러 처리
	   alert('Purchase canceled');
	  } else if (error.code === 'INVALID_CARD_COMPANY') {
	    // 유효하지 않은 카드 코드에 대한 에러 처리
	    alert('Invalid card company');
	  }
	});
  }
 }
 