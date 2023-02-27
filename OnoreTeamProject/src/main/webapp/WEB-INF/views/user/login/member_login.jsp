<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONÓRE</title>
<%@include file="../member/member_header.jspf" %>   
</head>
<body>
<%@include file="../member/member_top.jspf" %>

<!-- middle 시작 -->
<div class="middle_login_div">
	<c:if test="${signIn == null }">
	<form id="login_form" method="POST" action="./signIn.do" name="login_form" class="login_form" autocomplete="off">
		<div class="login_div">
			
			<div class="login_title_div">
				<a>로 그 인</a>
			</div>
			
			<div class="login_idpw_div">
				<a>아이디</a>
			</div>
			<div class="input_id_div">
				<input id="input_id" name="mem_id" type="text" placeholder="아이디를 입력하세요.">
			</div>
	
			<div class="login_idpw_div">
				<a>비밀번호</a>
			</div>
			<div class="input_pw_div">
				<input id="input_pw" name="mem_pw" type="password" placeholder="비밀번호를 입력하세요.">
			</div>
			
				<div class="member_search_div">
				<div class="remember_id_div"><input class="remember_id_input" id="remember_id_input" type="checkbox" name="remember_id_input"><a>아이디 기억하기</a></div>
				<div class="member_idpw_search_div"><a class="member_idpw_searchBtn" href="./member_search">아이디/비밀번호 찾기</a></div>
				</div>
				<div class="message_div">
				<c:if test = "${result == 0 }">
				아이디와 비밀번호를 확인해주세요.
				</c:if>
				</div>
				
			<article class="login_article">				
				<div class="login_Btn_div">
					<input name="loginBtn" class="loginBtn" type="submit" value="로그인 하기">
				</div>
			</article>
			
		</div>
	</form>
	</c:if>
	
	<div class="join_Btn_div">
		<input class="joinBtn" type="submit" onclick="location.href='./join'" value="회원가입 하기">
	</div>
</div>
<!-- middle 끝 -->

<script src="/project/resources/menu/js/menubar.js"></script>
<%@include file="../member/member_bottom.jspf"%>