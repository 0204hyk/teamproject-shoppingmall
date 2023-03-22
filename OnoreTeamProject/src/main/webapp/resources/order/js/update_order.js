const form = document.getElementsByClassName('order_form');
const delete_submit = document.getElementsByClassName('cancel_refunt_btn');

for(i = 0; i < form.length; i++) {
	form[i].addEventListener('submit', (e)=> {
		e.preventDefault();
			
		if(window.confirm('정말로 환불처리 하시겠습니까?')) {
			form[i].action = contextPath + "/order/updateStatus";
			form[i].method = "POST";
			form[i].submit();
		}
	});
}
