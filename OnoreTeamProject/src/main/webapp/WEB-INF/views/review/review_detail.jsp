<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONÓRE</title>
<%@ include file="../header.jspf"%>
<link rel="icon" href="/project/resources/review/image/파비콘.png">
<link rel="stylesheet"
	href="/project/resources/review/css/review_detail.css">
</head>
<body>

	<%@ include file="../top.jspf"%>

	<div class="main"
		style="padding-top: 127px; width: auto; height: 800px; margin: 50px; margin-top: 0px;">
		<hr>
		<div class="detail">
		<div class="container">
		<div class="a">
			<div name="prd_img">
				<img src="https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20221209_17%2F1670592358699313Mx_JPEG%2F71728257412032350_95336586.jpg&type=sc960_832">
			</div>
		</div>
		<div class="b">
		<table>
			<div id="prd_name">${contents.product_num }(상품이름으로대체join)후기</div><br>
			<c:if test="${contents.review_rating eq 5 }">
				<div name="star">★★★★★</div>
			</c:if>
			<c:if test="${contents.review_rating eq 4 }">
				<div name="star">★★★★☆</div>
			</c:if>
			<c:if test="${contents.review_rating eq 3 }">
				<div name="star">★★★☆☆</div>
			</c:if>
			<c:if test="${contents.review_rating eq 2 }">
				<div name="star">★★☆☆☆</div>
			</c:if>
			<c:if test="${contents.review_rating eq 1 }">
				<div name="star">★☆☆☆☆</div>
			</c:if>
			<div name="idndate">${contents.mem_id }/${contents.review_date }</div>
		</table>	
		</div>	
		</div>
			<hr>
		<div class="container2">
			<div class="content">${contents.review_content }</div>
			<div class="img">${contents.review_ima_1 }</div>
			<div class="img">${contents.review_ima_2 }</div>
			<div class="img">${contents.review_ima_3 }</div>
		</div>
			<hr>
			<a href="./modify?review_num=${contents.review_num }">수정하기</a>/ <a
				href="./delete?review_num=${contents.review_num }">삭제하기</a><br>
			<button onclick="location.href='./list'">목록으로</button>

		</div>
	</div>
	
	<hr>

	<%@ include file="../bottom.jspf"%>

</body>
</html>