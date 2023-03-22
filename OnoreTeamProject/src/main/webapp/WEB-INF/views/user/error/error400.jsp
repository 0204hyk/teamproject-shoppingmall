<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONÓRE</title>
<link rel="icon" href="<%=request.getContextPath() %>/resources/error/favicon.png">
<link href="<%=request.getContextPath() %>/resources/menu/css/join_success.css?ver=1" rel="stylesheet"/>
<%@include file="../header.jspf" %>
</head>
<body>
<%@include file="../top.jspf" %>
    
<!-- middle 시작 -->
<div class="middle_join_success_div">
	<div class="join_success_div" style="background-color: white">
			<br><br><br>
			<p style="font-size: 35px; font-weight: bold;" > 죄송합니다, 오류입니다. </p>
	   		<p style="font-weight : bold; font-size: 15px; color: black;"> 이용에 불편을 드린 점 진심으로 사과드리며, </p>
	    	<p style="font-weight : bold; font-size: 15px; color:black;">편리하게 서비스를 이용하실 수 있도록 최선의 노력을 다하겠습니다.</p>
	    	<button type="button" class="login_go_btn" onclick="location.href='<%=request.getContextPath() %>/main/'">메인으로 가기</button>  	
	 </div>
</div>
<!-- middle 끝 -->
       
<script src="<%=request.getContextPath() %>/resources/menu/js/menubar.js"></script>
<%@include file="../bottom.jspf" %>