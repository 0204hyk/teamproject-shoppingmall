<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!-- 실패 - 생년월일 형식을 yyyyMMdd로 만들기 위한 라이브러리 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONÓRE</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@include file="../member/member_header.jspf"%>
</head>
<body>
<%@include file="../member/member_top.jspf"%>

<!-- middle 시작 -->
<div class="middle_member_info_modify_div">
	<form id="member_info_modify_form" action="memberInfoModify" method="POST" name="member_info_modify_form">
		<div class="member_info_modify_div">
			<div class="member_info_modify_title_div">
				<a>회원정보수정</a>
			</div>
			<div class="modify_id_div">
				<div class="modify_a_div">
					<a>아이디*</a>
				</div>
				<div class="modify_input_div">
					<input class="mem_id" id="mem_id" type="text" name="mem_id" value="${sessionScope.signIn.mem_id}" readonly onchange="id_Check()" required>
				</div>

				<div class="modify_pw1_div">
					<div class="modify_a_div">
						<a>신규 비밀번호*</a>
					</div>
					<div class="modify_input_div">
						<input id="mem_pw" type="password" name="mem_pw" placeholder="※8자 이상 영문자, 숫자, 특수문자 조합" maxlength="18" onchange="check_pw()" required>
					</div>
				</div>
				<div class="modify_message_div">
					<p id="modify_pw_message_p"></p>
				</div>
				<div class="modify_pw2_div">
					<div class="modify_a_div">
						<a>신규 비밀번호 확인*</a>
					</div>
					<div class="modify_input_div">
						<input id="mem_pw2" type="password" name="mem_pw2" placeholder="비밀번호를 확인하세요" onchange="check_pw2()" required>
					</div>
				</div>
				<div class="modify_message_div">
					<p id="modify_pw2_message_p"></p>
				</div>

				<div class="modify__email_div">
					<div class="modify_a_div">
						<a>이메일*</a>
					</div>
					<div class="modify_input_div">
						<input id="mem_email" type="text" name="mem_email" value="${sessionScope.signIn.mem_email}" onchange="check_email()" required>
					</div>
				</div>
				<div class="modify_message_div">
					<p id="modify_email_message_p"></p>
				</div>

				<div class="modify__phone_div">
					<div class="modify_a_div">
						<a>연락처*</a>
					</div>
					<div class="modify_input_div">
						<input id="mem_phone" type="text" name="mem_phone" value="${sessionScope.signIn.mem_phone}" oninput="check_phone()" value="${sessionScope.signIn.mem_phone}" required>
					</div>
				</div>
				<div class="modify_message_div">
					<p id="modify_phone_message_p"></p>
				</div>
	
				<div class="modify_check_sms_div">
					<div class="modify_input_check_div">
						<c:choose>
						<c:when test="${sessionScope.signIn.mem_sms_check eq 'Y'}">
							<input class="law_check_box" id="mem_sms_check" type="checkbox" name="mem_sms_check" checked>
						</c:when>
						<c:otherwise>
							<input class="law_check_box" id="mem_sms_check" type="checkbox" name="mem_sms_check" value="Y">
						</c:otherwise>
						</c:choose>
					</div>
					<div class="modify_a_sms_div">
						<a>[선택] SMS 수신 여부</a>
					</div>
				</div>
				<div class="modify_check_email_div">
					<div class="modify_input_check_div">
						<c:choose>
						<c:when test="${sessionScope.signIn.mem_email_check eq 'Y'}">
							<input class="law_check_box" id="mem_email_check" type="checkbox" name="mem_email_check" checked>
						</c:when>
						<c:otherwise>
							<input class="law_check_box" id="mem_email_check" type="checkbox" name="mem_email_check" value="Y">
						</c:otherwise>
						</c:choose>
					</div>
					<div class="modify_a_email_div">
						<a>[선택] 이메일 수신 여부</a>
					</div>
				</div>
				
				</div>
				<!-- 체크박스 그룹 -->
				<article>
					<div class="member_info_modify_Btn_div">
						<input class="member_info_modify_Btn" type="submit" value="수정하기"><br>
					</div>
				</article>
			</div>
	</form>
</div>
<!-- middle 끝 -->

<script src="/project/resources/menu/js/menubar.js?ver=2"></script>
<%@include file="../member/member_bottom.jspf"%>