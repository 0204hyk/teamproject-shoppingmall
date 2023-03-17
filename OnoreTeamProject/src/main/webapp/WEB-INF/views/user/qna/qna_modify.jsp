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
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/qna/css/qna_write.css" />
</head>
<body>
	<%@include file="../top.jspf"%>

	<div class="main"
		style="padding-top: 127px; width: auto; height: 1200px; margin: 50px; margin-top: 0px;">
		<hr>
		<form action="<%=request.getContextPath() %>/qna/qna_modify" method="POST" enctype="multipart/form-data">
		<div class="qna-form">
			<input type="hidden" name="qna_num" value=${qna.qna_num } />
			<select name="qna_category" id="select"  onchange="changeSelect(this);">
				<option value="분류">분류</option>
				<option value="상품">상품</option>
				<option value="주문 / 결제">주문 / 결제</option>
				<option value="배송">배송</option>
				<option value="반품 / 교환">반품 / 교환</option>
				<option value="기타">기타</option>
			</select> 
			<input type="text" name="qna_title" id="title" placeholder="제목을 입력하세요." value="${qna.qna_title }">
			<input type="hidden" id="p_num" name="product_num" value="">
	
			<br>
			<div id="inputs">
			</div>

			<hr>
				<textarea rows="30" cols="150" id="qna_content" name="qna_content" placeholder="내용을 입력해 주세요.">${qna.qna_content }</textarea>
			<hr>
				
			<br>
			
			<div id="img-box">
				<img class="image-box" id="user-image1" src="<%=request.getContextPath() %>/resources/qna/images/${qna.qna_img_1 }"/>
				<img class="image-box" id="user-image2" src="<%=request.getContextPath() %>/resources/qna/images/${qna.qna_img_2 }"/>
				<img class="image-box" id="user-image3" src="<%=request.getContextPath() %>/resources/qna/images/${qna.qna_img_3 }"/>		
			</div>
			
			<br>	
			<div class="img-preview">
				<div>
					<input type="file" name="file" accept="image/*" id="file-input" class="img-input" onchange="PreviewImage();"/>
					<span id="imgBox1"></span>
				</div>
				<div>
					<input type="file" name="file" accept="image/*" id="file-input2" class="img-input" onchange="PreviewImage2();"/>
					<span id="imgBox2"></span>
				</div>
				<div>
					<input type="file" name="file" accept="image/*" id="file-input3" class="img-input" onchange="PreviewImage3();"/>
					<span id="imgBox3"></span>
				</div>	
				<input type="hidden" name="qna_img_1" value="${qna.qna_img_1 }"/>
				<input type="hidden" name="qna_img_2" value="${qna.qna_img_2 }"/>
				<input type="hidden" name="qna_img_3" value="${qna.qna_img_3 }"/>
			</div>			
				<input type="submit" id="write_btn" value="수정" >
		</div>
		</form>
	</div>
		<hr>	

	
	<script type="text/javascript"
		src="<%=request.getContextPath() %>/resources/qna/js/qna_modify.js"></script>

	<%@include file="../bottom.jspf"%>
</body>
</html>