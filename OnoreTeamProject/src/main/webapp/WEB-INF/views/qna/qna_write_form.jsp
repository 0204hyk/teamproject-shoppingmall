<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오노레 글쓰기</title>
<%@include file="./header.jspf"%>
<link rel="stylesheet" href="/project/resources/qna/css/file.css" />
</head>
<body>
	<%@include file="./top.jspf"%>


	<div class="border"
		style="margin-left: 20px; padding-top: 200px; width: auto; height: 800px; margin: 50px; margin-top: 0px">
		<form action="./qna_addWrite" method="post" enctype="multipart/form-data">
			<select name="qna_category">
				<option value="분류">분류</option>
				<option value="상품">상품</option>
				<option value="주문">주문 / 결재</option>
				<option value="배송">배송</option>
				<option value="반품">반품 / 교환</option>
				<option value="기타">기타</option>
			</select> 
			<input type="hidden" name="product_num" value="1">
			<input type="hidden" name="mem_id" value="test">
			<input type="text" name="qna_title" value="제목을 입력해주세요."><br>

			<textarea rows="30" cols="80" name="qna_content">내용을 입력해주세요.</textarea>
			<br>
			<div class="form-group" style="height: 150px; width: 200px;">
				<input type="hidden" name="qna_img_path" value="/Users/kang/qna_images/">
				<img id="previewImg1" height="100" width="100" />
				<img id="previewImg2" height="100" width="100" />
				<img id="previewImg3" height="100" width="100" /><br>
				<input type="file" name="qna_img_1" id="fileUpload1" accept=".jpg, .png, .bmp" />
				<input type="file" name="qna_img_2" id="fileUpload2" accept=".jpg, .png, .bmp" />
				<input type="file" name="qna_img_3" id="fileUpload3" accept=".jpg, .png, .bmp" /><br>
			<input type="submit" value="등록하기">
			</div>
		</form>
		<br> <a href="./main">목록으로</a>
	</div>
	
	
	<script src="/project/resources/qna/js/file.js"></script>
	<%@include file="./bottom.jspf"%>
</body>
</html>