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
	<hr />
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
			<button>All</button>
			<button id="ajax-boots">BOOTS</button>
			<button id="ajax-loafers">LOAFERS</button>
			<button>OXFORDS</button>
			<button>SNAKERS</button>
			
		</div>
		<div id="imgBox" class="flex-container2">
			<div id="img1" class="img-container1">
			
			
			</div>
			<div id="img2" class="img-container2">
				
				
			</div>
			<div id="img3" class="img-container3">
			
			
			</div>
			<div id="img4" class="img-container4">
			
			
			</div>
			<div id="img5" class="img-container5">
			
			</div>
			<div id="img6" class="img-container6">
			
			</div>
			
		</div>
	</div>
	<script src="/project/resources/shop/js/ajax.js"></script>
	<%@ include file="../bottom.jspf" %>
</body>
</html>