<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONÓRE</title>
<link href="<%=request.getContextPath() %>/resources/menu/css/login_search.css" rel="stylesheet"/>
<%@include file="../header.jspf" %>   
</head>
<body>
<%@include file="../top.jspf" %>

<!-- middle 시작 -->
<div class="middle_login_div">
	<c:if test="${signIn == null }">
	<form id="login_form" method="POST" action="<%=request.getContextPath() %>/signIn.do" name="login_form" class="login_form" autocomplete="off">
		<div class="login_div">
			
			<div class="login_title_div">
				<a>로 그 인</a>
			</div>
			
			<div class="login_idpw_div">
				<a>아이디</a>
			</div>
			<div class="input_id_div">
				<input id="input_id" name="mem_id" type="text" placeholder="아이디를 입력하세요." value="${cookie.saved_id.value}"> <!-- 로그인시 아이디 기억하기 체크하면 cookie에 저장된 아이디가 나온다. -->
			</div>
	
			<div class="login_idpw_div">
				<a>비밀번호</a>
			</div>
			<div class="input_pw_div">
				<input id="input_pw" name="mem_pw" type="password" placeholder="비밀번호를 입력하세요.">
			</div>
			
				<div class="member_search_div">
				<div class="remember_id_div"><input class="remember_id_input" id="remember_id_input" type="checkbox" name="remember_id_input" ${cookie.saved_id != null ? 'checked' : ''} ><a>아이디 기억하기</a></div>
				<div class="member_idpw_search_div"><a class="member_idpw_searchBtn" href="<%=request.getContextPath() %>/member_search">아이디/비밀번호 찾기</a></div>
				</div>
				<div class="message_div">
				<c:if test="${result == 0}">
					<div class="message_div">
						아이디와 비밀번호를 확인해주세요.
					</div>
				</c:if>
				<c:if test="${result == 1}">
					<div class="message_div">
						아이디 또는 비밀번호가 틀렸습니다.
					</div>
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

<script type="text/javascript" src="<%=request.getContextPath() %>/resources/menu/js/member_login.js"></script>
<script src="<%=request.getContextPath() %>/resources/menu/js/menubar.js"></script>
<%@include file="../bottom.jspf"%>