<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="icon" href="/project/resources/main/images/fabicon.png">
    <title>ONÓRE</title>
<%@ include file="../header.jspf" %>
    
</head>
<body>

<%@ include file="../top.jspf" %>
    
    <div class="main">
        <img class="background" src="/project/resources/main/images/img_main.png" alt="background" style="width:100%;">
    </div>
    
    
<script>
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
</script>
<%@ include file="../bottom.jspf" %>
</body>
</html>