<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오노레 글쓰기</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/project/resources/qna/css/qna_write.css" />
<%@include file="../header.jspf"%>
</head>
<body>
	<%@include file="../top.jspf"%>

	<div class="main"
		style="padding-top: 127px; width: auto; height: auto; margin: 50px; margin-top: 0px;">
		<div class="qna-form">
		<form class="mb-3" id="myform" action="./qna_addWrite" method="post"
			enctype="multipart/form-data">
			<select name="qna_category" id="select" onchange="changeSelect(this);">
				<option value="분류">분류</option>
				<option value="상품">상품</option>
				<option value="주문 / 결제">주문 / 결제</option>
				<option value="배송">배송</option>
				<option value="반품 / 교환">반품 / 교환</option>
				<option value="기타">기타</option>
			</select> 
			<input type="hidden" id="p_num" name="product_num" value="">
			<input type="hidden" name="mem_id" value="abc123"> 
			<input type="text" name="qna_title" placeholder="제목을 입력해 주세요.">
			<div id="inputs">
			
			</div>
			<div class="img-preview">
				<textarea rows="10" cols="100" name="qna_content" placeholder="내용을 입력해 주세요." ></textarea>
				<br>
				<div id="firstImg">
					<input type="file" name="file" id="file-input" class="img-input" accept="image/*" onchange="PreviewImage();"/>
				
					<div id="imgBox1">
    

        			</div>
				</div>
		
				<div id="secondImg">
					<input type="file" name="file" id="file-input2" class="img-input" accept="image/*" onchange="PreviewImage2();"/>
				
					<div id="imgBox2">
    

        			</div>
				</div>
				
				<div id="thirdImg">
					<input type="file" name="file" id="file-input3" class="img-input" accept="image/*" onchange="PreviewImage3();"/>
				
					<div id="imgBox3">
    

        			</div>
				</div>
				
				<img class="image-box" name="qna_img_1" id="user-image1" />
				<img class="image-box" name="qna_img_2" id="user-image2" />
				<img class="image-box" name="qna_img_3" id="user-image3" />
			</div>
			<input type="submit" value="등록하기">
		</form>
		</div>
	</div>

	<script type="text/javascript"
		src="/project/resources/qna/js/qna_write.js"></script>

	<%@include file="../bottom.jspf"%>
</body>
</html>