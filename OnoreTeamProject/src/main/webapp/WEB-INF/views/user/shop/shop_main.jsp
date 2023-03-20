<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오노레 SHOP</title>
<%@ include file="../header.jspf" %>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/shop/css/main.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/shop/css/category.css" />
<link rel="icon" href="<%=request.getContextPath()%>/resources/review/image/파비콘.png">

</head>
<body>
	
	<%@ include file="../top.jspf" %>

	<div class="main" style="padding-top: 127px; width: auto; margin: 50px; margin-top: 0px;" >
	<hr />
		<div class="image-box">
			<img class="image-thumbnail" src="<%=request.getContextPath() %>/resources/shop/image/boots_main.png" alt="메인 구두 사진" />
		</div>
		<div class="flex-container">
			<div class="image-box2">
				<img class="image-thumbnail2" src="<%=request.getContextPath() %>/resources/shop/image/boots_main_left.png" alt="메인 왼쪽 구두 사진" />
			</div>
			<div class="image-box3">
				<img class="image-thumbnail3" src="<%=request.getContextPath() %>/resources/shop/image/boots_main_right.png" alt="메인 오른쪽 구두 사진" />
			</div>
		</div>
		<div class="category-btn">
			<a id="ajax-all">All</a>
			<a id="ajax-derby">DERBY</a>
			<a id="ajax-boots">BOOTS</a>
			<a id="ajax-loafer">LOAFER</a>
			<a id="ajax-sneakers">SNEAKERS</a>
		</div>
		
		<div id="imgBox" class="flex-container2">
		
			<div class="img-container">
				<div class="img-info"></div>
				<div class="img-info2"></div>
			</div>
			
			<div class="img-container">
				<div  class="img-info"></div>
				<div class="img-info2"></div>
			</div>
			
			<div class="img-container">
				<div  class="img-info"></div>
				<div class="img-info2"></div>
			</div>
			
			<div class="img-container">
				<div class="img-info"></div>
				<div class="img-info2"></div>
			</div>
			
			<div class="img-container">
				<div class="img-info"></div>
				<div class="img-info2"></div>
			</div>
			
			<div class="img-container">
				<div class="img-info"></div>
				<div class="img-info2"></div>
			</div>
			
			<div class="img-container">
				<div class="img-info"></div>
				<div class="img-info2"></div>
			</div>
			
			<div class="img-container">
				<div class="img-info"></div>
				<div class="img-info2"></div>
			</div>
			
			<div class="img-container">
				<div class="img-info"></div>
				<div class="img-info2"></div>
			</div>
			<div class="img-container">
				<div class="img-info"></div>
				<div class="img-info2"></div>
			</div>
			<div class="img-container">
				<div class="img-info"></div>
				<div class="img-info2"></div>
			</div>
			<div class="img-container">
				<div class="img-info"></div>
				<div class="img-info2"></div>
			</div>
			<div class="img-container">
				<div class="img-info"></div>
				<div class="img-info2"></div>
			</div>
			<div class="img-container">
				<div class="img-info"></div>
				<div class="img-info2"></div>
			</div>
			<div class="img-container">
				<div class="img-info"></div>
				<div class="img-info2"></div>
			</div>
			<div class="img-container">
				<div class="img-info"></div>
				<div class="img-info2"></div>
			</div>
			<div class="img-container">
				<div class="img-info"></div>
				<div class="img-info2"></div>
			</div>
			<div class="img-container">
				<div class="img-info"></div>
				<div class="img-info2"></div>
			</div>
			<div class="img-container">
				<div class="img-info"></div>
				<div class="img-info2"></div>
			</div>
			<div class="img-container">
				<div class="img-info"></div>
				<div class="img-info2"></div>
			</div>
			<div class="img-container">
				<div class="img-info"></div>
				<div class="img-info2"></div>
			</div>
			<div class="img-container">
				<div class="img-info"></div>
				<div class="img-info2"></div>
			</div>
			<div class="img-container">
				<div class="img-info"></div>
				<div class="img-info2"></div>
			</div>
			<div class="img-container">
				<div class="img-info"></div>
				<div class="img-info2"></div>
			</div>
			<div class="img-container">
				<div class="img-info"></div>
				<div class="img-info2"></div>
			</div>
			<div class="img-container">
				<div class="img-info"></div>
				<div class="img-info2"></div>
			</div>
		</div>
	</div>
	
	
	
	<script src="<%=request.getContextPath() %>/resources/shop/js/category.js"></script>
	<%@ include file="../bottom.jspf" %>
		
</body>
</html>