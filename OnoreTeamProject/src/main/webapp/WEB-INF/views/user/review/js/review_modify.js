/* 별점 불러와서 체크하기 - 수정용 */ 
 const star = document.getElementsByName('review_rating');
 const rating = document.getElementById('star').value;

 for (var i = 0; i < star.length; ++i) {
 	if (star[i].value == rating) {
     star[i].checked=true;
   } 
 }
 

 