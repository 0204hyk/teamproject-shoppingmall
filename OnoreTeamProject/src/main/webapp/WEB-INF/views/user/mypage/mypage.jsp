<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오노레 마이페이지</title>
<%@include file="../header.jspf"%>
<link rel="stylesheet"
	href="/project/resources/mypage/css/mypage_main.css" />

</head>
<body>
	<%@include file="../top.jspf"%>

	<div class="main"
		style="padding-top: 127px; width: auto; height: auto; margin: 50px; margin-top: 0px;">
		<div class="flex-container">
			<div class="my-orders">
				<table>
					<tr>
						<th>주문내역</th>
					</tr>

					<tr>
						<td>일자</td>
						<td>상품 정보</td>
						<td>가격</td>
						<td>상태</td>
					</tr>

					<tr>
						<th>주문내역이 없습니다.</th>
					</tr>
				</table>
				<table>
					<tr>
						<th>쿠폰내역</th>
					</tr>

					<tr>
						<th>쿠폰내역이 없습니다.</th>
					</tr>
				</table>
			</div>
			<div class="my-info">
				<form action="">
					아이디<br>
					<input type="text" name="id" value="test" readonly="readonly" class="input" style="background-color: #e2e2e2;" /><br>
					
					이메일<br>
					<input type="email" name="email" value="test@naver.com" readonly="readonly" class="input" style="background-color: #e2e2e2;"/><br>
					
					이름<br>
					<input type="text" name="user_name" value="onore회원" readonly="readonly" class="input" style="background-color: #e2e2e2;"/><br>
					휴대폰 번호<br>
					<input type="tel" name="phone"  /><br>
					우편 번호<br>
					<input type="tel" name="phone"  /> <input type="button" value="검색하기" /><br>
					주소<br>
					<input type="text" /><br>
					<input type="text" /><br>
				</form>
			
			
			</div>
		</div>

	</div>

	<%@include file="../bottom.jspf"%>
</body>
</html>