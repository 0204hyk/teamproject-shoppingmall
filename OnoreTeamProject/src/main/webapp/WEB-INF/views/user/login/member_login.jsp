<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	<div class="middle_div">
	<form action="./test" method="POST" name="loginform" class="loginform">
		<div class="logindiv">
			<div class="title_login_div">
				<a>로 그 인</a>
			</div>

			<div class="title_idpw_div">
				<a>아이디</a>
			</div>
			<div class="title_inputid_div">
				<input id="mem_id" name="mem_id" type="text">
			</div>

			<div class="title_idpw_div">
				<a>비밀번호</a>
			</div>
			<div class="title_inputpw_div">
				<input id="mem_pw" name="mem_pw" type="password">
			</div>

			<article>
				<div class="mem_search_div">
					<a class="mem_searchBtn" href="./member_search">아이디/비밀번호 찾기</a>
				</div>

				<div class="login_Btn_div">
					<input name="loginBtn" class="loginBtn" type="submit"
						onclick="loginBtn_loginClick()" value="로그인 하기">
				</div>
			</article>
		</div>
	</form>
	<div class="join_div">
		<input class="joinBtn" type="submit" onclick="location.href='./join'" value="회원가입 하기">
	</div>
	</div>


<script src="/project/resources/menu/js/menu.js"></script>

<%@include file="../member/member_bottom.jspf"%>