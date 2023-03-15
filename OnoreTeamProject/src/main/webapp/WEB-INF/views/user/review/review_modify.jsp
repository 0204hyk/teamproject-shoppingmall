<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONÓRE</title>
<%@ include file="../header.jspf"%>
<link rel="icon" href="<%=request.getContextPath() %>/resources/review/image/파비콘.png">
<link rel="stylesheet"href="<%=request.getContextPath() %>/resources/review/css/review_modify.css">
<script src="<%=request.getContextPath() %>/resources/review/js/review_modify.js" defer></script>
</head>
<body>

	<%@ include file="../top.jspf"%>

	<div class="main"
		style="padding-top: 127px; width: auto;  margin: 50px; margin-top: 0px;">
		<hr>
		<div class="write">
			<form class="mb-3" id="myform" action="./modify" method="POST" enctype="multipart/form-data">
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
									<input type="hidden" name="review_num" value="${contents.review_num }">
									<input type="hidden" id="star" value="${contents.review_rating }">
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
			<textarea id="reviewContents" name="review_content" cols="150"
					rows="30">${contents.review_content }</textarea>
					
			<div class="container2">
				<div id="img-box">
					<img id="previewImg1" /> 
					<img id="previewImg2" /> 
					<img id="previewImg3" />
				</div>
				<br>
				<div class="sub-container2">
					<div>
						<input type="file" id="fileUpload1" accept=".jpg, .png, .bmp, .jpeg" />
					</div>
					<div>
						<input type="file" id="fileUpload2" accept=".jpg, .png, .bmp, .jpeg" />
					</div>
					<div>
						<input type="file" id="fileUpload3" accept=".jpg, .png, .bmp, .jpeg" />
					</div>
					<br> 
				</div>
				<div style="height: 80px;">
				<input id="modify_btn" type="submit" value="수정" onclick="return confirm('수정하시겠습니까?')">
				</div>
			</div>
			</form>
		</div>
	</div>	
			<hr>

	<%@ include file="../bottom.jspf"%>

</body>
</html>