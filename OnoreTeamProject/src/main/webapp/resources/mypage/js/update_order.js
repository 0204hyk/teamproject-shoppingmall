const form = document.querySelectorAll('.order_form');

for(i = 0; i < form.length; i++) {
	console.log(i);
	form[i].addEventListener('submit', (e)=> {
		e.preventDefault();
	
		if(window.confirm('정말로 환불 요청 하시겠습니까?')) {
			form[i-1].action = contextPath + "/order/updateStatus";
			form[i-1].method = "POST";
			form[i-1].submit();
		}
	});
}
