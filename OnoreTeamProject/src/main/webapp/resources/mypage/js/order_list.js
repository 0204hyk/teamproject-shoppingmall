const recent_order_details = document.querySelectorAll('.recent_order_detail');
const order_accordions = document.querySelectorAll('.order_accordion');
const arrows = document.querySelectorAll('.order_accordion_arrow');
    	
order_accordions.forEach((check, index) => {
	check.addEventListener('change', () => {    			
		if(order_accordions[index].checked == true) {
			recent_order_details[index].style.display = '';
			arrows[index].checked = true;
		} else {
			recent_order_details[index].style.display = 'none';
			arrows[index].checked = false;
		}
	});
});

arrows.forEach((check, index) => {
	check.addEventListener('change', () => {    			
		if(arrows[index].checked == true) {
			recent_order_details[index].style.display = '';
			order_accordions[index].checked = true;
		} else {
			recent_order_details[index].style.display = 'none';
			order_accordions[index].checked = false;
		}
	});
});