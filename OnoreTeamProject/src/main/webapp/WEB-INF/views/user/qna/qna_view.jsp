<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../header.jspf"%>
<link rel="stylesheet" href="/project/resources/qna/css/qna_detail.css" />
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
</head>
<body>
	<%@include file="../top.jspf"%>
	<table>
		<c:forEach items="${views }" var="view">
			제목 : ${view.qna_title } 내용 : ${view.qna_content } 	
				<c:choose>
				
					<c:when test="${not empty view.qna_img_1 and not empty view.qna_img_2 and not empty view.qna_img_3}">
						<td>
							<a href="/project/resources/qna/images/${view.qna_img_1 }" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-4"> 
							<img style="width: 150px; height: 150px;" src="/project/resources/qna/images/${view.qna_img_1 }" class="img-fluid rounded" />
							</a> 
						</td>
						<td>
							<a href="/project/resources/qna/images/${view.qna_img_2 }" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-4"> 
							<img style="width: 150px; height: 150px;" src="/project/resources/qna/images/${view.qna_img_2 }" class="img-fluid rounded" />
							</a>
						</td>
						<td>
							<a href="/project/resources/qna/images/${view.qna_img_3 }" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-4"> 
							<img style="width: 150px; height: 150px;" src="/project/resources/qna/images/${view.qna_img_3 }" class="img-fluid rounded" />
							</a>
						</td>
					</c:when>
				
					<c:when test="${not empty view.qna_img_1 and not empty view.qna_img_2}">
						<td>
							<a href="/project/resources/qna/images/${view.qna_img_1 }" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-4"> 
							<img style="width: 150px; height: 150px;" src="/project/resources/qna/images/${view.qna_img_1 }" class="img-fluid rounded" />
							</a> 
						</td>			
						<td>
							<a href="/project/resources/qna/images/${view.qna_img_2 }" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-4"> 
							<img style="width: 150px; height: 150px;" src="/project/resources/qna/images/${view.qna_img_2 }" class="img-fluid rounded" />
							</a>
						</td>
					</c:when>
					
					<c:when test="${not empty view.qna_img_1 }">
						<td>
							<a href="/project/resources/qna/images/${view.qna_img_1 }" data-toggle="lightbox" data-gallery="example-gallery" class="col-sm-4"> 
							<img style="width: 150px; height: 150px;" src="/project/resources/qna/images/${view.qna_img_1 }" class="img-fluid rounded" />
							</a> 
						</td>	
					</c:when>
					
					<c:otherwise>
						<div>
							<h4>첨부된 사진이 없습니다.</h4>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</table>
	<hr />
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
						<td><a
							href="./replyModify?no=${reply.comment_no }&board_id=${board.board_id}"
							onclick="return confirm('댓글 수정을 하시겠습니까?');">수정</a></td>
						<td><a
							href="./replyDelete?no=${reply.comment_no }&board_id=${board.board_id}"
							onclick="return confirm('정말로 삭제 하시겠습니까?');">삭제</a></td>
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
					<td>댓글을 입력해 주세요.</td>
				</tr>
			</table>
		</c:otherwise>
	</c:choose>

	<script>
		$(document).on('click', '[data-toggle="lightbox"]', function(event) {
			event.preventDefault();
			$(this).ekkoLightbox();
		});
	</script>

	<%@include file="../bottom.jspf"%>
</body>
</html>