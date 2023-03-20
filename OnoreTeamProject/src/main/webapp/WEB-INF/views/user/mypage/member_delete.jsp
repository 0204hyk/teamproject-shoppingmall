<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONÓRE</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="<%=request.getContextPath() %>/resources/mypage/css/member_delete.css?ver=1" rel="stylesheet"/>
<link rel="icon" href="<%=request.getContextPath() %>/resources/main/images/fabicon.png">

<%@include file="../header.jspf"%>
</head>
<body>
<%@include file="../top.jspf"%>

<!-- middle 시작 -->
<div class="middle_member_info_delete_div">
	<form id="member_info_delete_form" action="./memberDelete.do" method="POST" name="member_info_delete_form">
		<div class="member_info_delete_div">
			<div class="member_delete_title_div">
				<a>회원탈퇴</a>
			</div>
			<div class="member_delete_id_div">
				<div class="member_delete_a_div">
					<a>아이디</a>
			</div>
				<div class="delete_input_div">
					<input class="mem_id" id="mem_id" type="text" name="mem_id" value="${sessionScope.signIn.mem_id}" readonly>
				</div>
			</div>
			
			<div class="delete_pw_div">
				<div class="member_delete_a_div">
					<a>비밀번호</a>
				</div>
				<div class="delete_input_div">
					<input id="mem_pw" type="password" name="mem_pw" placeholder="비밀번호를 입력하세요." maxlength="18" required>
				</div>
			</div>
				<div class="delete_message_div">
					<p id="delete_pw_message_p"></p>
				</div>
			
			<article>
				<div class="member_delete_Btn_div">
					<input class="member_delete_Btn" type="submit" onclick="check()" value="탈퇴하기"><br>
				</div>
			</article>
		</div>
	</form>
</div>
<!-- middle 끝 -->

<script src="<%=request.getContextPath() %>/resources/menu/js/menubar.js?ver=2"></script>
<%@include file="../bottom.jspf"%>