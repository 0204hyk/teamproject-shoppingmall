<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="icon" href="/project/resources/main/images/fabicon.png">
    <title>ONÓRE</title>
<%@include file="../member/member_header.jspf" %>
    
</head>
<body>

<%@include file="../member/member_top.jspf" %>


	<div class="search_form_div">
	<form action="" method="POST" name="login" class="loginform">
		<div class="logindiv">
			<div class="title_login_div">
				<a>아이디/비밀번호 찾기</a>
			</div>
			
			<div class="check_search_div">
				<div class="check_id_div"><input id="id_search" name="id_search" type="radio" onchange="setDisplay()"><a>아이디 찾기</a></div>
				<div class="check_pw_div"><input id="pw_search" name="pw_search" type="radio" onchange="setDisplay()"><a>비밀번호 찾기</a></div>
			</div>

			<div class="hidden_div">
				<div class="title_id_div">
					<a>아이디</a>
				</div>
				<div class="title_inputid_div">
					<input name="id" class="text_input" type="text">
				</div>
	
				<div class="title_email_div">
					<a>이메일</a>
				</div>
				<div class="title_inputemail_div">
					<input name="email" class="email_input" type="email">
				</div>
			</div>

			<article>
				<div class="email_send_div">
					<input name="email_send_Btn" class="email_send_Btn" type="submit" value="이메일 보내기">
				</div>
			</article>
		</div>
	</form>
	</div>
	
<script src="/project/resources/menu/js/menu.js"></script>

<%@include file="../member/member_bottom.jspf"%>