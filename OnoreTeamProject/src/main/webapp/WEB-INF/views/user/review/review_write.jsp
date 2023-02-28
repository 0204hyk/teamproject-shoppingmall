<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONÓRE</title>
<%@ include file="../header.jspf" %>
<link rel="icon" href="/project/resources/review/image/파비콘.png">
<link rel="stylesheet"href="/project/resources/review/css/review_write.css?ver=41">
<script src="/project/resources/review/js/review_write.js" defer></script>
</head>
<body>

	<%@ include file="../top.jspf" %>

	<div class="main" style="padding-top: 127px;  width: auto; height: 800px; margin:50px; margin-top: 0px;">
	<hr>
		<div>
			<form class="mb-3" id="myform" action="./write" method="POST" enctype="multipart/form-data">
				<fieldset>
					<span class="text-bold">별점을 선택해주세요</span>
					<input type="radio" name="review_rating" value="5" id="rate1" onclick="getrating(event)">
					<label for="rate1">★</label>
					<input type="radio" name="review_rating" value="4" id="rate2" onclick="getrating(event)">
					<label for="rate2">★</label>
					<input type="radio" name="review_rating" value="3" id="rate3" onclick="getrating(event)">
					<label for="rate3">★</label>
					<input type="radio" name="review_rating" value="2" id="rate4" onclick="getrating(event)">
					<label for="rate4">★</label>
					<input type="radio" name="review_rating" value="1" id="rate5" onclick="getrating(event)">
					<label for="rate5">★</label>
				</fieldset>
				<br>
				<textarea id="reviewContents" name="review_content" cols="30" rows="30">리뷰를 작성해주세요</textarea><br>
					<span>이미지 파일 첨부</span> <br>
					<img id="previewImg1" height="100" width="100" />
					<img id="previewImg2" height="100" width="100" />
					<img id="previewImg3" height="100" width="100" /><br>
					<input type="file" id="fileUpload1" accept=".jpg, .png, .bmp, .jpeg" />
					<input type="file" id="fileUpload2" accept=".jpg, .png, .bmp, .jpeg" />
					<input type="file" id="fileUpload3" accept=".jpg, .png, .bmp, .jpeg" /><br>
					<input type="submit" value="등록">
			</form>
		</div>
	</div>
	
	<hr>
	
	<%@ include file="../bottom.jspf" %>

</body>
</html>