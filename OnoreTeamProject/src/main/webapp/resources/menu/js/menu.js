 /* toggleBtn이라는 변수에 HTML 노드 중에 navbar_toggleBtn이라는 클래스를 할당해준다. */
 const toggleBtn = document.querySelector('.navbar_toggleBtn');
 const menu = document.querySelector('.navbar_menu');
 const submenu = document.querySelector('.navbar_submenu');

 /* 토글버튼이 클릭될 때마다 active가 없다면 active를 추가해주고,
 active가 있다면 다시 빼주는 역할*/
 toggleBtn.addEventListener('click', () => {
    menu.classList.toggle('active');
    submenu.classList.toggle('active');
 });
 
 
 /* 라디오버튼-아이디찾기, 비밀번호 찾기 : 체크 할 때마다 div 보이거나 숨기기 */
 function setDisplay() {
 	if($('input:radio[id=id_search]').is(':checked')){
 		$('.hidden_div').hide();
 	} else {
 		$('.hidden_div').show();
 	}
 }
 
 	
/* 마우스 포커스 깜빡임 */
document.forms[0].id.focus();
document.forms[0].id.select();


/* 비밀번호 일치 불일치 메세지 띄우기 */

