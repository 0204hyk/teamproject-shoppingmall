<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONÓRE</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="<%=request.getContextPath() %>/resources/menu/css/login_search.css" rel="stylesheet"/>
<%@include file="../header.jspf" %>    
</head>
<body>
<%@include file="../top.jspf" %>

<!-- middle 시작 -->
<div class="middle_idpw_search_div">
	<div class="search_idpw_div">
		<div class="search_idpw_title_div">
			<a>아이디/비밀번호 찾기</a>
		</div>
		
		<div class="check_idpw_div">
			<div class="search_id_div"><input id="id_search" name="idpw_search" type="radio" onclick="search_check(1)" checked="checked"><a>아이디 찾기</a></div>
		<div class="search_pw_div"><input id="pw_search" name="idpw_search" type="radio" onclick="search_check(2)"><a>비밀번호 찾기</a></div>
		</div>

		<div id="search_id_div">
			<div class="search_name_div">
				<a>이름</a>
			</div>
			<div class="search_input_name_div">
				<input name="input_mem_name" id="input_mem_name" class="input_mem_name" type="text" placeholder="이름을 입력하세요.">
			</div>
			<div class="search_email_div">
				<a>이메일</a>
			</div>
			<div class="search_input_email_div">
				<input name="input_mem_email1" id="input_mem_email1" class="input_mem_email1" type="email" placeholder="이메일을 입력하세요.">
			</div>
			
		    <div class="search_id_result"><a id="search_id_result_a"></a></div>
			 
			<article class="search_id_article">
				<div class="search_id_btn_div">
					<input name="search_id_btn" class="search_id_btn" type="submit" onclick="findId_click()" value="아이디 찾기">
				</div>
			</article>
		</div>

	<!-- <form id="find_pw_form" action="./find_pw" method="POST">  -->
		<div id="search_pw_div" style="display: none;">
			<div class="search_id_div">
				<a>아이디</a>
			</div>
			<div class="search_input_id_div">
				<input name="mem_id" id="input_mem_id" class="input_mem_id" type="text" placeholder="아이디를 입력하세요.">
			</div>
			<div class="search_email_div">
				<a>이메일</a>
			</div>
			<div class="search_input_email_div">
				<input name="mem_email" id="input_mem_email2" class="input_mem_email2" type="email" placeholder="이메일을 입력하세요.">
			</div>
	
  			<div class="search_pw_result"><a id="search_pw_result_a"></a></div>

			<article class="search_pw_article">
				<div class="search_pw_btn_div">
					<input name="search_pw_btn" class="search_pw_btn" type="submit" onclick="findPw_click()" value="비밀번호 찾기">
				</div>
			</article>
		</div>	
	<!-- </form> -->
	</div>
	<div class="go_login_Btn_div">
		<input class="go_login_Btn" type="submit" onclick="location.href='./login'" value="로그인 하기">
	</div>
</div>
<!-- middle 끝 -->

<script src="<%=request.getContextPath() %>/resources/menu/js/member_search.js"></script>
<script src="<%=request.getContextPath() %>/resources/menu/js/menubar.js"></script>
<%@include file="../bottom.jspf"%>