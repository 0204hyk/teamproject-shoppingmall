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
						<img
							src="https://search.pstatic.net/common/?src=http%3A%2F%2Fshop1.phinf.naver.net%2F20221209_17%2F1670592358699313Mx_JPEG%2F71728257412032350_95336586.jpg&type=sc960_832">
					</div>
				</div>
				<div class="b">
					<table>
						<div id="prd_name">${contents.product_num }(상품이름으로대체join)후기</div>
						<br>
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

			<a href="./modify?review_num=${contents.review_num }">수정하기</a>/ <a
				href="./delete?review_num=${contents.review_num }">삭제하기</a><br>
			<br>
			<div id="write_reply">
				<form action="./comment" method="POST">
					<input type="hidden" value="${contents.review_num }" id="num">
					<textarea id="comment_content" rows="2" cols="60">댓글을 입력해주세요</textarea>
					<button type="button" id="comment">댓글달기</button>
			</div>
			</form>

			<hr>

			<c:forEach items="${comments }" var="comment">

				<input type="hidden" class="com_num" value="${comment.comment_num }">
				<div>${comment.mem_id }/${comment.comment_date }</div>
				<div id="reply_detail">
					<div>${comment.comment_content }</div>
					<div id="com_mo_de">
						<button id="com_modify" value="${comment.comment_num }">수정</button>
						<button class="com_delete" data="${comment.comment_num }">삭제</button>
					</div>
				</div>
				<div id="reply_modify_form" style="display: none;">
					<form action="./com_modify" method="POST">
						<textarea id="reply_modify">${comment.comment_content }</textarea>
						<input id="modify" type="button" value="수정">
				</div>
				</form>

				<hr>
			</c:forEach>

			<div id="view"></div>
			<button onclick="location.href='./list'" id="list">목록으로</button>


		</div>
	</div>

	<hr>

	<%@ include file="../bottom.jspf"%>

	<script src="/project/resources/review/js/review_detail.js?ver=5" defer></script>
</body>

</html>