<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오노레 글쓰기</title>
<link rel="icon" href="<%=request.getContextPath() %>/resources/qna/images/favicon.png">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/qna/css/qna_write.css" />
<%@include file="../header.jspf"%>
</head>
<body>
	<%@include file="../top.jspf"%>
	<div class="main"
		style="padding-top: 127px; width: auto; margin: 50px; margin-top: 0px;">
		<hr>
		<form class="mb-3" id="myform" action="<%=request.getContextPath() %>/qna/qna_addWrite" method="post"
			enctype="multipart/form-data">
		<div class="qna-form">
			<select name="qna_category" id="select" onchange="changeSelect(this);">
				<option value="분류">분류</option>
				<option value="상품">상품</option>
				<option value="주문 / 결제">주문 / 결제</option>
				<option value="배송">배송</option>
				<option value="반품 / 교환">반품 / 교환</option>
				<option value="기타">기타</option>
			</select> 
			<input type="hidden" id="p_num" name="product_num" value="">
			<input type="hidden" name="mem_id" value="${sessionScope.signIn.mem_id }"> 
			<input type="text" name="qna_title" id="title" placeholder="제목을 입력해 주세요.">
			<br>
			<div id="inputs">
			</div>
			
			<hr>
				<textarea rows="30" cols="150" id="qna_content" name="qna_content" placeholder="내용을 입력해 주세요." ></textarea>
			<hr>	
			<br>

				<div id="image-box">
					<img class="image-box" name="qna_img_1" id="user-image1" /> <img
						class="image-box" name="qna_img_2" id="user-image2" /> <img
						class="image-box" name="qna_img_3" id="user-image3" />
				</div>
				<br>

				<div class="img-preview">
					<div id="firstImg">
						<input type="file" name="file" id="file-input" class="img-input"
							accept="image/*" onchange="PreviewImage();" /> <span id="imgBox1"></span>
					</div>

					<div id="secondImg">
						<input type="file" name="file" id="file-input2" class="img-input"
							accept="image/*" onchange="PreviewImage2();" /> <span
							id="imgBox2"></span>
					</div>

					<div id="thirdImg">
						<input type="file" name="file" id="file-input3" class="img-input"
							accept="image/*" onchange="PreviewImage3();" /> <span
							id="imgBox3"></span>
					</div>

				</div>
				<input type="submit" id="write_btn" value="문의 등록">
			</div>

		</form>
	</div>

	<%@include file="../bottom.jspf"%>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/qna/js/qna_write.js"></script>

	
</body>
</html>