 /* toggleBtn이라는 변수에 HTML 노드 중에 navbar_toggleBtn이라는 클래스를 할당해준다. */
 const toggleBtn = document.querySelector('.navbar_toggleBtn');
 const menu = document.querySelector('.navbar_menu');
 const minimenu = document.querySelector('.navbar_minimenu');
 const icons = document.querySelector('.navbar_icons');

 /* 토글버튼이 클릭될 때마다 active가 없다면 active를 추가해주고,
 active가 있다면 다시 빼주는 역할*/
 toggleBtn.addEventListener('click', () => {
    menu.classList.toggle('active');
    minimenu.classList.toggle('active');
    icons.classList.toggle('active');
 });
 
