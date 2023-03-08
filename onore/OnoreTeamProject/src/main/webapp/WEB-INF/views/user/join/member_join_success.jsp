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
			<p style="font-size: 35px; font-weight: bold;" > 환영합니다! </p>
	    	<p style="font-size: 20px;"> <strong>${param.mem_name}</strong>님, 회원가입을 축하합니다!</p>
	    	<p style="font-size: 20px;"> ONORE 가입하신 아이디는 <strong>${param.mem_id}</strong>입니다. </p>
	    	
	    	<p style="font-weight : bold; font-size: 12px; color: darkgray;"> ONORE에서는 항상 회원님들의 입장에서 </p>
	    	<p style="font-weight : bold; font-size: 12px; color: darkgray"> 보다 좋은 서비스를 받으실 수 있도록 노력하겠습니다. </p>
	    	<p style="font-weight : bold; font-size: 12px; color: darkgray"> 감사합니다. </p>
	    	
	    	<button type="button" class="login_go_btn" onclick="location.href='./login'">로그인하러 가기</button>  	
	 </div>
</div>
<!-- middle 끝 -->
       
<script src="/project/resources/menu/js/menubar.js"></script>
<%@include file="../member/member_bottom.jspf" %>