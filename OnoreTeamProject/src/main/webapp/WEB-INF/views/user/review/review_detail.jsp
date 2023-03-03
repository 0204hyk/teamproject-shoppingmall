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
	href="/project/resources/review/css/review_detail.css?ver=8">
</head>
<body>

	<%@ include file="../top.jspf"%>

	<div class="main"
		style="padding-top: 127px; width: auto; margin: 50px; margin-top: 0px;">
		<hr>
		<div class="detail">
			<div class="container">
				<div class="a">
					<div name="prd_img">
						<img src="${contents.product_thumbnail }">
					</div>
				</div>
				<div class="b">
					<table>
						<tr>
							<th id="prd_name">${contents.product_name } 후기</th>
						</tr>
						<tr>
						
						<c:if test="${contents.review_rating eq 5 }">
							<td name="star" class="rating">
								<i class="fa-solid fa-star"></i>
								<i class="fa-solid fa-star"></i>
								<i class="fa-solid fa-star"></i>
								<i class="fa-solid fa-star"></i>
								<i class="fa-solid fa-star"></i>
							</td>
						</c:if>
						<c:if test="${contents.review_rating eq 4 }">
							<td name="star" class="rating">
								<i class="fa-solid fa-star"></i>
								<i class="fa-solid fa-star"></i>
								<i class="fa-solid fa-star"></i>
								<i class="fa-solid fa-star"></i>
								<i class="fa-regular fa-star"></i>
							</td>
						</c:if>
						<c:if test="${contents.review_rating eq 3 }">
							<td name="star" class="rating">
								<i class="fa-solid fa-star"></i>
								<i class="fa-solid fa-star"></i>
								<i class="fa-solid fa-star"></i>
								<i class="fa-regular fa-star"></i>
								<i class="fa-regular fa-star"></i>
							</td>
						</c:if>
						<c:if test="${contents.review_rating eq 2 }">
							<td name="star" class="rating">
								<i class="fa-solid fa-star"></i>
								<i class="fa-solid fa-star"></i>
								<i class="fa-regular fa-star"></i>
								<i class="fa-regular fa-star"></i>
								<i class="fa-regular fa-star"></i>
							</td>
						</c:if>
						<c:if test="${contents.review_rating eq 1 }">
							<td name="star" class="rating">
								<i class="fa-solid fa-star"></i>
								<i class="fa-regular fa-star"></i>
								<i class="fa-regular fa-star"></i>
								<i class="fa-regular fa-star"></i>
								<i class="fa-regular fa-star"></i>
							</td>
						</c:if>
						</tr>
						<tr>
						<td id="idndate">${contents.maskingName } &nbsp; / &nbsp; ${contents.review_date }</td>
						</tr>
					</table>
				</div>
			</div>
			<hr>
			<div class="container2">
				<div class="content">${contents.review_content }</div>
				<div class="sub-container2">
					<div class="img">
						<c:if test="${not empty contents.review_img_1}">
							<img src="${contents.review_img_1 }">
						</c:if>
					</div>
					<div class="img">
						<c:if test="${not empty contents.review_img_2}">
							<img src="${contents.review_img_2 }">
						</c:if>
					</div>
					<div class="img">
						<c:if test="${not empty contents.review_img_3}">
							<img src="${contents.review_img_3 }">
						</c:if>
					</div>
				</div>
			</div>
			<hr>
			<div class="button">
				<a href="./modify?review_num=${contents.review_num }">수정하기</a> / 
				<a href="./delete?review_num=${contents.review_num }">삭제하기</a><br>
			</div>
			<br>
			<div id="write_reply">
			<h4> 댓글(${cnt })</h4>
				<form action="./comment" method="POST">
					<input type="hidden" value="${contents.review_num }" id="num">
					<textarea id="comment_content" rows="3" cols="120" placeholder="댓글을 입력해주세요"></textarea><br>
					<button type="button" id="comment">댓글달기</button>
			</div>
			</form>
			
			<hr>
			
			
			<c:forEach items="${comments }" var="comment">
			<div class="comment_box">
				<input type="hidden" class="com_num" value="${comment.comment_num }">
				<div><span id="mem">${comment.maskingName }</span>  &nbsp;&nbsp; ${comment.comment_date }</div>
				<br>
				<div id="reply_detail">
					<div id="get_content">${comment.comment_content }</div>
					<div id="com_mo_de">
						<button id="com_modify" value="${comment.comment_num }">수정</button>
						<button class="com_delete" data="${comment.comment_num }">삭제</button>
					</div>
				</div>
				<div id="reply_modify_form" style="display: none;">
					<form action="./com_modify" method="POST">
						<textarea id="reply_modify" rows="3" cols="120">${comment.comment_content }</textarea>
						<br>
						<input id="modify_cancel" type="button" value="취소">
						<input id="modify" type="button" value="수정">
						<br>
				</div>
				</form>
				</div>	
				<hr>
			</c:forEach>
			<button onclick="location.href='./list'" id="list">목록으로</button>
			<br>
		</div>
	</div>

	<hr>

	<%@ include file="../bottom.jspf"%>

	<script src="/project/resources/review/js/review_detail.js?ver=5" defer></script>
</body>

</html>