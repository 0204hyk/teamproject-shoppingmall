<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ONÓRE</title>
<link href="<%=request.getContextPath() %>/resources/mypage/css/member_info_pw_modify.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%@include file="../header.jspf"%>
</head>
<body>
<%@include file="../top.jspf"%>

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
						<input class="mem_id" id="mem_id" type="text" name="mem_id" value="${member.mem_id}" readonly>
					</div>
				</div>
	
				<div class="info_modify_email_div">
					<div class="info_modify_a_div">
						<a>이메일</a>
					</div>
					<div class="info_modify_input_div">
						<input id="mem_email" type="text" name="mem_email" value="${member.mem_email}" onchange="check_email()" required>
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
						<input id="mem_name" type="text" name="mem_name" value="${member.mem_name}" readonly>
					</div>
				</div>

				<div class="info_modify_birth_date_div">
					<div class="info_modify_a_div">
						<a>생년월일</a>
					</div>
					<div class="info_modify_input_div">
						<input id="mem_birth_date" type="text" name="mem_birth_date" maxlength="6" value="${fn:substring(member.mem_birth_date,2,4)}${fn:substring(member.mem_birth_date,5,7)}${fn:substring(member.mem_birth_date,8,10)}" readonly> 
					</div>
				</div>

				<div class="info_modify__gender_div">
					<div class="info_modify_a_div">
						<a>성별</a>
					</div>
					<div class="info_modify_input_radio_div">
						<input id="mem_gender" type="radio" name="mem_gender" value="${member.mem_gender eq 'M'}" checked readonly><a>남성</a> 
						<input id="mem_gender" type="radio" name="mem_gender" value="${member.mem_gender eq 'F'}" checked readonly><a>여성</a>
					</div>
				</div>
				<div class="info_modify_phone_div">
					<div class="info_modify_a_div">
						<a>연락처</a>
					</div>
					<div class="info_modify_input_div">
						<input id="mem_phone" type="text" name="mem_phone" value="${member.mem_phone}" onchange="check_phone()"required>
					</div>
				</div>
				<div class="info_modify_message_div">
					<p id="info_modify_phone_message_p"></p>
				</div>
	
				<div class="info_modify_check_sms_div">
					<div class="info_modify_input_check_div">
						<input class="law_check_box" id="mem_sms_check" type="checkbox" name="mem_sms_check" value="Y" ${member.mem_sms_check == 'Y' ? 'checked' : ''}>
					</div>
					<div class="info_modify_a_sms_div">
						<a>[선택] SMS 수신 여부</a>
					</div>
				</div>
				
			<div class="info_modify_check_email_div">
					<div class="info_modify_input_check_div">
						<input class="law_check_box" id="mem_email_check" type="checkbox" name="mem_email_check" value="Y" ${member.mem_email_check == 'Y' ? 'checked' : ''}>
					</div>
					<div class="info_modify_a_email_div">
						<a>[선택] 이메일 수신 여부</a>
					</div>
				</div>
			
				<!-- 체크박스 그룹 -->
				<article>
					<div class="info_modify_Btn_div">
						<input id="info_modify_Btn" class="info_modify_Btn" type="submit" onclick="check()" value="수정하기">
						<button type="button" class="mypage_go_btn" onclick="location.href='./mypage'">취소</button>
					</div>
				</article>
		</div>
	</form>
</div>
<!-- middle 끝 -->

<script type="text/javascript" src="<%=request.getContextPath() %>/resources/mypage/js/member_info_modify.js"></script>
<script src="<%=request.getContextPath() %>/resources/menu/js/menubar.js"></script>
<%@include file="../bottom.jspf"%>