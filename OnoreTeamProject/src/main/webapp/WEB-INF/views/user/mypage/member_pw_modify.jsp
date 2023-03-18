<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONÓRE</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="<%=request.getContextPath() %>/resources/mypage/css/member_info_pw_modify.css" rel="stylesheet"/>
<%@include file="../header.jspf"%>
</head>
<body>
<%@include file="../top.jspf"%>

<!-- middle 시작 -->
<div class="middle_pw_modify_div">
	<form id="pw_modify_form" action="memberPwModify" method="POST" name="pw_modify_form">
		<div class="pw_modify_div">
			<div class="pw_modify_title_div">
				<a>비밀번호 변경</a>
			</div>
			
				<div class="pw_modify_id_div">
					<div class="pw_modify_a_div">
						<a>아이디</a>
					</div>
					<div class="pw_modify_input_div">
						<input class="mem_id" id="mem_id" type="text" name="mem_id" value="${sessionScope.signIn.mem_id}" readonly>
					</div>
				</div>
				
				<div class="pw_modify_pw1_div">
					<div class="pw_modify_a_div">
						<a>신규 비밀번호</a>
					</div>
					<div class="pw_modify_input_div">
						<input id="mem_pw" type="password" name="mem_pw" maxlength="18" onchange="check_pw()" required>
					</div>
				</div>
				<div class="pw_modify_message_div">
					<p id="pw_modify_pw_message_p"></p>
				</div>
				<div class="pw_modify_pw2_div">
					<div class="pw_modify_a_div">
						<a>신규 비밀번호 확인</a>
					</div>
					<div class="pw_modify_input_div">
						<input id="mem_pw2" type="password" onchange="check_pw2()" required>
					</div>
				</div>
				<div class="pw_modify_message_div">
					<p id="pw_modify_pw2_message_p"></p>
				</div>
			<article>
				<div class="pw_modify_Btn_div">
					<input class="pw_modify_Btn" type="submit" onclick="check()" value="비밀번호변경">
					<button type="button" class="mypage_go_btn" onclick="location.href='./mypage'">취소</button>
				</div>
			</article>
		</div>
	</form>
</div>
<!-- middle 끝 -->

<script type="text/javascript" src="<%=request.getContextPath() %>/resources/mypage/js/member_pw_modify.js"></script>
<script src="<%=request.getContextPath() %>/resources/menu/js/menubar.js"></script>
<%@include file="../bottom.jspf"%>