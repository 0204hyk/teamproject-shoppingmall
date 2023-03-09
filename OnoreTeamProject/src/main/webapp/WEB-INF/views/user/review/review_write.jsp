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
	href="/project/resources/review/css/review_write.css">
<script src="/project/resources/review/js/review_write.js" defer></script>
</head>
<body>

	<%@ include file="../top.jspf"%>

	<div class="main"
		style="padding-top: 127px; width: auto; margin: 50px; margin-top: 0px;">
		<hr>
		<div class="write">
		<form class="mb-3" id="myform" action="./write" method="POST" enctype="multipart/form-data">
			<div class="container">
				<div class="a">
					<div name="prd_img">
						<img src="${product.product_thumbnail_1 }">
					</div>
				</div>
				<div class="b">
					<table>
						<tr>
							<th id="prd_name">${product.product_name }후기</th>
						</tr>
						<tr>
							<th>
								<fieldset>
									<!--  <div class="text-bold">제품을 평가해주세요</div>-->
									<input type="radio" name="review_rating" value="5" id="rate1"
											onclick="getrating(event)"> <label for="rate1">★</label>
									<input type="radio" name="review_rating" value="4" id="rate2"
											onclick="getrating(event)"> <label for="rate2">★</label>
									<input type="radio" name="review_rating" value="3" id="rate3"
											onclick="getrating(event)"> <label for="rate3">★</label>
									<input type="radio" name="review_rating" value="2" id="rate4"
											onclick="getrating(event)"> <label for="rate4">★</label>
									<input type="radio" name="review_rating" value="1" id="rate5"
											onclick="getrating(event)"> <label for="rate5">★</label>
								</fieldset>
							</th>
						</tr>
					</table>
				</div>
			</div>
			<hr>
			<div class="container2">
				<textarea  name="review_content" id="reviewContents" cols="150"
					rows="30" placeholder="리뷰를 작성해 주세요."></textarea>
				<div id="image-box">
					<img id="user-image1" class="image-box" /> 
					<img id="user-image2" class="image-box"/> 
					<img id="user-image3" class="image-box"/>
				</div>
				<br>
				<div class="sub-container2">
				
					<input type="file" name="file" id="file-input" class="inputW" accept="image/*" onchange="PreviewImage();" />
					<span id="imgBox1"></span>
					<input type="file" name="file" id="file-input2" class="inputW" accept="image/*" onchange="PreviewImage2();"/> 
					<span id="imgBox2"></span>
					<input type="file" name="file" id="file-input3" class="inputW" accept="image/*" onchange="PreviewImage3();"/>
					<span id="imgBox3"></span>
					<input type="submit" id="write_btn" formaction="./write" value="등록" onclick="return confirm('완료하시겠습니까?')">
				</div>
			</div>
			</form>
		</div>
	</div>

	<hr>

	<%@ include file="../bottom.jspf"%>

</body>
</html>