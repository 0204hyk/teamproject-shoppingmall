
const qnaPop = document.getElementById('qna_more');
const reviewPop = document.getElementById('review_more');
var popOption = "width = 650, height=550, top=300, left=300, scrollbars=yes";

qnaPop.addEventListener('click',(e) => {
	let openurl = './qnaPagination'
	open(openurl, 'pop', popOption);
 
});


reviewPop.addEventListener('click',(e) => {
	let openurl = './reviewPagination'
	open(openurl, 'pop', popOption);
 
});


