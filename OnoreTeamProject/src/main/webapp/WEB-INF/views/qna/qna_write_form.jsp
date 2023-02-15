<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오노레 글쓰기</title>
<%@include file="./header.jspf"%>
</head>
<body>
	<%@include file="./top.jspf"%>


	<div class="border"
		style="margin-left:20px; padding-top: 300px; width: auto; height: 800px; margin: 50px; margin-top: 0px">
		<form action="./qna_insert" method="post">
		
			<select>
				<option value="choice">분류</option>
				<option value="goods">상품</option>
				<option value="order_pay">주문 / 결재</option>
				<option value="delivery">배송</option>
				<option value="return_exchange">반품 / 교환</option>
				<option value="other">기타</option>
			</select>
			
			<input type="text" name="title" value="제목을 입력해주세요."><br>
		
			글 비밀번호 : <input type="password" name="qna_pw" value="비밀번호를 입력해주세요.">
			비밀번호 확인 : <input type="password" name="qna_pw_check" value="비밀번호를 입력해주세요."><br>
			<textarea rows="30" cols="80">내용을 입력해주세요.</textarea><br>
			<input type="file">
			<input type="submit" value="등록하기">
		</form>
		<br>
		<a href="./main">목록으로</a>
	</div>
	<%@include file="./bottom.jspf"%>
</body>
</html>