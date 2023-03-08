<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONÓRE</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
//이메일 정규식
function check_email() {
	var email = document.getElementById("mem_email").value;
	var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[a-zA-Z]([-_.]?[a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	if (regEmail.test(email) == true) {
		document.getElementById('info_modify_email_message_p').innerHTML = "사용 가능한 이메일입니다."
		document.getElementById('info_modify_email_message_p').style.color = "blue";
	} else {
		document.getElementById('info_modify_email_message_p').innerHTML = "올바른 이메일을 입력하세요."
		document.getElementById('info_modify_email_message_p').style.color = "red";
	}
}

// 연락처(핸드폰번호) 정규식
function check_phone() {
	var phone = document.getElementById("mem_phone").value;
	var regPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/; // - 생략하고 01?(3글자) 방식으로 나머지 적용
	if (regPhone.test(phone) == true) {
		document.getElementById('info_modify_phone_message_p').innerHTML = "올바른 연락처 입니다."
		document.getElementById('info_modify_phone_message_p').style.color = "blue";
	} else {
		document.getElementById('info_modify_phone_message_p').innerHTML = "올바른 연락처를 입력하세요."
		document.getElementById('info_modify_phone_message_p').style.color = "red";
	}
}

function check() {
	var f = document.info_modify_form;
	if (f.mem_email.value == "") {
		alert("이메일을 입력해주세요");
		f.mem_email.focus();
		return false;
	}
	if (f.mem_phone.value == "") {
		alert("전화번호를 입력해주세요");
		f.mem_phone.focus();
		return false;
	}
</script>
<%@include file="../member/member_header.jspf"%>
</head>
<body>
<%@include file="../member/member_top.jspf"%>

<!-- middle 시작 -->
<div class="middle_info_modify_div">
	<form id="info_modify_form" action="memberInfoModify" method="POST" name="info_modify_form">
		<div class="info_modify_div">
			<div class="info_modify_title_div">
				<a>회원정보 수정</a>
			</div>
			
				<div class="info_modify_id_div">
					<div class="info_modify_a_div">
						<a>아이디</a>
					</div>
					<div class="info_modify_input_div">
						<input class="mem_id" id="mem_id" type="text" name="mem_id" value="${sessionScope.signIn.mem_id}" readonly>
					</div>
				</div>
	
				<div class="info_modify_email_div">
					<div class="info_modify_a_div">
						<a>이메일</a>
					</div>
					<div class="info_modify_input_div">
						<input id="mem_email" type="text" name="mem_email" value="${sessionScope.signIn.mem_email}" onchange="check_email()" required>
					</div>
				</div>
				<div class="info_modify_message_div">
					<p id="info_modify_email_message_p"></p>
				</div>

				<div class="info_modify_name_div">
					<div class="info_modify_a_div">
						<a>이름</a>
					</div>
					<div class="info_modify_input_div">
						<input id="mem_name" type="text" name="mem_name" value="${sessionScope.signIn.mem_name}" readonly>
					</div>
				</div>

				<div class="info_modify_birth_date_div">
					<div class="info_modify_a_div">
						<a>생년월일</a>
					</div>
					<div class="info_modify_input_div">
						<input id="mem_birth_date" type="text" name="mem_birth_date" maxlength="6" value="${fn:substring(sessionScope.signIn.mem_birth_date,2,4)}${fn:substring(sessionScope.signIn.mem_birth_date,5,7)}${fn:substring(sessionScope.signIn.mem_birth_date,8,10)}" readonly> 
					</div>
				</div>

				<div class="info_modify__gender_div">
					<div class="info_modify_a_div">
						<a>성별</a>
					</div>
					<div class="info_modify_input_radio_div">
						<input id="mem_gender" type="radio" name="mem_gender" value="${sessionScope.signIn.mem_gender eq 'M'}" checked readonly><a>남성</a> 
						<input id="mem_gender" type="radio" name="mem_gender" value="${sessionScope.signIn.mem_gender eq 'F'}" checked readonly><a>여성</a>
					</div>
				</div>
				<div class="info_modify_phone_div">
					<div class="info_modify_a_div">
						<a>연락처</a>
					</div>
					<div class="info_modify_input_div">
						<input id="mem_phone" type="text" name="mem_phone" value="${sessionScope.signIn.mem_phone}" oninput="check_phone()" required>
					</div>
				</div>
				<div class="info_modify_message_div">
					<p id="info_modify_phone_message_p"></p>
				</div>
	
				<div class="info_modify_check_sms_div">
					<div class="info_modify_input_check_div">
						<c:choose>
						<c:when test="${sessionScope.signIn.mem_sms_check eq 'Y'}">
							<input class="law_check_box" id="mem_sms_check" type="checkbox" name="mem_sms_check" checked>
						</c:when>
						<c:otherwise>
							<input class="law_check_box" id="mem_sms_check" type="checkbox" name="mem_sms_check" value="Y">
						</c:otherwise>
						</c:choose>
					</div>
					<div class="info_modify_a_sms_div">
						<a>[선택] SMS 수신 여부</a>
					</div>
				</div>
				<div class="info_modify_check_email_div">
					<div class="info_modify_input_check_div">
						<c:choose>
						<c:when test="${sessionScope.signIn.mem_email_check eq 'Y'}">
							<input class="law_check_box" id="mem_email_check" type="checkbox" name="mem_email_check" checked>
						</c:when>
						<c:otherwise>
							<input class="law_check_box" id="mem_email_check" type="checkbox" name="mem_email_check" value="Y">
						</c:otherwise>
						</c:choose>
					</div>
					<div class="info_modify_a_email_div">
						<a>[선택] 이메일 수신 여부</a>
					</div>
				</div>
			
				<!-- 체크박스 그룹 -->
				<article>
					<div class="info_modify_Btn_div">
						<input class="info_modify_Btn" type="submit" value="수정하기">
						<button type="button" class="mypage_go_btn" onclick="location.href='./mypage'">취소</button>
					</div>
				</article>
		</div>
	</form>
</div>
<!-- middle 끝 -->

<script src="/project/resources/menu/js/menubar.js?ver=2"></script>
<%@include file="../member/member_bottom.jspf"%>