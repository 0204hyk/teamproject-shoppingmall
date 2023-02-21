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

<div class="middle_idpw_search_div">
<form id="idpw_search_form" action="" method="GET" name="idpw_search_form" class="idpw_search_form">
	<div class="idpw_search_div">
		<div class="idpw_search_title_div">
			<a>아이디/비밀번호 찾기</a>
		</div>
		
		<div class="check_idpw_div">
			<div class="search_id_div"><input id="id_search" name="idpw_search" type="radio" onclick="search_search(1)"><a>아이디 찾기</a></div>
			<div class="search_pw_div"><input id="pw_search" name="idpw_search" type="radio" onclick="search_search(2)"><a>비밀번호 찾기</a></div>
		</div>

		<div id="search_id_div">
			<div class="search_name_div">
				<a>이름</a>
			</div>
			<div class="search_input_name_div">
				<input name="input_mem_name" id="input_mem_name" type="text">
			</div>

			<div class="search_email_div">
				<a>이메일</a>
			</div>
			<div class="search_input_email_div">
				<input name="input_mem_email" id="input_mem_email" type="email">
			</div>
		</div>
		
		<div id="search_pw_div" style="display: none;">
			<div class="search_id_div">
				<a>아이디</a>
			</div>
			<div class="search_input_id_div">
				<input name="search_mem_id" id="input_mem_id" type="text">
			</div>

			<div class="search_email_div">
				<a>이메일</a>
			</div>
			<div class="search_input_email_div">
				<input name="input_mem_email" id="input_mem_email" type="email">
			</div>
		</div>

		<article>
			<div class="email_send_div">
				<input name="email_send_Btn" class="email_send_Btn" type="submit" value="이메일 보내기">
			</div>
		</article>
	</div>
</form>

	<div class="go_login_Btn_div">
		<input class="go_login_Btn" type="submit" onclick="location.href='./login'" value="로그인 하기">
	</div>
</div>
<!-- middle 끝 -->

<script src="/project/resources/menu/js/menubar.js"></script>
<%@include file="../member/member_bottom.jspf"%>