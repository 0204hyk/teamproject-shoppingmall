<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONÓRE</title>
<%@include file="../member/member_header.jspf" %>  

<script>
/*
로그인 실패한 부분
// 로그인 id/pw 확인
$('loginBtn').click(function() {
	var id = $('#input_id').val();
	var pw = $('#input_pw').val();
	var remember_id = $('#remember_id_input').is(':checked');

	$.ajax({
		type : 'post',
		url : '${pageContext.request.contextPath}/',
		data : {
			mem_id : id,
			mem_pw : pw,
			remember_id_input : remember_id
		},
		success : function(data) {
			if (data == 0) { // 로그인 실패시
				console.log(data);
				$('#login_message_p').text('로그인 정보를 정확히 입력해주세요.');
			} else { //로그인 성공시
				console.log(data);
				location.href = '${pageContext.request.contextPath}/main';
			}
		}
	});
});
*/
</script>  

</head>
<body>
<%@include file="../member/member_top.jspf" %>

<!-- middle 시작 -->

<div class="middle_login_div">
<form id="login_form" method="POST" action="./" name="login_form" class="login_form" autocomplete="off">

<!-- Cookie가 비어있지 않을 때 checked 속성을 줌 -->
<c:if test="${not empty cookie.user_check}">
	<c:set value="checked" var="checked"/>
</c:if>	
	
	<div class="login_div">
		<div class="login_title_div">
			<a>로 그 인</a>
		</div>

		<div class="login_idpw_div">
			<a>아이디</a>
		</div>
		<div class="input_id_div">
			<input id="input_id" name="mem_id" type="text" value="${cookie.mem_check.value}" placeholder="아이디를 입력하세요.">
		</div>

		<div class="login_idpw_div">
			<a>비밀번호</a>
		</div>
		<div class="input_pw_div">
			<input id="input_pw" name="mem_pw" type="password" placeholder="비밀번호를 입력하세요.">
		</div>
		
		<article class="login_article">
			<div class="member_search_div">
			<div class="remember_id_div"><input class="remember_id_input" id="remember_id_input" type="checkbox" name="remember_id_input" ${checked}><a>아이디 기억하기</a></div>
			<div class="member_idpw_search_div"><a class="member_idpw_searchBtn" href="./member_search">아이디/비밀번호 찾기</a></div>
			</div>
			
			<div style="border: solid 1px green; height:30px;"><p id="login_message_p"></p></div>

			<div class="login_Btn_div">
				<input name="loginBtn" class="loginBtn" type="submit" value="로그인 하기">
			</div>
		</article>
	</div>
</form>

<div class="join_Btn_div">
	<input class="joinBtn" type="submit" onclick="location.href='./join'" value="회원가입 하기">
</div>
</div>
<!-- middle 끝 -->

<script src="/project/resources/menu/js/menubar.js"></script>
<%@include file="../member/member_bottom.jspf"%>