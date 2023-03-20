<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오노레 Q&A</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.min.js"></script>
<%@include file="../header.jspf"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/qna/css/qna_detail.css" />
</head>
<body>
	<%@include file="../top.jspf"%>

	<div class="main"
		style="padding-top: 127px; width: auto; margin: 50px; margin-top: 0px;">
		<hr>
		<div class="detail">
			<c:forEach items="${views }" var="view">
				<div id="title">[${view.qna_category }] &nbsp;
					${view.qna_title }</div>
				<div class="container">
					<c:if test="${view.qna_category eq '상품' }">
						<div id="product_box">
							<div id="prd_name">제품명 : ${view.product_name }</div>
						</div>
					</c:if>
				</div>

				<hr>

				<div class="container2">
					<div class="content">${view.qna_content }</div>
					<div class="sub-container2">
						<div class="img">
							<c:if test="${not empty view.qna_img_1 }">
								<a
									href="<%=request.getContextPath() %>/resources/qna/images/${view.qna_img_1 }"
									data-toggle="lightbox" data-gallery="example-gallery"
									class="col-sm-4"> <img
									src="<%=request.getContextPath() %>/resources/qna/images/${view.qna_img_1 }"
									name="qna_img_1" class="img-fluid rounded" />
								</a>
							</c:if>
						</div>
						<div class="img">
							<c:if test="${not empty view.qna_img_2 }">
								<a
									href="<%=request.getContextPath() %>/resources/qna/images/${view.qna_img_2 }"
									data-toggle="lightbox" data-gallery="example-gallery"
									class="col-sm-4"> <img
									src="<%=request.getContextPath() %>/resources/qna/images/${view.qna_img_2 }"
									name="qna_img_1" class="img-fluid rounded" />
								</a>
							</c:if>
						</div>
						<div class="img">
							<c:if test="${not empty view.qna_img_3 }">
								<a
									href="<%=request.getContextPath() %>/resources/qna/images/${view.qna_img_3 }"
									data-toggle="lightbox" data-gallery="example-gallery"
									class="col-sm-4"> <img
									src="<%=request.getContextPath() %>/resources/qna/images/${view.qna_img_3 }"
									name="qna_img_1" class="img-fluid rounded" />
								</a>
							</c:if>
						</div>
					</div>
				</div>

				<hr>
				<div style="margin-bottom: 50px;">
					<!-- 해당 ID가 작성한게 맞으면 보이게 끔 수정 -->
					<c:if test="${sessionScope.signIn.mem_status ne 1}">
						<a href="<%=request.getContextPath() %>/qna_modify?qna_num=${view.qna_num }"
							onclick="return confirm('해당 글을 수정 하시겠습니까?');">글 수정하기</a> /
				</c:if>
					<a href="<%=request.getContextPath() %>/qna_delete?qna_num=${view.qna_num }"
						onclick="return confirm('해당 글을 정말로 삭제 하시겠습니까?');">글 삭제하기</a>
				</div>

				<c:if test="${sessionScope.signIn.mem_status eq 1}">
					<div id="write_reply">
						<form action="<%=request.getContextPath() %>/qna_replyWrite" method="POST">
							<input type="hidden" value="${view.qna_num }" name="qna_num"
								id="num">
							<textarea id="comment_content" name="reply_content" rows="3"
								cols="132" placeholder="댓글을 입력해주세요"></textarea>
							<br> <input type="submit" id="commentBtn" value="댓글달기"></input>
							<hr />
						</form>
					</div>
				</c:if>
			</c:forEach>
			<br>

			<div id="reply">
				<div id="comment">[ 댓글 ]</div>
				<br>
				<c:choose>
					<c:when test="${not empty replys }">

						<div class="comment_box">
							<div>ONORE &nbsp; / &nbsp; ${replys.creationReplyDate}</div>
							<br>
							<div id="reply_detail">
								<div id="get_content">${replys.reply_content }</div>
							</div>
						</div>

					</c:when>
					<c:otherwise>
						<div>관리자의 댓글을 기다리고 있어요.</div>
					</c:otherwise>
				</c:choose>
			</div>
			<button onclick="location.href='<%=request.getContextPath() %>/main'" id="list">목록으로</button>
		</div>
	</div>


	<hr>

	<!-- BootStrap modal 이미지 모달창 jquery -->
	<script>
		$(document).on('click', '[data-toggle="lightbox"]', function(event) {
			event.preventDefault();
			$(this).ekkoLightbox();
		});
	</script>

	<%@include file="../bottom.jspf"%>
</body>
</html>