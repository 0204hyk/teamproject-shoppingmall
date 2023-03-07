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
const paid_price = document.getElementById('paid_price');
const amount = document.getElementById('amount');
const btn_container = document.getElementById('purchased_btn_container');
const form = document.getElementById('order_form');

let removedObj = null;

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
    .then ((data) => {
    	payment_key.value = data.paymentKey;
		order_id.value = data.orderId;
		paid_price.value = data.amount;
		amount.value = data.amount;
	    
	    
	    
	    form.action = '/project/order/result';
	    form.method = 'POST';
	    form.submit();
    	
    }) // 결제 실패 설정
    .catch((error) => {
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
 