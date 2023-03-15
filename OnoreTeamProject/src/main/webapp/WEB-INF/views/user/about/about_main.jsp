<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONÓRE</title>
<%@ include file="../header.jspf" %>
<link rel="icon" href="<%=request.getContextPath() %>/resources/review/image/파비콘.png">
<link rel="stylesheet"href="<%=request.getContextPath() %>/resources/about/css/about_main.css?ver=2">
</head>
<body>

	<%@ include file="../top.jspf" %>

	<div class="main" style="padding-top: 127px;  width: auto; height: auto; margin:50px; margin-top: 0px;">
	<hr>
		<div id="main_img"><img src="<%=request.getContextPath() %>/resources/review/image/main.png" alt="fail"></div>
		<div class="word">
			안녕하세요. 수제화 구두 전문점 오노레 입니다. <br>
			<br>오노레는 실용성이 없습니다.단지 감상할 수 있는 예술품이기 때문입니다. <br>
			<br>하지만 왜 수백 ,수천만 원의 가치를 갖는걸까요? <br>
			<br>왜냐하면 우리에게 영감을 주기 때문입니다. 우리의 마음을 움직이고 영혼을 고양시키기 때문입니다. <br>
			<br>당신의 스타일에 영감을 불어넣고 당신의 걸음에는 감성을 더하고 싶습니다.</div>
		<div id="img_2">
		<div><img src="<%=request.getContextPath() %>/resources/review/image/img1.jpg"></div>
		<div><img src="<%=request.getContextPath() %>/resources/review/image/img2.jpg"></div>
		</div>
		<div class="word">
			foot and mood<br>
			<br>이제, 당신의 걸음과 스타일에 감성을 더해보세요.</div>
		<div id="shop"><a href="<%=request.getContextPath() %>/shop/main"><img src="<%=request.getContextPath() %>/resources/review/image/shop.jpg"></a></div>
	</div>
	
	<hr>
	
	<%@ include file="../bottom.jspf" %>

</body>
</html>