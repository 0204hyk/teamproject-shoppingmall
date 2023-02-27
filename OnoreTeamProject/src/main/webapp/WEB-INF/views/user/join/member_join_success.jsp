<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<div class="middle_join_success_div">
	<div class="join_success_div">
	    	<p> ${member_join_success.mem_name}님 회원가입을 축하드립니다!</p>
	    	<p> 가입하신 아이디는 <strong>${member_join_success.mem_id}</strong>입니다. </p>
	    	
	    	<button type="button" class="login_go_btn" onclick="location.href='./login'">로그인하러 가기</button>  	
	 </div>
</div>
<!-- middle 끝 -->
       
<script src="/project/resources/menu/js/menubar.js"></script>
<%@include file="../member/member_bottom.jspf" %>