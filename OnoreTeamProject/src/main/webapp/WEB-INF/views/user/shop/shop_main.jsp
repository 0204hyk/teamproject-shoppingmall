<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../header.jspf" %>
<link rel="stylesheet" href="/project/resources/shop/css/main.css" />
<link rel="stylesheet" href="/project/resources/shop/css/category.css" />
</head>
<body>
	
	<%@ include file="../top.jspf" %>

	<div  style="padding-top: 127px; width: auto; height: 2000px; margin: 50px; margin-top: 0px;">
		<div class="image-box">
			<img class="image-thumbnail" src="/project/resources/shop/image/boots_main.png" alt="메인 구두 사진" />
		</div>
		<div class="flex-container">
			<div class="image-box2">
				<img class="image-thumbnail2" src="/project/resources/shop/image/boots_main_left.png" alt="메인 왼쪽 구두 사진" />
			</div>
			<div class="image-box3">
				<img class="image-thumbnail3" src="/project/resources/shop/image/boots_main_right.png" alt="메인 오른쪽 구두 사진" />
			</div>
		</div>
		<div class="category-btn">
			<a href="">All</a>
			<a href="">BOOTS</a>
			<a href="">LOAFERS</a>
			<a href="">OXFORDS</a>
			<a href="">SNAKERS</a>
		</div>
		<div class="flex-container2">
			<div class="img-container1">
				<img src="/project/resources/shop/image/boots/boots1.png" alt="" />
			</div>
			<div class="img-container2">
				<img src="/project/resources/shop/image/boots/boots2.png" alt="" />
			</div>
			<div class="img-container3">
				<img src="/project/resources/shop/image/boots/boots3.png" alt="" />
			</div>
			<div class="img-container4">
				<img src="/project/resources/shop/image/boots/boots4.png" alt="" />
			</div>
			<div class="img-container5">
				<img src="/project/resources/shop/image/boots/boots5.png" alt="" />
			</div>
			<div class="img-container6">
				<img src="/project/resources/shop/image/boots/boots6.png" alt="" />
			</div>
		</div>
	</div>
	<%@ include file="../bottom.jspf" %>
</body>
</html>