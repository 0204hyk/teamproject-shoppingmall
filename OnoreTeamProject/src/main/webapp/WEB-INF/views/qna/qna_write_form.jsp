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
				<option value="주문 / 결제">주문 / 결제</option>
				<option value="배송">배송</option>
				<option value="반품 / 교환">반품 / 교환</option>
				<option value="기타">기타</option>
			</select> 

			<input type="hidden" name="product_num" value="1"> 
			<input type="hidden" name="mem_id" value="test"> 
			<input type="text" name="qna_title"><br>
			<textarea rows="30" cols="80" name="qna_content">내용을 입력해주세요.</textarea>
			<input type="file" name="file" /><br> 
			<input type="submit" value="등록하기">
		</form>
		<br> <a href="./main">목록으로</a>
	</div>

	<%@include file="./bottom.jspf"%>
</body>
</html>