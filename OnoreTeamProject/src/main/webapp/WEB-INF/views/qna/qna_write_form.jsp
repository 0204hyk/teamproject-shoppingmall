<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오노레 글쓰기</title>
<%@include file="./header.jspf"%>
<link rel="stylesheet" href="/project/resources/qna/css/file.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<%@include file="./top.jspf"%>


		<div class="border"
		style="margin-left: 20px; padding-top: 200px; width: auto; height: 800px; margin: 50px; margin-top: 0px">
		<form action="./qna_addWrite" method="post" enctype="multipart/form-data" >
			<select name="qna_category" id="select" onchange="changeSelect(this)">
				<option value="분류">분류</option>
				<option value="상품">상품</option>
				<option value="주문 / 결제">주문 / 결제</option>
				<option value="배송">배송</option>
				<option value="반품 / 교환">반품 / 교환</option>
				<option value="기타">기타</option>
			</select> 
			
			<input type="hidden" name="product_num" value="1"> 
			<input type="hidden" name="mem_id" value="test"> 
			<input type="text" name="qna_title">
			<div id="inputs">
				
			</div>
			<textarea rows="30" cols="80" name="qna_content">내용을 입력해주세요.</textarea><br>
			<input type="file" name="file"/>
			<input type="file" name="file"/>
			<input type="file" name="file"/>
			<br> 
			
			
			<input type="submit" value="등록하기">
		</form>
		<br> <a href="./main">목록으로</a>
	</div>
	
	<script>
		function changeSelect(e) {
			
			const input = document.getElementById('inputs');

			const value = e.value;
			
			if (value === '상품') {
				input.innerHTML += `<input type='text' name='category' />`;
				input.innerHTML += `<button name='search'>상품검색</button>`;
			} else {
				input.innerHTML = '';
			}
	
		}
	</script>

	<%@include file="./bottom.jspf"%>
</body>
</html>