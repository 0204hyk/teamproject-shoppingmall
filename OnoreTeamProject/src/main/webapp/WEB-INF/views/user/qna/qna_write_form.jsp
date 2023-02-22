<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오노레 글쓰기</title>
<%@include file="../header.jspf"%>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</head>
<body>
	<%@include file="../top.jspf"%>


	<div class="main"
		style="padding-top: 127px; width: auto; height: 800px; margin: 50px; margin-top: 0px;">
		<form class="mb-3" id="myform" action="./qna_addWrite" method="post"
			enctype="multipart/form-data">
			<select name="qna_category" id="select" onchange="changeSelect(this)">
				<option value="분류">분류</option>
				<option value="상품">상품</option>
				<option value="주문 / 결제">주문 / 결제</option>
				<option value="배송">배송</option>
				<option value="반품 / 교환">반품 / 교환</option>
				<option value="기타">기타</option>
			</select> 
			<input type="hidden" name="product_num" value="1"> 
			<input type="hidden" name="mem_id" value="test"> <input type="text"
				name="qna_title">
			<div id="inputs"></div>
			<textarea rows="10" cols="50" name="qna_content">내용을 입력해주세요.</textarea>
			<br> 
			<input type="file" name="file" accept="image/*" onchange="addFile(this);" />
			
			<div id="file-list">
			
			</div>
			<br> <input type="submit" value="등록하기">
		</form>
		<br> <a href="./main">목록으로</a>
	</div>
	<script>
	/* 첨부파일 추가 */
	function addFile(obj){
	    const input = document.getElementById('file-list');
	   	
	    for (var i = 0; i <= 2; i++) {
	    	if (i == 0) {
	    		input.innerHTML = `<input type='file' name='file' />`;
	    	} else if (i == 1) {
	    		input.innerHTML += `<input type='file' name='file' />`;
	    	} else if (i == 2) {
	    		alert('첨부파일은 최대 3개까지 가능합니다.');
	    	}
	    }
	}
		
	//input.innerHTML = `<input type='file' name='file' />`;
	</script>
	<!-- 
	<script src="/project/resources/qna/js/qna_write.js"></script>
 	-->
	<%@include file="../bottom.jspf"%>
</body>
</html>