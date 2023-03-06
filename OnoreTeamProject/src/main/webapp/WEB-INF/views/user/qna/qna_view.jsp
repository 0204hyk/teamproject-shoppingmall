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
<link rel="stylesheet" href="/project/resources/qna/css/qna_detail.css" />
</head>
<body>
	<%@include file="../top.jspf"%>

	<div class="main"
		style="padding-top: 127px; width: auto; height: 1200px; margin: 50px; margin-top: 0px;">
		<hr />
		<div>
			<div style="width: 1200px; height: 600px; ">
				<c:forEach items="${views }" var="view">
				<div >
					<c:choose>
							<c:when test="${not empty view.product_thumbnail_1}">
								<td><img style="width: 50px; height: 50px;" src=${view.product_thumbnail_1 }>${view.product_info }</td>
							</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>
						</c:choose>
					<h4>[${view.qna_category }] ${view.qna_title } </h4>
				</div>
				
					<div style="width: 1200px; height: 400px;">
						<h4>${view.qna_content }</h4>
					</div>
					
					<div style="width: 1200px; height: 400px;">
					<c:choose>
						<c:when
							test="${not empty view.qna_img_1 and not empty view.qna_img_2 and not empty view.qna_img_3}">
							<td>
								<a
								href="/project/resources/qna/images/${view.qna_img_1 }"
								data-toggle="lightbox" data-gallery="example-gallery"
								class="col-sm-4"> 
								<img style="width: 150px; height: 150px;"
									src="/project/resources/qna/images/${view.qna_img_1 }"
									name="qna_img_1" class="img-fluid rounded" />
								</a>
							</td>

							<td>
								<a
								href="/project/resources/qna/images/${view.qna_img_2 }"
								data-toggle="lightbox" data-gallery="example-gallery"
								class="col-sm-4"> 
								<img style="width: 150px; height: 150px;"
									src="/project/resources/qna/images/${view.qna_img_2 }"
									name="qna_img_2" class="img-fluid rounded" />
								</a>
							</td>
							<td>
								<a
								href="/project/resources/qna/images/${view.qna_img_3 }"
								data-toggle="lightbox" data-gallery="example-gallery"
								class="col-sm-4"> 
								<img style="width: 150px; height: 150px;"
									src="/project/resources/qna/images/${view.qna_img_3 }"
									name="qna_img_3" class="img-fluid rounded" />
								</a>
							</td>

						</c:when>

						<c:when
							test="${not empty view.qna_img_1 and not empty view.qna_img_2}">
							<tr>
								<td>
									<a
									href="/project/resources/qna/images/${view.qna_img_1 }"
									data-toggle="lightbox" data-gallery="example-gallery"
									class="col-sm-4"> 
									<img style="width: 150px; height: 150px;"
										src="/project/resources/qna/images/${view.qna_img_1 }"
										name="qna_img_1" class="img-fluid rounded" />
									</a>
								</td>
								<td>
									<a
									href="/project/resources/qna/images/${view.qna_img_2 }"
									data-toggle="lightbox" data-gallery="example-gallery"
									class="col-sm-4"> 
									<img style="width: 150px; height: 150px;"
										src="/project/resources/qna/images/${view.qna_img_2 }"
										name="qna_img_2" class="img-fluid rounded" />
									</a>
								</td>
							</tr>
						</c:when>

						<c:when test="${not empty view.qna_img_1 }">
							<tr>
								<td>
									<a
									href="/project/resources/qna/images/${view.qna_img_1 }"
									data-toggle="lightbox" data-gallery="example-gallery"
									class="col-sm-4"> 
									<img style="width: 150px; height: 150px;"
										src="/project/resources/qna/images/${view.qna_img_1 }"
										name="qna_img_1" class="img-fluid rounded" />
									</a>
								</td>
							</tr>
						</c:when>

						<c:otherwise>
							<div>
								<h4>첨부된 사진이 없습니다.</h4>
							</div>
						</c:otherwise>
					</c:choose>
					<!-- 해당 ID가 작성한게 맞으면 보이게 끔 수정 -->
					<a href="./qna_modify?qna_num=${view.qna_num }" onclick="return confirm('해당 글을 수정 하시겠습니까?');">글 수정하기</a>
					<a href="./qna_delete?qna_num=${view.qna_num }" onclick="return confirm('정말로 삭제 하시겠습니까?');">글 삭제하기</a>
					</div>
				</c:forEach>
			
			</div>

			<c:choose>
				<c:when test="${not empty replys }">
					<table>
						<c:forEach items="${replys }" var="reply">
							<tr>
								<td>닉네임 : ${reply.comment_id }</td>
							</tr>
							<tr>

								<td>댓글 내용 : ${reply.comment_view }</td>
								<td>작성일 : ${reply.write_date }</td>
								<td>
									<a
									href="./replyModify?no=${reply.comment_no }&board_id=${board.board_id}"
									onclick="return confirm('댓글 수정을 하시겠습니까?');">수정</a>
								</td>
								<td>
									<a
									href="./replyDelete?no=${reply.comment_no }&board_id=${board.board_id}"
									onclick="return confirm('정말로 삭제 하시겠습니까?');">삭제</a>
								</td>
							</tr>
							<tr>
								<td style="background-color: orange"></td>
							</tr>
						</c:forEach>

					</table>
				</c:when>

				<c:otherwise>
					<table>
						<tr>
							<td>관리자의 댓글을 기다리고 있어요.</td>
						</tr>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

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