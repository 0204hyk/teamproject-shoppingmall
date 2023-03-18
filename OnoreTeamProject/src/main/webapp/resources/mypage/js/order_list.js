const recent_order_details = document.querySelectorAll('.recent_order_detail');
const order_accordions = document.querySelectorAll('.order_accordion');
    	
order_accordions.forEach((check, index) => {
	check.addEventListener('change', () => {    			
	
		if(order_accordions[index].checked == true) {
			recent_order_details[index].style.display = '';
		} else {
			recent_order_details[index].style.display = 'none';
		}
	});
});